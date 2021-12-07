i=Ventricular_Cardiomyocyte
bam=.bam
transcript=_transcript.txt
out=_table.txt
strand=_fr
nostrand=_nostrand
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Atrial_Cardiomyocyte
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript


i=Endothelial
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript


i=Fibroblast
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Neuronal
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Myeloid
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Pericytes
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Lymphoid
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Adipocytes
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript

i=Smooth_muscle_cells
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript


i=Mesothelial
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i$bam -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript






i=Endothelial
stringtie $i -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --rf -A $i$out> $i$transcript
stringtie $i -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -A $i$strand$out> $i$strand$transcript
stringtie $i -G /rds/general/user/jj1419/home/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 -A $i$nostrand$out> $i$nostrand$transcript




