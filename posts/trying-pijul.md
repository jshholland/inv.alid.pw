---
title: Trying out Pijul
published: 2019-01-23
---

[Pijul] is a version control system.  So what?  Everyone just uses
[git] nowadays, right?  Well, I personally already use git,
[Mercurial] (because its model of pull/update makes more sense to me)
and svn (because sometimes it's just not worth it).  So a fourth VCS
is hardly a major marginal cost.

Besides, Pijul is interesting in a lot of ways.  Git and Mercurial
work very hard to pretend that patches are the basic unit, but in
reality they store snapshots of files.  In Pijul, patches really are
fundamental; it is based on "patch theory", pioneered by [Darcs],
another obscure VCS I've flirted with in the past.  As one may expect
from a Haskell project, patch theory is an application of category
theory to a software engineering problem.  This isn't just abstract
nonsense for the sake of fulfilling Haskeller stereotypes: patch
theory is more intuitive (which is why other systems fake it in the
UI), and makes both [cherry-picking] and [merges] easier.

Pijul has not (at the time of writing) had a 1.0 release yet, but it's
[self-hosting]; impressively so, with its own "[Nest]" GitHub-alike
that's remarkably feature complete for such a young project.  The
documentation, like that of many similar hobbyist FOSS projects, is a
little bit lacking---parts are out of date and it's spread across a
manual, README files and replies on the Discourse forum---but I've seen
worse and a little reference to the source combined with educated
guesswork seems to have been sufficient so far.

The main use I have in mind in particular for Pijul is to control my
various dotfiles: configuration for i3, emacs, zsh, etc.  At the
moment they use [vcsh] which is horrendous overkill to the point where
I never remember to commit or push anything.  The other problem I have
is maintaining parallel configuration across various different
computers.  For example, I want wifi and battery status indicators on
my laptop, but not on my desktop.  I haven't found a satisfactory way
to keep these parts of the configuration separate while syncing
unrelated changes between the computers.  I believe that it should be
a lot smoother with patch theory.  A new feature of the latest 0.11
release, partial clones, may well also be useful.

There are a lot of features missing: ignore files come immediately to
mind, as running `pijul status` in my home directory shows a *lot* of
junk I don't want in the VCS.  As far as I can tell, it's also
impossible to see the contents of a patch, or show diffs in `pijul
log` output. And the docs are quite unclear on a lot of important
questions.  How do branches work?  There are [some] [discussions] in
the forums, but I can't tell what's ideas to be implemented, what's
newcomers asking questions and what's how it actually works.  I'll
post my issues into the forum, and I hope that I'll be able to help
transfer the answers into the official docs.


[Pijul]: https://pijul.org/
[Darcs]: http://darcs.net/
[Mercurial]: https://www.mercurial-scm.org/
[git]: https://git-scm.com/
[merges]: https://tahoe-lafs.org/~zooko/badmerge/simple.html
[cherry-picking]: https://pijul.org/faq/#cherrypicking
[Nest]: https://nest.pijul.com/
[self-hosting]: https://nest.pijul.com/pijul_org/pijul
[vcsh]: https://github.com/RichiH/vcsh
[some]: https://discourse.pijul.org/t/a-composable-pijul-user-interface-brainstorm/100/7
[discussions]: https://discourse.pijul.org/t/spontaneous-non-branching-vs-tree-style-branches/47
