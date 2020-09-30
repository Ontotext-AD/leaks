all : model.png leak-ontology.rdf

%.puml : %.ttl
	perl -w -S rdfpuml.pl $<

%.png : %.puml
	puml.bat $<

leak-ontology.ttl : prefixes.ttl leak.ttl leak-inferred.ttl
	cat prefixes.ttl leak.ttl leak-inferred.ttl  > leak-ontology.ttl

leak-ontology.rdf : leak-ontology.ttl
	rdfcat leak-ontology.ttl > leak-ontology.rdf
