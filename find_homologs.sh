#! /bin/bash
output=$3
tblastn -query $1 \
  -db $2 \
  -outfmt "6 std sseq qlen" -out $output
  
awk '{if (($14*0.9>=$4) && ($3>=30)) {print $0}}' $output > hold.fna
sed '' hold.fna > $output
rm hold.fna

wc -l $output| cut -d " " -f1