chrnames=`../samtools-1.14/samtools idxstats $1 | grep -i chr |cut -f1`

echo > test.sh
for i in $chrnames
do
	echo "python bam_extract_barcode_reads_commandline_chr_V2.py $1 $2 $i $i &" >> test.sh
done


#	echo "python bam_extract_barcode_reads_commandline_chr_V2.py possorted_genome_bam.bam Annotation_H6.txt $i $i &" >> test.sh



`rm xa*`
`split -l $4 test.sh`

for i in `ls x*`
do
	echo "wait" >> $i
	echo "echo job done!" >> $i
done

for i in `ls x*`
do
	`sh $i`
	wait
	echo "Job done"
done

celltypes=`cut -f2 $2|sort|uniq`
j=_sorted
sep=_
for i in $celltypes
do
	`../samtools-1.14/samtools merge -n -O BAM -n $3$sep$i.bam chr*$i.bam --threads $4`
#	`samtools sort $3$sep$i.bam -o $3$sep$i$j.bam`
	wait
	echo "$i done"
done

`rm chr*_*.bam`
