#basic setting
setwd("/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio")
#load packages
library(scales)





#mirna targets
all_mirna_list=c("miR208B","miR567","miR378D2","miR4512","miR570","miR3936","miR320E","miR3128","miR125B1","miR744","miR3714","miR5094","miR628")
right_mirna_list=c("miR208B","miR3941","miR3139","miR30B","miR6719","miR628","miR636")
left_mirna_list=c("miR208B","miR651","miR567")

mirna_list=unique(c(all_mirna_list,right_mirna_list,left_mirna_list))


#read in fpkm values
cardio_fpkm=read.table(file="Cardiomyocyte_fpkm_matrix_fr.csv",header=T,sep="\t")


#extract lv data
mat=as.matrix(cardio_fpkm[toupper(mirna_list),1:6])

scale_mat=matrix(ncol=length(colnames(mat)),nrow=length(rownames(mat)))
for (i in 1:length(rownames(mat)))
{
scale_mat[i,]=rescale(mat[i,],to=c(-1, 1))
}
colnames(scale_mat)=colnames(mat)
rownames(scale_mat)=rownames(mat)

#plot
pdf(file="vanda_scalebyitself_lines.pdf")
par(mfrow=c(3,3))
for (i in 1:length(rownames(mat)))
{
	plot(scale_mat[i,], type = "o",col = "blue", xlab = "Sample number", ylab = "Scaled gene expression", main=rownames(mat)[i])
}
dev.off()


pdf(file="vanda_scalebyitself_lines_all.pdf")
matplot(t(scale_mat), type = "b", xlab = "Sample number", ylab = "Scaled gene expression", main="All MIR", pch=1, col=1:length(rownames(mat)))
dev.off()

#axis(1, at=c(1:length(mirna_list)),labels=toupper(mirna_list))




