How to generate verbs
=====================

“Verb“ is an umbrella category for _four_ parts-of-speech in Plains Cree:

 - VTA (🧑🏽 ➡️ 🧑🏽): Transitive Animate Verb
 - VTI (🧑🏽 ➡️ 📦): Transitive Inanimate Verb
 - VAI (🧑🏽 ➡️): Animate Intransitive Verb
 - VII (📦 ➡️): Inanimate Intransitive Verb

These parts-of-speech differ in how many animate (🧑🏽 ➡️) arguments they
have, and the words increase in conjugations, the more animate arguments
they have.

VTA
---

### Template

    {lemma}+V+TA+{Order}+{Tense}+{Actor}+{Goal}

    Prefixes := (({Reduplication})*{Preverb}])*{Reduplication}*
    Tense := Prs | Pst | Fut
    Order := Ind | Cnj | Imp


### Examples


kiwâpamitin is a form of _wâpamêw_:

 - Order: `Ind` (Independent)
 - Tense: `Prs` (Present — Something happening now)
 - Actor: `1Sg` (First person — **I** am doing something)
 - Goal: `2SgO` (Second person goal — something is happening to **you**)

    wâpamêw+V+TA+Ind+Prs+1Sg+2SgO

ê-wâpamât is a form of _wâpamêw_:

 - Prevervs: `PV/e` (ê-)
 - Order: `Cnj` (Independent)
 - Tense: `Prs` (Present — Something happening now)
 - Actor: `3Sg` (First person — **He or she** is doing something)
 - Goal: `4Sg/PlO` (Obviative goal  — something is happening to **that person over there**)

    PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO


Specifying Tense
----------------

TODO: write up what any of this means:

<!-- https://github.com/UAlbertaALTLab/plains-cree-fsts/issues/11 -->

kî-nipâw	nipâw+V+AI+Ind+Prt+3Sg
wî-nipâw	nipâw+V+AI+Ind+Fut+Int+3Sg
ka-nipâw	nipâw+V+AI+Ind+Fut+Def+3Sg

echo PV/kaa+ohkomiw+V+AI+Cnj+Prt+1Sg | hfst-optimized-lookup --silent crk-normative-generator.hfstol
PV/kaa+ohkomiw+V+AI+Cnj+Prt+1Sg	kâ-kî-ohkomiyân
