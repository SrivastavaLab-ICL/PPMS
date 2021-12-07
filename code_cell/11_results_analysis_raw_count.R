#cell
#load packages 
library(ggplot2) #plot
library(DESeq2) #differential expression analysis





#-------Step 1: chane transcript id to gene symbol-------
#load packages
library(biomaRt) #transfer transcript id
library(stringr) #deal with string
library(edgeR) #cpm transfer

#parameter
celltype="Endothelial"
input=paste0(celltype,"_transcript_count_matrix_fr.csv")
output=paste0(celltype,"_transcript_count_matrix_mirna_fr.csv")
output_all=paste0(celltype,"_transcript_count_matrix_all_fr.csv")
output_cpm=paste0(celltype,"_transcript_count_matrix_mirna_cpm_fr.csv")


#read in
count_mat=as.matrix(read.csv(input,row.names="transcript_id"))

#transfer transcript id into gene symbol
mart=useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl")
result=getBM(attributes=c('ensembl_transcript_id', 'ensembl_gene_id', "hgnc_symbol"),
             filters = 'ensembl_transcript_id', 
             values = rownames(count_mat),
             mart = mart)

#select miRNA genes
mirna_gene_line=which(str_detect(result$hgnc_symbol,"MIR"))

mat=count_mat[result$ensembl_transcript_id[mirna_gene_line],]
rownames(mat)=result$hgnc_symbol[mirna_gene_line]
colnames(mat)=colnames(count_mat)

#save file
write.table(mat,file=output,sep="\t",quote=F)





#cpm transform
col=c()
for (i in 1:length(colnames(count_mat)))
{
    if (sum(count_mat[,i])!=0)
    {col=append(col,i)}
}

count=count_mat[,col]
count_mat_cpm=cpm(count)


#transfer transcript id into gene symbol
mart=useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl")
result=getBM(attributes=c('ensembl_transcript_id', 'ensembl_gene_id', "hgnc_symbol"),
             filters = 'ensembl_transcript_id', 
             values = rownames(count_mat_cpm),
             mart = mart)

#select miRNA genes
mirna_gene_line=which(str_detect(result$hgnc_symbol,"MIR"))

mat_cpm=count_mat_cpm[result$ensembl_transcript_id[mirna_gene_line],]
rownames(mat_cpm)=result$hgnc_symbol[mirna_gene_line]
colnames(mat_cpm)=colnames(count_mat_cpm)

#save file
write.table(mat_cpm,file=output_cpm,sep="\t",quote=F)














#-------Step 2: run differential expression analysis-------
#parameter
celltype="Endothelial"
input=paste0(celltype,"_transcript_count_matrix_mirna_cpm_fr.csv")
count_mat=read.table(input,sep="\t",header=T)
dif_meta=read.table(file="/Users/jiahuiji/Dropbox/project/microRNA/results/differential_meta_cell_v2.csv",header=T,sep=",")


#filter matrix and meta data
#dif meta
Sample_name=gsub("-",".",dif_meta$Sample_name)

dif_meta$Sample_name=Sample_name
count_mat=count_mat[,Sample_name]



#select correct samples
correct_sample=c()
for (i in 1:length(colnames(count_mat)))
{
    if (sum(count_mat[,i])>0)
    {correct_sample=append(correct_sample,i)}
    
}
correct_sample

#select miRNAs with expression over 0
mirna=c()
for (i in 1:length(rownames(count_mat)))
{
    if (sum(count_mat[i,])>0 & sd(count_mat[i,])>0.3)
    {mirna=append(mirna,i)}
}
length(mirna)


mat=count_mat[mirna,correct_sample]
meta=dif_meta[correct_sample,]
dim(mat)
dim(meta)


#differential expression
design=model.matrix(~0 + meta$Region + meta$Sex + as.numeric(meta$Endothelial_cell_number))
rownames(design)=meta$Sample_name
colnames(design)=c("LA","LV","RA","RV","Sex","Cell_number")

fit=lmFit(mat,design)
cont_matrix=makeContrasts(LA-LV-RA-RV,levels=design)
cont_matrix

fit2=contrasts.fit(fit, cont_matrix)
fit3=eBayes(fit2, trend=TRUE)
res=topTable(fit3,coef=1,n=Inf, adjust="BH",sort.by="P")


















