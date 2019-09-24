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

FSTS := crk-descriptive-analyzer.hfst \
		crk-normative-generator.hfst \
		crk-strict-analyzer.hfst \
		crk-normative-generator-with-morpheme-boundaries.hfst
fsts: $(FSTS:.hfst=.hfstol) $(FSTS:.hfst=.fomabin)

include morphological-fst-sources.mk
include morphological-fst-rules.mk

%.fomabin: %.hfst
	@# HFST has the upper and lower sides inverted (I don't blame them)
	@# but this inverts it back so Foma users aren't confused.
	hfst-invert -i $< -o - |\
		hfst-fst2fst --foma --use-backend-format -i - -o - |\
		gzip > $@
