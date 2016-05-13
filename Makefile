all : model.png leak-ontology.ttl

%.puml : %.ttl
	perl -w -S rdfpuml.pl $<

%.png : %.puml
	puml.bat $<

leak-ontology.ttl : prefixes.ttl leak.ttl leak-inferred.ttl
	cat prefixes.ttl leak.ttl leak-inferred.ttl  > leak-ontology.ttl
