--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Data.List
import Data.Monoid
import Hakyll
import System.FilePath

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
  match "robots.txt" $ do
    route   idRoute
    compile copyFileCompiler

  match "css/**" $ do
    route   idRoute
    compile compressCssCompiler

  match "js/**" $ do
    route idRoute
    compile copyFileCompiler

  match "index.md" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/index.html"
            (listField "posts" postCtx (take 5 <$> (loadAll "posts/**.md" >>= recentFirst)) <>
             defaultContext)
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls
      >>= cleanIndexUrls

  create ["posts/index.html"] $ do
    route idRoute
    compile $ makeItem ""
      >>= loadAndApplyTemplate "templates/archives.html"
            (listField "posts" postCtx (loadAll "posts/**.md" >>= recentFirst) <>
             defaultContext)
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls
      >>= cleanIndexUrls


  match "posts/**.md" $ do
    route cleanRoute
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/post.html"    postCtx
      >>= loadAndApplyTemplate "templates/default.html" postCtx
      >>= relativizeUrls
      >>= cleanIndexUrls

  match "*.md" $ do
    route cleanRoute
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/page.html" defaultContext
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls
      >>= cleanIndexUrls

  match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y" <>
  defaultContext

-- https://www.rohanjain.in/hakyll-clean-urls/
cleanRoute :: Routes
cleanRoute = customRoute createIndexRoute
  where createIndexRoute ident =
          let p = toFilePath ident
          in takeDirectory p </> takeBaseName p </> "index.html"

cleanIndexUrls :: Item String -> Compiler (Item String)
cleanIndexUrls           = return . fmap (withUrls cleanIndex)

cleanIndexHtmls :: Item String -> Compiler (Item String)
cleanIndexHtmls          = return . fmap (replaceAll "/index.html" $ const "/")

cleanIndex :: String -> String
cleanIndex url
  | idx `isSuffixOf` url = take (length url - length idx) url
  | otherwise            = url
  where idx = "index.html"
