# Copyright (C) 2019 Eddie Antonio Santos <easantos@ualberta.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CURL = curl --fail --silent

# TODO: change the name of this file in upstream
# TODO: I called it 'MORPHOLGY' in upstream. Fix it.
UPSTREAM_INCLUDE := src/quick.mk
FST_FILES = $(PHONOLOGY) $(ORTHOGRAPHY) $(MORPHOLOGY)
REQUIRED_FILES = LICENCE AUTHORS $(addprefix src/,$(FST_FILES))

HTTP_PREFIX := https://gtsvn.uit.no/langtech/trunk/langs/crk

all: download

include src/fst-files.mk
include download.mk

$(UPSTREAM_INCLUDE):
	curl --fail --silent -o $@ $(HTTP_PREFIX)/$(UPSTREAM_INCLUDE)

download.mk: create-download-rules
	./$< $(REQUIRED_FILES)

download: $(REQUIRED_FILES)

.PHONY: download
