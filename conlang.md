# quth

[quth]{.quth} /qʊθ/ is a language for me to explore some ideas: hanging
grammar/meaning on long/short vowels/fricatives, as well as possibly
initial consonant mutations (guess who's been learning Welsh
recently).  I'm also interested in coming up with a script for it that
leverages its really restricted syllable structure.  It's not going to
be remotely naturalistic.

For totally legit reasons, this language is obsessed with the
number 12.  So duodecimal numbers, twelve initial consonants, twelve
vowels, twelve final consonants (and luckily Western notions of time
fit reasonably well into this paradigm, weeks notwithstanding; thanks
Babylonians).

Fragments of quth look [like this]{.quth} and /slashes/ are a vague
IPA transcription.

## Phonology

All content words consist of syllables of the form CVC, where the
first consonant is always a stop or affricate and the final is always
a fricative.

### Initial consonants

These have a voiceless and voiced series, depending on grammatical
context:

|           |            |            |             |            |             |            |
|-----------+------------+------------+-------------+------------+-------------+------------|
| voiceless | [p]{.quth} | [t]{.quth} | [ch]{.quth} | [k]{.quth} | [q]{.quth}  | [h]{.quth} |
|           | /p/        | /t/        | /tʃ/        | /k~c/      | /q/         | /ʔ/, /h/   |
| voiced    | [b]{.quth} | [d]{.quth} | [j]{.quth}  | [g]{.quth} | [qh]{.quth} | [y]{.quth} |
|           | /b/        | /d/        | /dʒ/        | /g~ɟ/      | /ɢ/         | /j/        |

[k]{.quth} and [g]{.quth} are more palatal than their English equivalents, so that
they are more distinct from [q]{.quth} and [qh]{.quth}.  [h]{.quth} is realised as a
glottal stop word-initially but /h/ medially; its voiced version is
exceptionally [y]{.quth} /j/.

### Vowels

|       |             |             |             |             |             |             |
|-------+-------------+-------------+-------------+-------------+-------------+-------------|
| short | [a]{.quth}  | [e]{.quth}  | [i]{.quth}  | [o]{.quth}  | [u]{.quth}  | [y]{.quth}  |
|       | /æ/         | /ɛ/         | /ɪ/         | /ɒ/         | /ʊ/         | /ə/         |
|       | cat         | pen         | tin         | hot         | foot        | cut         |
| long  | [aa]{.quth} | [ee]{.quth} | [ii]{.quth} | [oo]{.quth} | [uu]{.quth} | [yy]{.quth} |
|       | /a:/        | /ɛː/        | /i:/        | /ɔ:/        | /u:/        | /ɜ:/        |
|       | father      | air         | clean       | born        | cool        | bird        |

(yeah these are probably very BrE-centric but idc)

I'm _fairly_ sure that there's no possible confusion arising from
using [y]{.quth} both for the vowel and the consonant.  If it does,
I'll take that as a sign that I should get on and come up with the
native orthography.

### Final consonants

|            |            |             |            |             |            |             |            |            |            |            |            |
|------------+------------+-------------+------------+-------------+------------+-------------+------------+------------+------------+------------+------------|
| [m]{.quth} | [n]{.quth} | [ng]{.quth} | [s]{.quth} | [sh]{.quth} | [f]{.quth} | [th]{.quth} | [x]{.quth} | [l]{.quth} | [r]{.quth} | [w]{.quth} | [z]{.quth} |
| /m/        | /n/        | /ŋ/         | /s/        | /ʃ/         | /f/        | /θ/         | /χ/        | /l/        | /r/        | /w/        | /ts/       |

Vowel and final consonant length is phonemic.  Some consonants are
digraphs (in the Romanised form); only double the first consonant to
indicate gemination (eg [ssh]{.quth}).  Voiceless final consonants before a
voiced syllable may assimilate and become voiced.

It is entirely coincidental that "Josh" is a valid syllable.

### Stress

Always on the first syllable.

### Loanwords

Names are not subject to the phonotactic rules — just approximate as
best possible with the sounds.  Like in Toki Pona, they are
syntactically adjectives, modifying a definite noun: [kime Sathamptyn]{.quth}
(the city of) Southampton, [pone Stiif]{.quth} (the person called) Steve.

## Orthography

For now the Romanised version is canonical; one day I want to assemble
a native script.  It'll probably be some sort of abugida, although
	incorporating forms for final consonants as well as vowels.

In the Romanised form, full stops end sentences and everything is
lower-case.

## Morphology/syntax

VSO, strongly head-initial, pro-drop.  The dictionary form of a word
is unvoiced with short vowels and consonants; this is considered
"unmarked" and the "default" use.  A definition will normally give the
two (related) meanings as a verb and as a noun for clarity, although
hopefully they will be guessable most of the time.  If a word whose
only dictionary definition is a noun is used as a verb, it has the
meaning "There is an x" or "[Subject] is an/the x".

### Nouns

Nouns are derived from roots by suffixing as follows:

| Suffix      | Meaning                | Example       | Meaning               |
|-------------+------------------------+---------------+-----------------------|
| [-a]{.quth} | indefinite             | [hafa]{.quth} | a dog                 |
| [-e]{.quth} | definite               | [hafe]{.quth} | the dog               |
| [-i]{.quth} | demonstrative proximal | [hafi]{.quth} | this dog (near me)    |
| [-o]{.quth} | demonstrative medial   | [hafo]{.quth} | that dog (near you)   |
| [-u]{.quth} | demonstrative distal   | [hafu]{.quth} | that dog (over there) |
| [-y]{.quth} | interrogative          | [hafy]{.quth} | which dog?            |

