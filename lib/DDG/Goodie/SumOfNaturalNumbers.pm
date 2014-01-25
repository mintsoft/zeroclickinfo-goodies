package DDG::Goodie::SumOfNaturalNumbers;
# ABSTRACT: Returns the sum of the numbers between the first and second provided integers

use DDG::Goodie;
use List::Util 'sum';

triggers start => "sum", "add", "sum from";
triggers end => "sum";

zci is_cached => 1;
zci answer_type => "sum";

primary_example_queries 'sum 1 to 10';
secondary_example_queries 'add 33 to 100';
description 'Add up the numbers between two values';
name 'SumOfNaturalNumbers';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/SumOfNaturalNumbers.pm';
category 'calculations';
topics 'math';

handle remainder => sub {
  return unless $_ =~ /^(\d+)\s*( to )?-?\s*(\d+)/i;
  if ($1 > $3) {
    return;
  } else {
    my $sum = sum($1..$3);
    return "Sum of natural numbers from $1 to $3: $sum";
  }
};

1
