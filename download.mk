LICENCE:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/LICENCE -o $@
AUTHORS:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/AUTHORS -o $@
src/phonology/crk-phon.twolc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/phonology/crk-phon.twolc -o $@
src/orthography/spellrelax.regex:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/orthography/spellrelax.regex -o $@
src/morphology/root.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/root.lexc -o $@
src/morphology/affixes/noun_affixes.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/affixes/noun_affixes.lexc -o $@
src/morphology/affixes/propernouns.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/affixes/propernouns.lexc -o $@
src/morphology/affixes/verb_affixes.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/affixes/verb_affixes.lexc -o $@
src/morphology/stems/abbreviations.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/abbreviations.lexc -o $@
src/morphology/stems/crk-propernouns.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/crk-propernouns.lexc -o $@
src/morphology/stems/noun_stems.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/noun_stems.lexc -o $@
src/morphology/stems/numerals.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/numerals.lexc -o $@
src/morphology/stems/particles.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/particles.lexc -o $@
src/morphology/stems/pronouns.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/pronouns.lexc -o $@
src/morphology/stems/verb_stems.lexc:
	mkdir -p $(dir $@)
	$(CURL) $(HTTP_PREFIX)/src/morphology/stems/verb_stems.lexc -o $@
