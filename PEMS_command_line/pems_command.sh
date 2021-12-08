#PEMS
#To run the command lines below, you need to have or install
#python version3
#samtools
#stringtie
#featureCounts
#umi_tools


#Step 1: Split your bam file after alignment based on celltypes
samtools index your_bam_file.bam
sh ../shell_execute.sh your_bam_file.bam your_celltype_annotation.txt output_file_name 5 #5 is the number of processor


#step 2: Run stringtie
samtools sort your_split_bamfile.bam -o your_split_bamfile_s.bam
samtools sort index your_split_bamfile_s.bam

i=the_name_before_s.bam
bam=.bam
transcript=_transcript.txt
out=_table.txt
strand=_fr
gtf=_fr.gtf

stringtie $i$bam -G /your_reference_folder/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i.bam -G /your_reference_folder/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf



#step 3: Extract UMI
#assign reads to genes
featureCounts -a /your_reference_folder/Homo_sapiens.GRCh38.102.miRNA_justmir.gtf \
              -o output_name.bam \
              -R BAM your_split_bamfile.bam \
              -M \
              -s 1\
              -T 4; 

samtools sort your_split_bamfile.bam.featureCounts.bam -o another_output_name.bam
samtools index another_output_name.bam


#counting molecules
umi_tools count --wide-format-cell-counts --per-gene --gene-tag=XT --assigned-status-tag=XS --per-cell --extract-umi-method=tag --umi-tag=UR --cell-tag=CB -I another_output_name.bam -S output_name_counts.tsv.gz

#--umi-tag=UR, UR is the flag of your umi
#--cell-tag=CB, CB is the flag of your cell barcode
#check the flag names in your bam files by samtools view, it might be different because of different alignment methods