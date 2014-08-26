---
layout: post
title: Analysing Kings with Go
---

The card game I know as *Kings* has been played in my family for
many years. It is a form of solitaire (or, in more British phrasing,
patience) in that it is a one-player game, though quite different from
the one bundled in a well-known operating system for many years, and,
if my Internet searching is to be believed, is not known anywhere else
in the world.

Now I am not so naïve as to think that my family has invented this
version of *Kings*, but for the benefit of those who are not familiar
it, I shall explain the rules. A standard 52-card deck of playing cards
is used, with aces considered low. Each 'round' consists of dealing out
four cards onto four fixed piles, followed by repeatedly discarding all
cards 'beaten' by a higher card of the same suit. A king may be moved
from the top of a pile onto an empty slot, and the aim is to finish with
all cards except the four kings discarded, and each king left comprising
his own pile.

For example, suppose the first deal gives `2C 6S 5D 4H`
[^card-shorthand]. These are all different suits, so no discarding
is possible. The next deal might be `2S 5H AD QH`. Now there are two
Hearts showing, so the lower one, the Five, is discarded. This reveals
the Six of Spades, which beats the Two, so that is discarded. Now there
are four different suits on show again, so the next round of cards is
dealt. Play continues in this manner in theory until all the cards are
dealt out. However, there are some cases (such as a Queen being placed
above a King of the same suit) where it is possible to tell immediately
that a win cannot happen.



Historically we have found this to be a very 'hard' game, and 'getting
*Kings* out' has always been a newsworthy event within the family. But
how can we quantify 'hard', and is it really any worse than other card
games? The way that immediately came to mind was to write a piece of
software to play the game repeatedly and see how often it won.

The full source code I wrote for this (a couple of years ago now)
is available in a [Github gist][gist], though I shall reproduce parts
of it here as I discuss it. It is written in [Go], a language that in
the last few years has mostly supplanted [Python] as my 'default' one,
though in turn that place may now be going to [Haskell]. Hopefully the
syntax is simple enough that little special explanation is needed.

Let's step through the code a section at a time:

{% highlight go %}
package main

import (
	"flag"
	"fmt"
	"io"
	"io/ioutil"
	"math/rand"
	"os"
	"runtime"
	"strconv"
	"time"
)
 
const (
	NumSuits = 4
	NumRanks = 13
	NumCards = NumSuits * NumRanks
)
 
func init() { rand.Seed(time.Now().Unix()) }
{% endhighlight %}

We do all of our library imports and set up some constants, just in
case we ever feel like doing analysis of non-standard deck types. We
also set up the random number generator with a non-repeating seed. We
will discuss the RNG a little later on; those of you who have spotted
a possible problem can give yourselves a pat on the back.


[^card-shorthand]:
   By `2C` we mean the Two of Clubs, and by `QH` the Queen of Hearts, and so on.

[gist]: https://gist.github.com/jshholland/3659087
[Go]: http://golang.org/
[Python]: https://www.python.org/
[Haskell]: http://www.haskell.org/haskellwiki/Haskell
