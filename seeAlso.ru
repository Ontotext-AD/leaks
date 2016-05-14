insert {
  graph leaks:seeAlso {
    ?node rdfs:seeAlso ?icij_org
  }
} where {
  ?node leak:node_id ?node_id
  bind(iri(concat("https://offshoreleaks.icij.org/nodes/",?node_id)) as ?icij_org)
}
