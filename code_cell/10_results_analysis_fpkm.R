#cell
#parameter
celltype="Ventricular_Cardiomyocyte"
output=paste0(celltype,"_fpkm_matrix.csv")
dic="/rds/general/ephemeral/user/jj1419/ephemeral/project/microRNA/data-nuclei/fastq/"




#-------step 1: define sample list-------
#cell
sample_list=c("CBTM-361B-LV-nuclei-D1","CBTM-362C-LV-nuclei-D2","CBTM-364B-LV-nuclei-D3",
	"CBTM-386C-LV-nuclei-D4","CBTM-390C-LV-nuclei-D5","CBTM-417C-LV-nuclei-D6",
	"CBTM-423C-LV-nuclei-D7","CBTM-473C-LV-nuclei-D11")







#-------step 2: get standard rownames-------
sample=sample_list[1]
vec_lv=get_fpkm_nuclei(sample,celltype,dic)
standard_row=names(vec_lv)





#-------step 3: generate fpkm matrix-------
mat=matrix(ncol=length(sample_list),nrow=length(standard_row))
rownames(mat)=standard_row
colnames(mat)=sample_list

for (i in 1:length(sample_list))
{
	line=get_fpkm_nuclei(sample_list[i],celltype,dic)
	line_with_standard=line[standard_row]
	mat[,i]=line_with_standard
}

write.table(mat,file=output,sep='\t',quote=F)














