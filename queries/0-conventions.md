Convenions
- don't include prefixes, the SPARQL endpoints adds them on paste
- write SPARQL keywords in lowercase
- use 2 spaces to indent
- put closing braces on the same line

Efficiency
- don't use DISTINCT if at all possible, it makes the query slow
- add "LIMIT 100" or so on queries that return detailed data (so it returns a sample of rows)
