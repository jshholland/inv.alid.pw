---
title: Hakyll clean URLs and feeds
published: 2018-03-18
---

I've just finished adding [Atom] and [RSS] feeds to this website.
While Hakyll provides (excellent) [built-in support] for feeds, the
way I've set up clean URLs to avoid `.html` suffixes everywhere
(inspired by/ripped off from [Rohan Jain]) initially didn't quite work
right with it, so I'll document how I fixed this below.

In the original method, clean URLs are implemented in two parts: first
`cleanRoute` routes `foo.md` to `foo/index.html`, and then
`cleanIndexUrls` rewrites internal links to remove all the
`index.html` suffixes; see the post for more details.  Up to now, this
worked well enough, but when the feeds are generated, `index.html` is
left in the links, and on closer inspection, it's missing the point
somehow.  Hakyll URLs are generated via the `url` field attached to
`defaultContext`, which eventually comes from the following:

```
urlField :: String -> Context a
urlField key = field key $
    fmap (maybe empty toUrl) . getRoute . itemIdentifier
```

So we can see that it all comes down to the `Route` of the item.  In
the case of `cleanRoute`, this is going to include the `index.html`.
Rather than including this in the URLs and then stripping them out
later with `cleanIndexUrls`, it seems much cleaner to redefine the
`url` field in the context to something more canonically correct.
Thus:
```
cleanUrlField :: String -> Context a
cleanUrlField key = field key $
  fmap (maybe empty (cleanIndex . toUrl)) .
  getRoute .
  itemIdentifier

myContext :: Context String
myContext =
  cleanUrlField "url" <>
  defaultContext
```

With this change, we don't need to run `cleanIndexUrls` any more, and
the feed generator code picks up the correct URL to place in the Atom
and RSS feeds.  You can see the full `site.hs` file with these changes
[here].

[Atom]: /atom.xml
[RSS]: /rss.xml
[built-in support]: https://jaspervdj.be/hakyll/tutorials/05-snapshots-feeds.html
[Rohan Jain]: https://www.rohanjain.in/hakyll-clean-urls/
[here]: https://github.com/jshholland/inv.alid.pw/blob/e79075b032b412b101b5cecbeb706fef13771e74/site.hs
