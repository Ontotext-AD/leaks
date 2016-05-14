insert {
  graph leaks:countries-link {
      ?node leak:hasCountry ?country
  }    
} where {
  ?node leak:country_codes ?codes.
  ?country a leak:Country; leak:countryCode ?code.
  filter(contains(?codes,?code))
}
