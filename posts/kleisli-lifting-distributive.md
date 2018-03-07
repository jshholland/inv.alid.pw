---
title: Lifting monads to Kleisli categories with distributive laws
published: 2018-03-07
---

It seems my first non-trivial post on my new website is going to be
something fairly technical and likely not of any interest to anyone in
particular.  However, it's related to something I'm working on at the
moment, and a little perfunctory searching seems to indicate that
there's some sort of hole in the literature here, at least as far as
my understanding goes.  This is partly also a means to justify my
faffing about to get MathJax working on this site.  I assume
familiarity with functors and natural transformations, but not much
category theory beyond that.

A monad (on some category \\( \\mathcal{C} \\) ), historically also
known as a triple, consists of three pieces of data:

1. a functor \\( T : \\mathcal{C} \\rightarrow \\mathcal{C} \\);
2. a natural transformation \\( \\eta = \\eta^T : 1 \\rightarrow T \\)
   called the *unit*; and
3. a natural transformation \\( \\mu = \\mu^T: TT \\rightarrow T \\)
   called *multiplication*

such that \\( \\mu \\circ T\\mu = \\mu \\circ \\mu T \\)
(associativity) and \\( \\mu \\circ T \\eta = \\mu \\circ \\eta T = 1
\\) (unit law), famously summarised as "a monad is a monoid in the
category of endofunctors"[^1].  Given a monad \\(
T \\), we may form its *Kleisli category* \\( \\mathbf{Kl}(T) \\),
which has the same objects as the underlying category and where an
arrow \\( X \\nrightarrow Y \\) is a \\( \\mathcal{C} \\)-arrow \\( X
\\rightarrow TY \\).  I'll use this different notation because it's
important to keep straight the distinction between arrows in the
underlying category and the Kleisli category.  The identities are
given by the unit maps \\( \\eta_X \\) and composition of \\(f: X
\\nrightarrow Y\\) and \\(g: Y \\nrightarrow Z\\) uses the
multiplication:

\\[
X \\xrightarrow{f} TY \\xrightarrow{Tg} TTZ \\xrightarrow{\\mu_Z} TZ
\\]

This construction is well-known from its use in functional
programming to model effects.

[^1]: [what's the problem?]

Distributive laws come up a lot in the world of string diagrams and
SMTs, where we use them to combine two theories together subject to
some laws governing their interaction.  The most familiar example of a
distributive law is multiplication over addition: \\[ a(b + c) = ab +
ac \\] [Beck] (p95) extended the notion to monads, defining a law
distributing a monad \\(S\\) over a monad \\(T\\) to be a natural
transformation \\(\\lambda: ST \\rightarrow TS\\) satisfying certain
coherence laws.  In the paper, he in fact gives a way to recover the
multiplication/addition law back from this construction, which is
pretty cool.

The main theorem related to distributive laws of monads, is the
equivalence of

1. a distributive law of \\(S\\) over \\(T\\);
2. a coherent multiplication on \\(TS\\);
3. a lifting of \\(T\\) to the category of \\(S\\)-algebras (which I
   haven't introduced, since it isn't really relevant to this post); and
4. a lifting of \\(S\\) to the Kleisli category of \\(T\\).

Now, this certainly is true, but this is where the hole appears.
Beck's original paper omits this last condition (perhaps because
Kleisli categories weren't widespread back then?).  On the other hand,
[Cheng] implicitly assumes the result for Kleisli categories.  I have
a feeling that it possibly follows out of the treatment of adjoint
functors in Section 3 in the Beck paper, but I can't quite get my head
around it, and in any case I needed to write the construction down
from first principles for my application.

To warm up, let's look at the most well-known use for a distributive
law \\(\\lambda : ST \\to TS\\): giving the composite \\(TS\\) a monad
structure.  Simply composing the units \\(\\eta^T \\circ \\eta^S \\)
gives a natural transformation which will be the unit of the composite
monad, but the bit which actually requires a distributive law is
defining a multiplication \\(\\mu^{TS} : TSTS \\rightarrow TS \\).
It's one of those times when there's essentially only one thing you
can write down, and that is exactly what you need:

\\[
TSTS \\xrightarrow{T \\lambda S} TTSS \\xrightarrow{\\mu^T \\mu^S} TS
\\]

and all the relevant coherence conditions match up to satisfy the
monad laws.

For the Kleisli category, we need to define a monad \\(\\tilde{S}\\)
on \\(\\mathbf{Kl}(T)\\).  Even just to define the functor part we
already need the distributive law: the objects are the same, but for a
map \\(f: X \\nrightarrow Y\\), we need to define

\\[
\\tilde{S}f: SX \\rightarrow TSY =
SX \\xrightarrow{Sf} STY \\xrightarrow{\\lambda_Y} TSY
\\]

So handwaving over the proofs that this is a proper functor, we now
just need a unit and multiplication.  The unit is again just a
composite of the constituent units:
\\[
\\eta_X: X \\nrightarrow \\tilde{S}X =
X \\xrightarrow{\\eta^S_X} SX \\xrightarrow{\\eta^T_{SX}} TSX
\\]
and the multiplication is a little more fiddly, but still
straightforward:
\\[
\\mu_X: \\tilde{S}\\tilde{S}X \\nrightarrow \\tilde{S}X =
SSX \\xrightarrow{\\mu^S_X} SX \\xrightarrow{S\\eta^T_X} STX
\\xrightarrow{\\lambda_X} TSX
\\]
And, again glossing over all the annoying coherence proofs, we're
done!

There are quite a few pieces I've left out of all of this, notably
going back the other way, from a lifting of \\(S\\) to
\\(\\mathbf{Kl}(T)\\) to a distributive law \\(ST \\rightarrow TS\\),
and most of the verifications that all these things satisfy the laws
they are supposed to, but this is mostly what I wanted to figure out.
Hopefully it's useful to someone other than me.  Any mistakes or
comments, send me an email or tweet and I'd be happy to discuss.


[Cheng]: https://arxiv.org/abs/1112.3076
[Beck]: http://www.tac.mta.ca/tac/reprints/articles/18/tr18abs.html
[Lack]: http://www.tac.mta.ca/tac/volumes/13/9/13-09abs.html
[what's the problem?]: http://james-iry.blogspot.co.uk/2009/05/brief-incomplete-and-mostly-wrong.html
