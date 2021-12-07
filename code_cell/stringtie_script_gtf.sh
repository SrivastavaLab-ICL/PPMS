i=Ventricular_Cardiomyocyte
gtf=_fr.gtf
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Atrial_Cardiomyocyte
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Endothelial
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Fibroblast
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Neuronal
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Myeloid
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Pericytes
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Lymphoid
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Adipocytes
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Smooth_muscle_cells
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf

i=Mesothelial
stringtie $i.bam -G /rds/general/user/jj1419/ephemeral/project/microRNA/data-cell/reference/Homo_sapiens.GRCh38.102.miRNA_all.gtf -p 10 --fr -e -o $i$gtf
