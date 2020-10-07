~~Plains Cree FSTs~~
====================

> **No longer maintained**: please see https://github.com/giellalt/lang-crk

[![Build Status](https://travis-ci.org/UAlbertaALTLab/plains-cree-fsts.svg?branch=master)](https://travis-ci.org/UAlbertaALTLab/plains-cree-fsts)



kîkwây ôma?
-----------

This is a mirror of the **Plains Cree morphological finite-state
transducers** (FSTs) source code. The FSTs can **analyze** and
**generate** nêhiyawêwin word forms.

âh?
---

You can use the FSTs to **explain the grammar** (analysis) of a nêhiyawêwin words:

    kohkom -> nôhkom+N+A+D+Px2Sg+Sg

And you can use the models to **generate** a word, based on
a grammatical description:

    nôhkom+N+A+D+Px1Pl+Sg -> nôhkominân

The canonical source code for the FSTs, with derivational FSTs, and more
are available at https://gtsvn.uit.no/langtech/trunk/langs/crk/.

Download the FSTs
-----------------

Download compiled FSTS on the [releases page](https://github.com/UAlbertaALTLab/plains-cree-fsts/releases)!

You can use \*.hfstol files with `hfst-optimized-lookup` and \*.fomabin
with `flookup`. You can also use the \*.fomabin and \*.hfstol file in Python using
[fst-lookup](https://github.com/eddieantonio/fst-lookup) and [hfstol](https://github.com/Madoshakalaka/hfstol) respectively.


Usage
-----

Using the [HFST](https://github.com/hfst/hfst) application suite:

    $ echo "ewapamat" | hfst-optimized-lookup -q crk-descriptive-analyzer.hfstol
    ewapamat	PV/e+wâpamêw+V+TA+Cnj+Prs+2Sg+3SgO+Err/Orth
    ewapamat	PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO+Err/Orth

    $ echo "PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO" | hfst-optimized-lookup crk-normative-generator.hfstol
    PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO	ê-wâpamât

Using [Foma](https://fomafst.github.io/):

    $ echo "ewapamat" | flookup crk-descriptive-analyzer.fomabin
    ewapamat	PV/e+wâpamêw+V+TA+Cnj+Prs+2Sg+3SgO+Err/Orth
    ewapamat	PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO+Err/Orth

    $ echo "PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO" | flookup crk-normative-generator.fomabin
    PV/e+wâpamêw+V+TA+Cnj+Prs+3Sg+4Sg/PlO	ê-wâpamât


Using [fst-lookup](https://github.com/eddieantonio/fst-lookup):


```python
from fst_lookup import FST

analyzer = FST.from_file('crk-descriptive-analyzer.fomabin')
for analysis in analyzer.analyze('ewapamat'):
  print(analysis)
# prints: ('PV/e+', 'wâpamêw', '+V', '+TA', '+Cnj', '+Prs', '+2Sg', '+3SgO', '+Err/Orth')
#         ('PV/e+', 'wâpamêw', '+V', '+TA', '+Cnj', '+Prs', '+3Sg', '+4Sg/PlO', '+Err/Orth')

# NB: You must invert the labels on the generator because this FST is "upside-down"!
generator = FST.from_file('crk-normative-generator.fomabin', labels='invert')
for wordform in generator.generate('PV/e+' 'wâpamêw' '+V' '+TA' '+Cnj' '+Prs' '+3Sg' '+4Sg/PlO'):
  print(wordform)
# prints: ê-wâpamât
```


Bulk lookups
------------

If you want to generate a large amount of word forms all at once, it is
recommended that you use `hfst-optimized-lookup` command, as this is the
fastest way to generate lookups.
You will provide analyses, one per line. For example, say I want to
conjugate `mîcisow`, and I have a file of analyses called `conjugations.txt`:

```
mîcisow+V+AI+Ind+Prs+1Sg
mîcisow+V+AI+Ind+Prs+2Sg
mîcisow+V+AI+Ind+Prs+3Sg
PV/e+mîcisow+V+AI+Cnj+Prs+1Sg
PV/e+mîcisow+V+AI+Cnj+Prs+2Sg
PV/e+mîcisow+V+AI+Cnj+Prs+3Sg
```

You can pipe this into `hfst-optimized-lookup`:

```sh
$ cat conjugations.txt | hfst-optimized-lookup crk-normative-generator.hfstol
mîcisow+V+AI+Ind+Prs+1Sg	nimîcison

mîcisow+V+AI+Ind+Prs+2Sg	kimîcison

mîcisow+V+AI+Ind+Prs+3Sg	mîcisow

PV/e+mîcisow+V+AI+Cnj+Prs+1Sg	ê-mîcisoyân

PV/e+mîcisow+V+AI+Cnj+Prs+2Sg	ê-mîcisoyan

PV/e+mîcisow+V+AI+Cnj+Prs+3Sg	ê-mîcisot
```

You can use the two-column output to map the input to the generated word
form. This is useful, since some analyses have multiple possible word
forms (e.g., `cactus+Pl` in English can be "cactuses" or "cacti").


Working on the FSTs
-------------------

The following instructions assume you're working in a Linux/macOS/Unix
command line.

### Dependencies

You'll need (GNU) Make, and HFST. If you're on macOS/Linux, you probably already have `make`
installed. HFST can be installed on macOS with Homebrew by typing:

    brew install ualbertaaltlab/hfst/hfst

### Building

To build the FSTs from scratch, type the following in the root
directory:

    make -j fsts

The resultant \*.hfstol and \*.foma files will be placed in `src/`.

Explanation:

 - `make`: run GNU Make
 - `-j`: run jobs on as many CPU cores as possible
 - `fsts`: the thing you want to make are the \*.hfstol and \*.foma FSTs.

If you see the message,

    make[1]: Nothing to be done for `fsts'.

This means the FSTs are up-to-date, so there's no need to remake them.
If you want to remake them anyway, add the `-B` flag when using make:

    make -j -B fsts

### Modifying

Change the `*.lexc`, `*.regexp`, and `*.twolc` files in `src/`, then run
`make -j fsts` to see the changes.


Citation
--------

If you use this work in an academic context, use this to cite the
morphological FST:

    @misc{arppe2019finite,
        Author={Arppe, Antti and Harrigan, Atticus and Schmirler, Katherine and Antonsen, Lene and Trosterud, Trond and N{\o}rsteb{\o} Moshagen, Sjur and Silfverberg, Miikka and Wolvengrey, Arok and Snoek, Conor and Lachler, Jordan and Santos, Eddie Antonio and Okim{\=a}sis, Jean and Thunder, Dorothy},
        Howpublished={\url{https://gtsvn.uit.no/langtech/trunk/langs/crk/}},
        Title={Finite-state transducer-based computational model of {Plains Cree} morphology},
        Year={2014--2019}
    }

You may also cite these publications:

    @inproceedings{snoek2014modeling,
      title={Modeling the noun morphology of Plains Cree},
      author={Snoek, Conor and Thunder, Dorothy and Loo, Kaidi and Arppe, Antti and Lachler, Jordan and Moshagen, Sjur and Trosterud, Trond},
      booktitle={Proceedings of the 2014 Workshop on the Use of Computational Methods in the Study of Endangered Languages},
      pages={34--42},
      year={2014}
    }

    @article{harrigan2017learning,
      title={Learning from the computational modelling of Plains Cree verbs},
      author={Harrigan, Atticus G and Schmirler, Katherine and Arppe, Antti and Antonsen, Lene and Trosterud, Trond and Wolvengrey, Arok},
      journal={Morphology},
      volume={27},
      number={4},
      pages={565--598},
      year={2017},
      publisher={Springer}
    }

Maintainer tools
----------------

To sync the FST sources with the upstream SVN repository, re-download
the sources list:

    make -B src/morphological-fst-sources.mk

Then download all the sources again:

    make -j -B download

And make the fsts like normal!

    make -j fsts

License
-------

The FST and its sources are distributed under the terms of Affero GPL
license:

> Copyright (C) 2015—2019 Alberta Language Technology Lab (ALTLab) <altlab@ualberta.ca>
>
> This program is free software: you can redistribute it and/or modify
> it under the terms of the GNU Affero General Public License as
> published by the Free Software Foundation, either version 3 of the
> License, or (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU Affero General Public License for more details.
>
> You should have received a copy of the GNU Affero General Public License
> along with this program.  If not, see <http://www.gnu.org/licenses/>.
