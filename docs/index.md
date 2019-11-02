How to use the Plains Cree FSTs
===============================

tânisi! If you're here, you want to use the FSTs ([available
here][releases]) to **generate** Plains Cree _word forms_ from
a linguistic _analysis_.

[releases]: https://github.com/UAlbertaALTLab/plains-cree-fsts/releases


A few important definitions
---------------------------

###  word form
In English, aren't "ate" and "eat" the same word? Yes, of course
they're the same word -- they have the same dictionary definition! --
but they differ in that one is past tense and one is present tense.
These are two different <dfn>word forms</dfn> of the same word. Likewise
in Cree, <span lang="crk">nôhkom</span> and <span
lang="crk">kôhkom</span> are the same “word” but they differ in just
whether it's "my grandma" or "your grandma". nôhkom and kôhkom are two
separate wordforms.

### lemma

It's impractical to refer to a word by all its possible word forms.
Imagine an English dictionary, that prior to defining a word, enumerated
all its possible word forms. It would read "eat/eats/ate/eaten",
"break/breaks/broke/broken", "drink/drinks/drank/drunk", and similary for
other words. These becomes even more impractical in Plains Cree, with
some words having hundreds of forms, and even the ability to be creative
with word forms! Instead we choose **one wordform** to represent them
all. This is one word form to rule them all is called the
<dfn>lemma</dfn>.


How to follow along with this guide
-----------------------------------

First install hfst:

```sh
# macOS
brew install ualbertaaltlab/hfst/hfst
```

```sh
# Ubuntu
sudo apt install hfst
```

Next, download a copy of ["crk-normative-generator.hfstol"][generator].

Cozy up to your command line and `cd` to where you downloaded the
`*.hfstol` file. We're about to generate Cree words on the command line!
🧑🏽‍💻


[generator]: https://github.com/UAlbertaALTLab/plains-cree-fsts/releases/download/201911011451/crk-normative-generator.hfstol


How to use the descriptive analyzer to generate...
--------------------------------------------------

 * [Nouns](./nouns)
 * [Verbs](./verbs)
 * [Everything else](./ipc)
