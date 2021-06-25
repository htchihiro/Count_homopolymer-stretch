#!usr/bin/env perl

use strict;
use warnings;

my $fasta_File = "fasta.bed";
my $outputFile = "countHomopolymer.txt";


my @line;
my $fA = 0;
my $fG = 0;
my $fT = 0;
my $fC = 0;
my $bA = 0;
my $bG = 0;
my $bT = 0;
my $bC = 0;
my $n_nuc;
my $f_count = "NA";
my $b_count = "NA";
my $f_sum = 0;
my $b_sum = 0;

open(IN01, "<$fasta_File") or die "IN01";
open(OUT01, ">$outputFile") or die "OUT01";

@line = <IN01>;
for ( my $l = 0; $l <= $#line; $l++ ) {
	chomp($line[$l]);
        if ( $line[$l] =~ m/chr/ ) {
                my @fasta = split(/>|:|-/, $line[$l]);
		my $ll = $l + 1;
		my $nuc_seq = $line[$ll];
		my @nuc = split(//, $nuc_seq);
		if ( $nuc[8] eq $nuc[9] ) {
			for ( my $f = 9; $f >= 1; $f--) {
				$n_nuc = $nuc[$f];
				my $ff = $f - 1;
				my $f_nuc = $nuc[$ff];
				if ( $n_nuc eq $f_nuc ) {
					if ( $n_nuc eq "A" ) {
						$fA += 1;
					} elsif ( $n_nuc eq "G" ) {
                                                $fG += 1;
					} elsif	( $n_nuc eq "T" ) {
                                                $fT += 1;
					} elsif	( $n_nuc eq "C" ) {
                                                $fC += 1;
					}
				} else {
					last;
				} 
			}
			if ( $fA >= 1 ) {
                                $f_sum = $fA;
                                $f_count = "A";
                        } elsif ( $fG >= 1 ) {
                                $f_sum = $fG;
                                $f_count = "G";
                        } elsif ( $fT >= 1 ) {
                                $f_sum = $fT;
                                $f_count = "T";
                        } elsif ( $fC >= 1 ) {
                                $f_sum = $fC;
                                $f_count = "C";
                        }
			$fA = 0;
	                $fG = 0;
        	        $fT = 0;
                	$fC = 0;
			$n_nuc = "";
		} 
		if ( $nuc[11] eq $nuc[12] ) { 
			for ( my $b = 11; $b <= 29; $b++) {
				$n_nuc = $nuc[$b];
                                my $bb = $b - 1;
                                my $b_nuc = $nuc[$bb];
                                if ( $n_nuc eq $b_nuc )	{
                                        if ( $n_nuc eq "A" ) {
                                                $bA += 1; 
                                        } elsif	( $n_nuc eq "G" ) {
                                                $bG += 1;
                                        } elsif ( $n_nuc eq "T" ) {
                                                $bT += 1;
                                        } elsif ( $n_nuc eq "C" ) {
                                                $bC += 1;
                                        }
                                } else {
                                        last;
                                }
                        }	
			if ( $bA >= 1 ) {
				$b_sum = $bA;
				$b_count = "A";
			} elsif ( $bG >= 1 ) {
                                $b_sum = $bG;
                                $b_count = "G";
                        } elsif ( $bT >= 1 ) {
                                $b_sum = $bT;
                                $b_count = "T";
                        } elsif ( $bC >= 1 ) {
                                $b_sum = $bC;
                                $b_count = "C";
                        }
                        $bA = 0;
                        $bG = 0;
                        $bT = 0;
                        $bC = 0;
			$n_nuc = "";
		} 
		my $pos = $fasta[2] + 10;
		print OUT01 "$fasta[1]\t$pos\t$f_count\t$f_sum\t$b_count\t$b_sum\n";
                $fA = 0;
		$fG = 0;
		$fT = 0;
		$fC = 0;
		$bA = 0;
                $bG = 0;
                $bT = 0;
                $bC = 0;
		$f_count = "NA";
		$b_count = "NA";
		$f_sum = "0";
		$b_sum = "0";
        }
}
