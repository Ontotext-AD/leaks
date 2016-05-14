insert {
  GRAPH leaks:jurisdictions-link {
    ?node leak:hasJurisdiction ?jurisdiction
  }
} where {
  ?node leak:jurisdiction ?code.
  ?jurisdiction a leak:OffshoreJurisdiction; leak:jurisdictionCode ?code.
}

