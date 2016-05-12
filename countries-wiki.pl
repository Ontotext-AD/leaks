#!perl -n
# perl countries-wiki.pl countries-wiki-text.txt | sort > countries-wiki.txt
# extract dbpedia link and ISO_3166-1 alpha-3 code from
# https://en.wikipedia.org/w/index.php?title=ISO_3166-1&action=edit&section=5

m{\[\[                          # wikilink open
  (<!--.*?-->)?                 # <!--DO NOT CHANGE-->
  (.*?)                         # page title
  (<!--.*?-->)?                 # <!--This (Taiwan) is the country name used in ISO 3166:... -->
  (\|.*?)?                      # link name, eg British Virgin Islands|Virgin Islands (British)
  \]\]                          # wikilink close
}x &&
  $2 !~ m{alpha-2}              # eg "ISO 3166-1 alpha-2#AF" is the alpha-2 code
  and
  ($country =                        # but we're looking for the country name
   "http://dbpedia.org/resource/$2") # prepend dpbedia prefix
  =~ s{ }{_}g;                       # substitute spaces to underscores

m{\{\{mono\|                    # this macro surrounds the alpha-3 code
  ([A-Z]{3})                    # alpha-3 code
  \}\}
}x and print "$1\t$country\n";

END {print "XXX\thttp://dbpedia.org/resource/Undefined\n"}

# https://docs.google.com/spreadsheets/d/1Zjp_azlkZzczkQvi2mnY68AscfwBHIsFjw6HjZFSV2U/edit#gid=0
# https://docs.google.com/spreadsheets/d/1Zjp_azlkZzczkQvi2mnY68AscfwBHIsFjw6HjZFSV2U/pubhtml
# http://stackoverflow.com/questions/24255472/download-export-public-google-spreadsheet-as-tsv-from-command-line
# curl "https://docs.google.com/spreadsheets/d/1Zjp_azlkZzczkQvi2mnY68AscfwBHIsFjw6HjZFSV2U/export?gid=0&format=tsv"
