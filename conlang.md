# The first one

This thing is mostly for me to explore some ideas: hanging
grammar/meaning on long/short vowels/fricatives, as well as possibly
initial consonant mutations (guess who's been learning Welsh
recently).  I'm also interested in coming up with a script for it that
leverages its really restricted syllable structure.  It's not going to
be remotely naturalistic.

For totally legit reasons, this language is obsessed with the
number 12.  So duodecimal numbers, twelve initial consonants, twelve
vowels, twelve final consonants (and luckily Western notions of time
fit reasonably well into this paradigm, weeks notwithstanding; thanks
Babylonians).  So if you want to complain about k/q then suck it up.
(Or just suggest a better stop.  I'm worried about not having enough
space to come up with vocabulary given the restrictive phonotactics if
I cut a place of articulation.)

«Guillemets» indicate fragments of the language and [square brackets]
are a vague IPA transcription.

## Phonology

All content words consist of syllables of the form CVC, where the
first consonant is always a stop or affricate and the final is always
a fricative.

### Initial consonants

These have a voiceless and voiced series, depending on grammatical
context:

|           |     |     |      |        |      |          |
|-----------+-----+-----+------+--------+------+----------|
| voiceless | «p» | «t» | «ch» | «k»    | «q»  | «h»      |
|           | [p] | [t] | [tʃ] | [k~c]  | [q]  | [h], [ʔ] |
| voiced    | «b» | «d» | «j»  | «g»    | «qh» | «y»      |
|           | [b] | [d] | [dʒ] | [g~~ɟ] | [ɢ]  | [j]      |

«k» and «g» are more palatal than their English equivalents, so that
they are more distinct from «q» and «qh».  «h» is realised as a
glottal stop word-initially but [h] medially; its voiced version is
exceptionally «y» [j].

### Vowels

|       |      |      |      |      |      |      |
|-------+------+------+------+------+------+------|
| short | «a»  | «e»  | «i»  | «o»  | «u»  | «y»  |
|       | [æ]  | [ɛ]  | [ɪ]  | [ɒ]  | [ʊ]  | [ə]  |
| long  | «aa» | «ee» | «ii» | «oo» | «uu» | «yy» |
|       | [a:] | [ɛː] | [i:] | [ɔ:] | [u:] | [ɜ:] |

(yeah these are probably very BrE-centric but idc)

No diphthongs for now, we'll see how we get on.  I'm _fairly_ sure that
there's no possible confusion arising from using «y» both for the vowel
and the consonant.  If it does, well then I should just get on and come
up with the native orthography.

### Final consonants

|     |     |      |     |      |     |      |     |     |     |     |      |
|-----+-----+------+-----+------+-----+------+-----+-----+-----+-----+------|
| «m» | «n» | «ng» | «s» | «sh» | «f» | «th» | «x» | «l» | «r» | «w» | «z»  |
| [m] | [n] | [ŋ]  | [s] | [ʃ]  | [f] | [θ]  | [χ] | [l] | [r] | [w] | [ts] |

Vowel and final consonant length is phonemic.  Some consonants are
digraphs; only double the first consonant to indicate gemination (eg
«ssh»).  Voiceless final consonants before a voiced syllable assimilate
and become voiced.

It is entirely coincidental that "Josh" is a valid syllable.

### Loanwords

Names are not subject to the phonotactic rules — just approximate as
best possible with the sounds.

I'll try to come up with some systematic way to import words from other
languages, since the native phonotactics are pretty strict.

## Orthography

For now the Romanised version is canonical; one day I want to assemble
a native script.  It'll probably be some sort of abugida, although
incorporating forms for final consonants as well as vowels.

## Grammar

VSO, strongly head-initial, pro-drop.  Unmarked content words are
verbs.

### Nouns

Nouns are derived from verbs by suffixing as follows:

| Determiner             | Suffixes |
|------------------------+----------|
| indefinite             | «-a»     |
| definite               | «-e»     |
| demonstrative proximal | «-i»     |
| demonstrative distal   | «-o»     |

To pluralise, simply lengthen the suffix vowel.  The dictionary
definition of a root will give its meaning both as a verb and as a
noun for clarity, although hopefully I can come up with a regular
system so that these can be guessed as often as possible.

### Verbs

#### Tense/aspect

Optionally specified; if desired, by more affixing. Provisionally
(stealing wholesale from Esperanto):

| Tense   | Affix |
|---------+-------|
| Past    | «-i-» |
| Present | «-a-» |
| Future  | «-o-» |

Verbs must end in a consonant, so if a tense is specified, an aspect
must grammatically be present, thought it may be the default
elliptical one.

| Aspect       | Suffix |
|--------------+--------|
| Elliptical   | «-w»   |
| Perfective   | «-m»   |
| Imperfective | «-s»   |

#### Moods

Just realis/irrealis: imperative is by periphrasis (eg. «want give»).

## Counting

Duodecimal because I'm feeling perverse (and it fits nicely into
time).

### Time

|          |                         |
|----------+-------------------------|
| 1 am     | "first hour of rising"  |
| midday   | "top of the day"        |
| 1 pm     | "first hour of falling" |
| midnight | "bottom of the day"     |

Hours are subdivided into 5 blocks of 12 minutes (or halves if more
convenient but fifths are more common).

### Months

Numbered (0-based?)

### Days of week

Planets? Numbered? Dozenal-ify these too?
