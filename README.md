# Count_homopolymer-stretch
This program can find out if the area around the variant is homopolymer stretch

## Preparing  
1.Prepare bed file from your vcf file  
  -Echange vcf to bed  
   -Please run command as below  
    perl make_bed.pl -f 10 -b 10 -v /path/to/your.vcf  
    Enter the number of nucleotides from the position of the variants 5'prime(-t) to 3'prime(-b)    
2.Pull out sequences from your fasta 
Here we will describe how to use bedtools  
bedtools getfasta -fi /reference/hg38/Homo_sapiens_assembly38.fasta -bed vcffile.bed  -fo fasta.bed  

## Run count program  
perl count_homopolymer.pl
