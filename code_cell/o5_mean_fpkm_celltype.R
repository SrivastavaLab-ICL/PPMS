#parameter
celltype="Ventricular_Cardiomyocyte"

setwd("/Users/jiahuiji/Dropbox/project/microRNA/results/single_nuclei/fpkm_matrix")
input_file=paste0(celltype,"_fpkm_matrix.csv")


#fpkm matrix
mat=read.table(file=input_file,header=T,sep="\t")

mean_fpkm=c()
for (i in 1:length(rownames(mat)))
{
	mean_fpkm=append(mean_fpkm,mean(as.numeric(mat[i,])))
}
names(mean_fpkm)=rownames(mat)

head(sort(mean_fpkm, decreasing=TRUE),n=50)