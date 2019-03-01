---
title: "Worstsort revisited: Is Haskell's type system stronger?"
---

[My recent post] about worstsort has a problem: the code doesn't
actually work at all.  I first had issues when I was rejigging it to
fit the API of the [sorting] crate, and then when adding tests.  [The
latest code] on Pijul Nest has the tests, so you can download it and
play along at home:
```
$ cargo build
   Compiling worstsort v0.1.0 (/home/josh/r/worstsort)
    Finished dev [unoptimized + debuginfo] target(s) in 0.21s
$ cargo test
   Compiling worstsort v0.1.0 (/home/josh/r/worstsort)
error: reached the recursion limit while instantiating `badsort::<s
td::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Ve
c<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec:
:Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::v
ec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std
::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<
std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::V
ec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec
::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::
vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<st
d::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec
<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::
Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::ve
c::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std::vec::Vec<std:
:vec::Vec<std::vec::Vec<std::vec::Vec<i32>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>`
  --> src/lib.rs:30:1
   |
30 | / pub fn badsort<T: Ord + Clone>(k: usize, l: &mut [T]) {
31 | |     if k == 0 {
32 | |         bubblesort(l);
33 | |     } else {
...  |
37 | |     }
38 | | }
   | |_^

error: aborting due to previous error

error: Could not compile `worstsort`.

To learn more, run the command again with --verbose.
```
That's quite an error!  I posted this problem on [Stack Overflow] and
got some interesting replies.

To explain what's going on, remember how [Rust generics] work.  The
key idea is _monomorphisation_: the compiler generates specialised
code essentially by copy-and-pasting for every type a generic function
is called with[^1].  Let's do this by hand.  If we aren't compiling in
testing mode, `badsort` is never called, so the compiler doesn't have
to generate any code for it.  In `tests::badsort_zero`, the type `T`
is instantiated as `Vec<i32>`, so the compiler has to produce code for
`badsort_veci32`.  As it does that, it encounters another call to
`badsort`, but this time it's on the _permutations_ of the list, so
`T` is now `Vec<Vec<i32>>`.  This means it has to generate
`badsort_vecveci32`, and then from there it will keep going forever.

So, there are two key questions: why was this _not_ a problem for
Haskell, and is there a way to get round it in Rust?

[^1]: I'm glossing over trait bounds since they aren't relevant for
    this problem.

[My recent post]: /posts/worstsort-rust
[Stack Overflow]: https://stackoverflow.com/questions/54943698/recursion-limit-when-instantiating-unused-rust-type
[sorting]: https://crates.io/crates/sorting
[The latest code]: https://nest.pijul.com/jshholland/worstsort:master/9412043f2654c51317
[Rust generics]: https://doc.rust-lang.org/book/ch10-01-syntax.html
