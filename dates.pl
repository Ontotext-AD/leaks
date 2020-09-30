#!perl -p
# perl dates.pl Entities.csv > Entities-dated.csv
# fix dates to proper XSD format

BEGIN {
  my $mo = "01";
  map {$date{$_} = $mo++}
    qw(JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC);
}

s{\b([0-9]{2})-([A-Z]{3})-([0-9]{4})\b}{$3-$date{$2}-$1}g;
