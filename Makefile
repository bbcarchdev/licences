FRAGMENTS = fragments/head.html fragments/bodyfirst.html fragments/bodylast.html
PAGES = dps/index.html dps/1.0.html
RDF = dps/1.0.rdf dps/1.0.nt

all: $(PAGES) $(RDF)

$(PAGES): tools/process.pl $(FRAGMENTS)
	./tools/process.pl $@

%.rdf: %.ttl
	rapper -i turtle -o rdfxml-abbrev $< > $@

%.nt: %.ttl
	rapper -i turtle -o ntriples $< > $@
