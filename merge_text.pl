#!/usr/bin/env perl

use File::Spec;
use File::Slurp;

@sections = (
    File::Spec->catfile("text", "supporting", "front.md"),
    File::Spec->catfile("text", "median", "001.md"),
    File::Spec->catfile("text", "median", "002.md"),
    File::Spec->catfile("text", "median", "003.md"),
);

open(IO, '>book.md');

my $i = 0;
my $n = $#sections;

foreach my $section (@sections) {
    $i = $i + 1;
    my $text = read_file($section);
    print IO $text;
    if ($i <= $n) {
         print IO "\n\n";
         print IO "---";
         print IO "\n\n";
    }
}

close(IO);
