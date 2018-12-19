--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Control.Applicative
import Control.Monad
import Data.List
import Data.Maybe
import Data.Monoid
import Hakyll hiding (pandocCompiler)
import Text.Pandoc
import System.FilePath

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith conf $ do
  match staticFiles $ do
    route   idRoute
    compile copyFileCompiler

  match "index.md" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/index.html"
            (listField "posts" postCtx (take 5 <$> (loadAll "posts/**.md" >>= recentFirst)) <>
             myContext)
      >>= loadAndApplyTemplate "templates/default.html" myContext
      >>= relativizeUrls

  create ["posts/index.html"] $ do
    route idRoute
    compile $ makeItem ""
      >>= loadAndApplyTemplate "templates/archives.html"
            (listField "posts" postCtx (loadAll "posts/**.md" >>= recentFirst) <>
             myContext)
      >>= loadAndApplyTemplate "templates/default.html"
            (constField "title" "Post archive" <>
             myContext)
      >>= relativizeUrls


  matchMetadata "posts/**.md" isPublished $ do
    route cleanRoute
    compile $ pandocCompiler
      >>= saveSnapshot "content"
      >>= loadAndApplyTemplate "templates/post.html"    postCtx
      >>= loadAndApplyTemplate "templates/default.html" postCtx
      >>= relativizeUrls

  match "*.md" $ do
    route cleanRoute
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" myContext
      >>= relativizeUrls

  match "templates/*" $ compile templateBodyCompiler

  create ["atom.xml"] $ do
    route idRoute
    compile $ do
      let feedCtx = postCtx <> bodyField "description"
      posts <- fmap (take 10) . recentFirst =<< loadAllSnapshots "posts/**.md" "content"
      renderAtom feedConfiguration feedCtx posts

  create ["rss.xml"] $ do
    route idRoute
    compile $ do
      let feedCtx = postCtx <> bodyField "description"
      posts <- fmap (take 10) . recentFirst =<< loadAllSnapshots "posts/**.md" "content"
      renderRss feedConfiguration feedCtx posts

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "dateiso8601" "%F" <>
  dateField "date" "%e %B %Y" <>
  myContext

myContext :: Context String
myContext =
  cleanUrlField "url" <>
  defaultContext

-- https://www.rohanjain.in/hakyll-clean-urls/
cleanRoute :: Routes
cleanRoute = customRoute createIndexRoute
  where createIndexRoute ident =
          let p = toFilePath ident
          in takeDirectory p </> takeBaseName p </> "index.html"

cleanUrlField :: String -> Context a
cleanUrlField key = field key $
  fmap (maybe empty (cleanIndex . toUrl)) . getRoute . itemIdentifier

cleanIndex :: String -> String
cleanIndex url
  | idx `isSuffixOf` url = take (length url - length idx) url
  | otherwise            = url
  where idx = "index.html"

isPublished :: Metadata -> Bool
isPublished = isJust . lookupString "published"

pandocCompiler :: Compiler (Item String)
pandocCompiler = pandocCompilerWith readOpts writeOpts
  where readOpts = defaultHakyllReaderOptions
        writeOpts = defaultHakyllWriterOptions
          { writerHTMLMathMethod = MathJax "/js/MathJax.js"
          }

conf :: Configuration
conf = defaultConfiguration
  { deployCommand = "rsync -rvz --delete --exclude-from=.rsync-ignores _site/ inv.alid.pw:/srv/inv.alid.pw/"
  , ignoreFile = ignoreFile'
  }

ignoreFile' :: FilePath -> Bool
ignoreFile' path
      | "#"    `isPrefixOf` fileName = True
      | "~"    `isSuffixOf` fileName = True
      | ".swp" `isSuffixOf` fileName = True
      | otherwise                    = False
    where
      fileName = takeFileName path

staticFiles :: Pattern
staticFiles = foldl1 (.||.)
  [ "robots.txt"
  , "css/**"
  , "js/**"
  , "img/**"
  , ".well-known/keybase.txt"
  ]

feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration
  { feedTitle = "inv.alid.pw"
  , feedDescription = ""
  , feedAuthorName = "Josh Holland"
  , feedAuthorEmail = "josh@inv.alid.pw"
  , feedRoot = "https://inv.alid.pw"
  }
