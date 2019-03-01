---
title: Worstsort in Rust
published: 2019-02-28
---

[Brent Yorgey] shares a fun 2012 [paper] by Miguel A. Lerma about the
worst possible^[non-pathological: we aren't interested in algorithms
which just loop pointlessly] sorting algorithm, along with a cute
Haskell implementation.  The algorithm depends on a function \\(f:
\\mathbb{N} \\to \\mathbb{N}\\) and runs in \\(\\Omega(f(n))\\) time;
in other words, we can take at least as long as _any_ computable
function (in fact, much much longer).

Naturally I felt compelled to write up [an implementation] in my new
favourite language, [Rust].  It's not quite as slick as the Haskell
one, partly because I didn't 'cheat' and use a standard library
implementation of `permutations` and chose to follow the paper more
closely in using Bubblesort rather than insertion sort, but mostly
because Rust is more verbose with things like curly brackets than
Haskell and doesn't allow point-free style.

Here's the business part of the code:
```rust
pub fn badsort<T: Ord + Clone>(k: usize, l: &mut [T]) {
    if k == 0 {
        bubblesort(l);
    } else {
        let mut p = permutations(l);
        badsort(k - 1, &mut p);
        l.clone_from_slice(&p[0]);
    }
}

pub fn worstsort<T, F>(l: &mut [T], f: F)
where
    T: Ord + Clone,
    F: FnOnce(usize) -> usize,
{
    badsort(f(l.len()), l);
}
```
`worstsort` runs in \\(\\Omega((n!^{(f(n))})\^2) \\) time, where
\\(n!^{(k)}\\) abbreviates taking the factorial \\(k\\) times.
Pretty impressive for just 15 lines, about half of which is
boilerplate!

I should probably submit this as a PR to the [sorting] crate...

[nest]: https://nest.pijul.com/jshholland/worstsort
[Brent Yorgey]: https://byorgey.wordpress.com/2019/02/16/worstsort/
[paper]: https://sites.math.northwestern.edu/~mlerma/papers/inefficient_algorithms.pdf
[Rust]: https://www.rust-lang.org/
[an implementation]: https://nest.pijul.com/jshholland/worstsort
[sorting]: https://crates.io/crates/sorting
