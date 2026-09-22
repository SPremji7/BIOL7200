#! /bin/bash
output=$3
tblastn -query $1 \
  -subject $2 \
  -outfmt "6 pident qlen length std" -out $output
  
awk '{if (($3*0.9>=$2) && ($1>=30)) {print $0}}' $output > hold.fna
sed '' hold.fna > $output
rm hold.fna

wc -l $output| cut -d " " -f1