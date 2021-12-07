export PATH=/media/sda1-1TB/softwares/cellRanger/cellranger_v5/cellranger-5.0.1:$PATH
  
GTF=/media/sdc1-2TB/CellRanger_files/GRCh38-1.2.0_premrna
#GENOME=/media/sda1-1TB/softwares/cellRanger/refdata-cellranger-mm10-3.0.0
#GENOME=/media/sda1-1TB/softwares/cellRanger/mm10-3.0.0.mirnaa
#GENOME=/media/sdc1-2TB/CellRanger_files/GRCh38-1.2.0_premrna
#GENOME=/media/sdc1-2TB/Enrico_dataset_ALZ/GRCh38-1.2.0_premrna_miRNA
#GENOME=/media/sda1-1TB/reference_genome/refdata-gex-GRCh38-2020-A
GENOME=/media/sda1-1TB/HCA_data_heart/LV/10x_human_miRNA_all_genome
#FQ=/media/sdb1-2TB/ED_human_sample/
FQ=/media/sda1-1TB/HCA_data_heart/LV/
#cellranger count --id=Healthy_1 --fastqs=$FQ --sample=11107BM0001_PDGFBConfettiHealthy227 --transcriptome=$GENOME --localcores=10 --chemistry=SC3Pv2
#N=/media/sdc1-2TB/ED_human_sample/11785HN0001TXP-N
#S=11785HN0001TXP-N__BH_Nuc_Heart_1
#cellranger count --id=$S --fastqs=$FQ --sample=$S --transcriptome=$GENOME --localcores=10


cd /media/sda1-1TB/HCA_data_heart/LV/H3
N=5f1b1696fe9c934c8b836232
S=5f1b1696fe9c934c8b836232
cellranger count --id=$S --fastqs=$FQ --sample=$S --transcriptome=$GENOME --localcores=10 --include-introns




export PATH=/rds/general/user/jj1419/home/app/cellranger-6.0.2:$PATH

GTF=/rds/general/user/jj1419/home/app/cellranger_file/GRCh38-1.2.0_premrna
GENOME=/rds/general/user/jj1419/home/app/cellranger_file/10x_human_miRNA_all_genome
FQ=/rds/general/user/jj1419/ephemeral/microRNA/data4/fastq/

S=CBTM-390C-AX-cells-D5
cellranger count --id=$S --fastqs=$FQ --sample=$S --transcriptome=$GENOME  --localcores=10 --include-introns





export PATH=/media/sda1-1TB/softwares/cellRanger/cellranger_v5/cellranger-5.0.1:$PATH
  
GTF=/media/sdc1-2TB/CellRanger_files/GRCh38-1.2.0_premrna
GENOME=/media/sda1-1TB/HCA_data_heart/LV/10x_human_miRNA_all_genome
FQ=/home/jiahui_local/data/fastq/

S=CBTM-390C-AX-cells-D5
cellranger count --id=$S --fastqs=$FQ --sample=$S --transcriptome=$GENOME  --localcores=10 --include-introns



bam2fastq --bam CBTM-361B-AX-cells-D1.bam --out CBTM-361B-AX-cells-D1 --10xV3





