--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Control.Monad
import Data.List
import Data.Monoid
import Hakyll
import System.FilePath

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
  match staticFiles $ do
    route   idRoute
    compile copyFileCompiler

  match "index.md" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/index.html"
            (listField "posts" postCtx (take 5 <$> (loadAll "posts/**.md" >>= recentFirst)) <>
             defaultContext)
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= fixUrls

  create ["posts/index.html"] $ do
    route idRoute
    compile $ makeItem ""
      >>= loadAndApplyTemplate "templates/archives.html"
            (listField "posts" postCtx (loadAll "posts/**.md" >>= recentFirst) <>
             defaultContext)
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= fixUrls


  match "posts/**.md" $ do
    route cleanRoute
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/post.html"    postCtx
      >>= loadAndApplyTemplate "templates/default.html" postCtx
      >>= fixUrls

  match "*.md" $ do
    route cleanRoute
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= fixUrls

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%e %B %Y" <>
  defaultContext

-- https://www.rohanjain.in/hakyll-clean-urls/
cleanRoute :: Routes
cleanRoute = customRoute createIndexRoute
  where createIndexRoute ident =
          let p = toFilePath ident
          in takeDirectory p </> takeBaseName p </> "index.html"

cleanIndexUrls :: Item String -> Compiler (Item String)
cleanIndexUrls = return . fmap (withUrls cleanIndex)

cleanIndexHtmls :: Item String -> Compiler (Item String)
cleanIndexHtmls = return . fmap (replaceAll "/index.html" $ const "/")

cleanIndex :: String -> String
cleanIndex url
  | idx `isSuffixOf` url = take (length url - length idx) url
  | otherwise            = url
  where idx = "index.html"

fixUrls :: Item String -> Compiler (Item String)
fixUrls = relativizeUrls >=> cleanIndexUrls

staticFiles :: Pattern
staticFiles = foldl1 (.||.)
  [ "robots.txt"
  , "css/**"
  , "js/**"
  , "fonts/**"
  , "img/**"
  , ".well-known/keybase.txt"
  ]