To pluralise, simply lengthen the suffix vowel.

«hafe»
~ the dog

«hafee»
~ the dogs

#### Cases

There are four cases:

| Case       | Indication | Example        |
|------------+------------+----------------|
| nominative | none       | [hafa]{.quth}  |
| accusative | long final | [hava]{.quth}  |

The accusative is only used when dropping the subject, so:

[tal hafe piza.]{.quth}
~ The dog eats a pizza.

[tal bizza.]{.quth}
~ [Unspecified] eats a pizza.

[tal hafe.]{.quth}
~ The dog eats (something).

[tal haffe.]{.quth}
~ [Unspecified] eats the dog.

For ownership, use the «ho» particle with a noun or pronoun.

«hafe ho hi»
~ my dog

«hafa ho hii»
~ one of our dogs

#### Pronouns

|          | 1st          | 2nd          | 3rd          |
|----------+--------------+--------------+--------------|
| Singular | [hi]{.quth}  | [to]{.quth}  | [ku]{.quth}  |
| Plural   | [hii]{.quth} | [too]{.quth} | [kuu]{.quth} |

### Verbs

Verbs do not conjugate for person or number, only tense, aspect and
mood.  There are two tenses (past, non-past), two aspects
(perfective and imperfective) and two moods (realis and irrealis).
Imperative and other constructions are by periphrasis (e.g. "want
[that you] do").

| Tense    | Indication   | Example         | Meaning             |
|----------+--------------+-----------------+---------------------|
| non-past | none         | [tal hi]{.quth} | I sleep, will sleep |
| past     | voiced stops | [dal hi]{.quth} | I slept             |

| Aspect       | Indication | Example          | Meaning       |
|--------------+------------+------------------+---------------|
| perfective   | none       | [tal hi]{.quth}  | I sleep       |
| imperfective | long vowel | [taal hi]{.quth} | I am sleeping |

| Mood     | Indication | Example          | Meaning                    |
|----------+------------+------------------+----------------------------|
| realis   | none       | [tal hi]{.quth}  | I sleep                    |
| irrealis | long final | [tall hi]{.quth} | I would sleep, might sleep |

#### Negation

#### Questions

For wh-questions, use the [-y]{.quth} ending.

#### Adjectives

Adjectives are normal content words.  As a verb, they behave as a
predicate, and as nouns, "the x one".  To modify a noun, use the
particle «ho» with the bare root.

«hafe ho qoth»
~ the black dog

#### Comparison

### Subordinate clauses

Several particles introduce subordinate clauses.  These act as normal
sentences, but the first noun outside the clause has its intial
consonant voiced. (todo: make sure this isn't going to end up being
ambiguous. SPOILER: IT ALREADY IS)

«tal pone piza.»
~ The person eats a pizza.

«tal pone qu jas biza.»
~ The person who slept eats a pizza.

### Adverbs

Adverbs do not exist as a separate class of words.  Rather, they are
introduced by the particle «pi» and then a subordinate phrase.  «pi»
could be translated as "in the way/style of", but it is very flexible
and often should be translated more loosely.

«tal ko piza pi haf.»
~ You eat pizza like a dog.

### Relative clauses

Introduced by the particle «qu».

### Conjunctions

### Prepositions

Via «pi».

## Counting

Duodecimal because I'm feeling perverse (and it fits nicely into
time).

|    |   |
|----+---|
|  0 |   |
|  1 |   |
|  2 |   |
|  3 |   |
|  4 |   |
|  5 |   |
|  6 |   |
|  7 |   |
|  8 |   |
|  9 |   |
| 10 |   |
| 11 |   |
| 12 |   |

### Time

|          |                         |
|----------+-------------------------|
| 1 am     | "first hour of rising"  |
| midday   | "top of the day"        |
| 1 pm     | "first hour of falling" |
| midnight | "bottom of the day"     |

Hours are subdivided into 5 blocks of 12 minutes (or halves if more
convenient but fifths are more common).

Tagging a sentence with time is done with «pi».

### Months

"The n-th moon".

### Days of week

Planets? Numbered? Duodecimal-ify these too?

## Examples

[tal hafe piza.]{.quth}
~ The dog eats a pizza.

[chaas pony?]{.quth}
~ Which person is sleeping?
~ Who is asleep?

## Vocabulary

quth
~ (noun) the name of the language

piz
~ (noun) pizza

haf
~ (noun) dog

tal
~ (noun) food
~ (verb) to eat

pon
~ (noun) person

chas
~ (verb) to sleep

kim
~ (noun) town, city

tan
~ (noun) thing

has
~ (noun) water

kish
~ (noun) fish

qong
~ (verb) die

chix
~ (noun) head

pin
~ (noun) bird

tosh
~ (noun) fire
~ (verb) to burn

hang
~ (verb) to love

pal
~ (noun) window

qosh
~ (adjective) black

ho
~ (particle) link noun or adjective to noun

pi
~ (particle) introduce adverbial phrase

chif
~ (noun) sheep/goat

kuw
~ (noun) cow

tol
~ (noun) horse

qith
~ (noun) tree
