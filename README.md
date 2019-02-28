Plains Cree FSTs
================

A mirror of the Plains Cree morphological finite-state transducer (FSTs)
source code.

The canonical source code for the FSTs, with derivational FSTs, and more
are available at https://gtsvn.uit.no/langtech/trunk/langs/crk/.

Download
--------

Download compiled FSTS on the [releases page](https://github.com/UAlbertaALTLab/plains-cree-fsts/releases)!

You can use \*.hfstol files with `hfst-optimized-lookup` and \*.fomabin
with `flookup`.

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


Citation
--------

If you use this work in an academic context, use this to cite the
morphological FST:

    @misc{arppe2019finite,
        title = {Finite-state transducer-based computational model of {Plains Cree} morphology},
        author={Arppe, Antti Harrigan, Atticus and Schmirler, Katherine and Antonsen, Lene and Trosterud, Trond and N{\o}rsteb{\o} Moshagen, Sjur and Silfverberg, Miikka and Wolvengrey, Arok and Snoek, Conor and Lachler, Jordan and Santos, Eddie Antonio and Okim{\={a}}sis, Jean and Thunder, Dorothy},
        howpublished = {\url{https://gtsvn.uit.no/langtech/trunk/langs/crk/}},
        year = {2014--2019}
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
