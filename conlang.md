# quth

«quth» /qʊθ/ is a language for me to explore some ideas: hanging
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

«Guillemets» indicate fragments of quth and /slashes/ are a vague IPA
transcription.

## Phonology

All content words consist of syllables of the form CVC, where the
first consonant is always a stop or affricate and the final is always
a fricative.

### Initial consonants

These have a voiceless and voiced series, depending on grammatical
context:

|           |     |     |      |       |      |          |
|-----------|-----|-----|------|-------|------|----------|
| voiceless | «p» | «t» | «ch» | «k»   | «q»  | «h»      |
|           | /p/ | /t/ | /tʃ/ | /k~c/ | /q/  | /ʔ/, /h/ |
| voiced    | «b» | «d» | «j»  | «g»   | «qh» | «y»      |
|           | /b/ | /d/ | /dʒ/ | /g~ɟ/ | /ɢ/  | /j/      |

«k» and «g» are more palatal than their English equivalents, so that
they are more distinct from «q» and «qh».  «h» is realised as a
glottal stop word-initially but /h/ medially; its voiced version is
exceptionally «y» /j/.

### Vowels

|       |        |      |       |      |      |      |
|-------+--------+------+-------+------+------+------|
| short | «a»    | «e»  | «i»   | «o»  | «u»  | «y»  |
|       | /æ/    | /ɛ/  | /ɪ/   | /ɒ/  | /ʊ/  | /ə/  |
|       | cat    | pen  | tin   | hot  | foot | cut  |
| long  | «aa»   | «ee» | «ii»  | «oo» | «uu» | «yy» |
|       | /a:/   | /ɛː/ | /i:/  | /ɔ:/ | /u:/ | /ɜ:/ |
|       | father | air  | clean | born | cool | bird |

(yeah these are probably very BrE-centric but idc)

No diphthongs for now, we'll see how we get on.  I'm _fairly_ sure that
there's no possible confusion arising from using «y» both for the vowel
and the consonant.  If it does, well then I should just get on and come
up with the native orthography.

### Final consonants

|     |     |      |     |      |     |      |     |     |     |     |      |
|-----+-----+------+-----+------+-----+------+-----+-----+-----+-----+------|
| «m» | «n» | «ng» | «s» | «sh» | «f» | «th» | «x» | «l» | «r» | «w» | «z»  |
| /m/ | /n/ | /ŋ/  | /s/ | /ʃ/  | /f/ | /θ/  | /χ/ | /l/ | /r/ | /w/ | /ts/ |

Vowel and final consonant length is phonemic.  Some consonants are
digraphs (in the Romanised form); only double the first consonant to
indicate gemination (eg «ssh»).  Voiceless final consonants before a
voiced syllable may assimilate and become voiced.

It is entirely coincidental that "Josh" is a valid syllable.

### Stress

Always on the first syllable.

### Loanwords

Names are not subject to the phonotactic rules — just approximate as
best possible with the sounds.  Like in Toki Pona, they are
syntactically adjectives: «kime Sathamptyn» Southampton, «pone Stiif»
Steve.

I'll try to come up with some systematic way to import words from other
languages, since the native phonotactics are pretty strict.

## Orthography

For now the Romanised version is canonical; one day I want to assemble
a native script.  It'll probably be some sort of abugida, although
incorporating forms for final consonants as well as vowels.

## Morphology/syntax

VSO, strongly head-initial, pro-drop.  The dictionary form of a word
is a verb and is unvoiced with short vowels and consonants; this is
considered "unmarked" and the "default" use.  The dictionary
definition of a root will give its meaning as a verb and as the
meaning of the derived noun for clarity, although hopefully I can come
up with a regular system so that these can be guessed as often as
possible.

### Nouns

Nouns are derived from verbs by suffixing as follows:

| Suffix | Meaning                | Example | Gloss                 |
|--------+------------------------+---------+-----------------------|
| «-a»   | indefinite             | «hafa»  | a dog                 |
| «-e»   | definite               | «hafe»  | the dog               |
| «-i»   | demonstrative proximal | «hafi»  | this dog (near me)    |
| «-o»   | demonstrative medial   | «hafo»  | that dog (near you)   |
| «-u»   | demonstrative distal   | «hafu»  | that dog (over there) |
| «-y»   | interrogative          | «hafy»  | which dog?            |

To pluralise, simply lengthen the suffix vowel.

#### Cases

Three cases:

| Case       | Indication   | Example |
|------------+--------------+---------|
| nominative | none         | «hafa»  |
| accusative | voiced stops | «yafa»  |
| genitive   | long vowel   | «haafa» |
| dative     | long final   | «haffa» |

### Verbs

Verbs do not conjugate for person or number, only tense, aspect and
mood.  There are two tenses (past, non-past), two aspects
(perfective and imperfective) and two moods (realis and irrealis).
Imperative and other constructions are by periphrasis (e.g. "want
[that you] do").

| Tense    | Indication   | Example | Meaning             |
|----------+--------------+---------+---------------------|
| non-past | none         | «tal»   | I sleep, will sleep |
| past     | voiced stops | «dal»   | I slept             |

| Aspect       | Indication | Example | Meaning       |
|--------------+------------+---------+---------------|
| perfective   | none       | «tal»   | I sleep       |
| imperfective | long vowel | «taal»  | I am sleeping |

| Mood     | Indication | Example | Meaning                    |
|----------+------------+---------+----------------------------|
| realis   | none       | «tal»   | I sleep                    |
| irrealis | long final | «tall»  | I would sleep, might sleep |

### Adjectives

#### Comparison

### Adverbs

### Relative clauses

### Conjunctions

### Prepositions

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

## Examples

«tal hafe biza.»
~ The dog eats a pizza.

«chaas pony?»
~ Which person is sleeping?
~ Who is asleep?

## Vocabulary

quth
~ (noun) the language

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
