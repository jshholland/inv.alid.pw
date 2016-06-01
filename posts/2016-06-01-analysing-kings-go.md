---
title: Analysing Kings with Go
---

# Background

The card game I know as *Kings* has been played in my family for many
years.  It is a form of solitaire (or, in more British phrasing,
patience) in that it is a one-player game, though quite different from
better-known ones, whose aim is to move cards from some tableau onto
suit piles, and, if my Internet searching is to be believed, is not
known anywhere else in the world.

It seems very unlikely that my family has invented this version of
*Kings*, but for the benefit of those who are not familiar with it, I
will explain how it is played.  A standard 52-card deck of playing
cards is used, with aces considered low.  Each 'round' consists of
dealing out four cards onto four fixed piles, followed by repeatedly
discarding all cards 'beaten' by a higher card of the same suit.  A
king may be moved from the top of a pile onto an empty slot, and the
aim is to finish with all cards except the four kings discarded, and
each king left comprising his own pile.

For example, suppose the first deal gives `2C 6S 5D 4H`
[^card-shorthand].  These are all different suits, so no discarding is
possible.  The next deal might be `2S 5H AD QH`. Now there are two
Hearts showing, so the lower one, the Five, is discarded.  This
reveals the Six of Spades, which beats the Two, so that is discarded.
Now there are four different suits on show again, so the next round of
cards is dealt.  Play continues in this manner in theory until all the
cards are dealt out.  However, there are some cases (such as a Queen
being placed above a King of the same suit) where it is possible to
tell immediately that a win cannot happen.

Historically we have found this to be a very 'hard' game, and 'getting
*Kings* out' has always been a newsworthy event within the family.
But how can we quantify 'hard', and is it really any worse than other
card games?  The way to answer these questions that immediately came
to mind was to write a piece of software to play the game repeatedly
and see how often it won.

#

The full source code I wrote for this (a couple of years ago now) is
available in a [Github gist][gist], though I shall reproduce parts of
it here as I discuss it.  It is written in [Go], a language that in
the last few years has mostly supplanted [Python] as my 'default' one,
though in turn that place may now be going to [Haskell].  Hopefully
the syntax is simple enough that little special explanation is needed.

Let's step through the code a section at a time:

~~~go
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
~~~

We do all of our library imports and set up some constants, just in
case we ever feel like doing analysis of non-standard deck types.  We
also set up the random number generator with a non-repeating seed.  We
will discuss the RNG a little later on; those of you who have spotted
a possible problem can give yourselves a pat on the back.  For now,
let's move on to the next bit of code.

~~~go
type Card struct {
	Rank
	Suit
}

func (c Card) String() string {
	return fmt.Sprintf("%v of %v", c.Rank, c.Suit)
}

// Rank represents the face value of a card (e.g. Ace, 5, Jack).
type Rank uint8

func (r Rank) String() string {
	switch r {
	case Ace:
		return "Ace"
	case Jack:
		return "Jack"
	case Queen:
		return "Queen"
	case King:
		return "King"
	}
	return fmt.Sprint(uint8(r))
}

// These constants are for referring to named cards symbolically
// instead of by numerical values.
const (
	Ace   Rank = 1
	Jack  Rank = 11
	Queen Rank = 12
	King  Rank = 13
)
~~~

The definition of a `Card` uses Go's syntax for an *embedded field*,
also called an *anonymous field*.  The relevant part of the language
spec is [this][golang-embed], but in this case it's essentially
laziness on my part to avoid declaring the fields as `rank Rank`,
since there are not any interesting methods defined on `Rank` or
`Suit` (defined in the next code listing).

We define `String` methods on the types so that Go knows how to format
and print them out nicely, and define some constants so we can refer
to ranks of cards by name.  Note we also encode the 'ace low' rule
here.

It might be more idiomatic to use zero based indexing.  Typically Go
good practice is to use the 'zero value' (in this case, for the
wrapped `uint8` type, number `0`) as a useful default, so that
declarations like `var buf bytes.Buffer` can be used without further
initialisation.  However, it just seems perverse to have the numeric
value 5 represent the card with face value 6, or to have gaps in the
sequence of integers representing ranks.

~~~go
// Suit represents the suit of a card.
type Suit uint8

func (s Suit) String() string {
	switch s {
	case Clubs:
		return "Clubs"
	case Diamonds:
		return "Diamonds"
	case Spades:
		return "Spades"
	case Hearts:
		return "Hearts"
	}
	panic("unreachable")
}

const (
	Clubs Suit = iota
	Diamonds
	Spades
	Hearts
)
~~~

This defines our `Suit` type.  Like `Rank`, it is just a wrapped
unsigned 8-bit integer.  In this case we will refer only to it by the
constants. These are assigned using [Go's `iota` syntax][golang-iota],
which is a clever way of setting up related integer constants.  It is
set to `0` at the start of each `const` declaration, and is
incremented by one after each individual statement.  It may be used
freely in expressions, and its power is multiplied by the implicit
repetition of definitions within `const` blocks.  Here, we just use it
so that `Clubs` is set to `0`, `Diamonds` to `1`, and so on.

Our constants `Ace`, `Jack`, `Queen`, `King` and `Clubs`, `Diamonds`,
`Spades`, `Hearts` are explicitly typed.  Otherwise, they would be
examples of Go's *untyped integer constants*, which are explained far
better than I ever could in [this blog post][golang-const] by Rob Pike
on the official Go blog.


[^card-shorthand]:
    By `2C` we mean the Two of Clubs, and by `QH` the Queen of Hearts,
    and so on.

[gist]: https://gist.github.com/jshholland/3659087
[Go]: http://golang.org/
[Python]: https://www.python.org/
[Haskell]: http://www.haskell.org/haskellwiki/Haskell
[golang-embed]: http://golang.org/ref/spec#Struct_types
[golang-iota]: http://golang.org/ref/spec#Iota
[golang-const]: http://blog.golang.org/constants
