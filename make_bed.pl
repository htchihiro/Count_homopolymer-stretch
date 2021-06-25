#!usr/bin/env perl

use strict;
use warnings;
use Getopt::Long;

my $vcf_File = "";
my $front = "";
my $back = "";

GetOptions(
        'vcf=s' => \$vcf_File,
	'front=i' => \$front,
	'back=i' => \$back,
);

my $bedFile = "vcffile.bed";

my $line1;

open(IN01, "<$vcf_File") or die "IN01";
open(OUT02, ">$bedFile") or die "OUT02";

while ( $line1 = <IN01> ) {
        chomp($line1);
        unless ( $line1 =~ m/#/ ) {
                my @vcf = split(/\t/, $line1);
		my $prev = $vcf[1] - $front;
		my $after = $vcf[1] + $back;
		print OUT02 "$vcf[0]\t$prev\t$after\n";
	}
}

