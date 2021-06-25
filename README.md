# Count_homopolymer-stretch

Overview
This program can find out if the area around the variant is homopolymer stretch

## Set up  
### bedtools
For creating bed files  
https://bedtools.readthedocs.io/en/latest/content/installation.html  

---
$ wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary
---

## Usage
### execute  
#### 1. Prepare bed file from your vcf file  
##### Echange vcf to bed  
###### Please run command as below  

---  
    perl make_bed.pl -f 10 -b 10 -v /path/to/your.vcf  
---  
    Enter the number of nucleotides from the position of the variants 5'prime(-t) to 3'prime(-b)    

#### 2. Pull out sequences from your fasta 
Here we will describe how to use bedtools  

---
bedtools getfasta -fi /reference/hg38/Homo_sapiens_assembly38.fasta -bed vcffile.bed  -fo fasta.bed  
---

#### 3. Run count program  
---
perl count_homopolymer.pl  
---

## Note
 
I don't test environments under Linux.

## Licence

[Apache License 2.0](https://github.com/htchihiro/Count_homopolymer-stretch/blob/main/LICENSE)

## Author  

* htchihiro
* National institute of genetics
