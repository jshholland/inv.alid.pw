---
title: Three ways to check whether a file is ASCII-only
published: 2018-10-19
---

I have a 5k line LaTeX file, and I wasn't sure whether it contained
any non-ASCII characters.  I'm using LuaLaTeX to compile it, which
supports UTF-8, so just running pdfLaTeX on it is not a solution, and
it would be nice to have a method that works on any text file.

The first tool any seasoned Unix admin reaches for to answer the
question "Does a particular character occur in a text file?" is, of
course, `grep`.  The man pages don't list a built-in character class
right away for ASCII characters, so a tiny bit of ingenuity is
required.  [This Stack Overflow answer][SO] gives a command which
almost works (in my testing it found the "ï" of "naïve" but missed the
"ń" in a Polish name), but it's easily modified into the following:

    grep -P '[^\x00-\x7f]' myfile.tex

Having the full scope of Perl-compatible regexes available means we
could use the (slightly more memorable) `[^[:ascii:]]`.

The second is a less well-known part of the standard Unix toolbox,
`iconv`.  Its primary purpose is to convert between text encodings,
but we can abuse it to detect non-ASCII characters by asking it to
convert our file into ASCII and seeing if it gives any errors:

    iconv -t ASCII myfile.tex > /dev/null

Finally, trusty old `file` will tell us the encoding used, and is
probably the easiest one to remember:

    file myfile.tex


[SO]: https://stackoverflow.com/questions/3001177/how-do-i-grep-for-all-non-ascii-characters
