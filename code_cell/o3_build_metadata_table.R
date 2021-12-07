#function to create mat_line form one sample & one reguion
build_meta_line=function(input_file)
{
	input=read.table(file=input_file,sep="\t")

	celltype=c("Adipocytes","Atrial_Cardiomyocyte","Endothelial","Fibroblast","Lymphoid","Mesothelial","Myeloid","Neuronal","NotAssigned","Pericytes","Smooth_muscle_cells","Ventricular_Cardiomyocyte")
	mat_line=matrix(nrow=1,ncol=length(celltype))
	colnames(mat_line)=celltype
	rownames(mat_line)=input_file

	for (i in 1:length(celltype))
	{
		mat_line[1,celltype[i]]=length(which(input$V2==celltype[i]))

	}
	return(mat_line)
}



#parameter
#cell
sample_list=c("AX-D1.txt","AX-D3.txt","LV-D3.txt","LA-D3.txt","SP-D3.txt","RV-D3.txt","RV-D4.txt","RA-D4.txt","AX-D4.txt","LV-D4.txt","LA-D4.txt","SP-D4.txt","RA-D5.txt","LV-D5.txt","SP-D5.txt","RV-D5.txt","AX-D5.txt","LA-D5.txt","AX-D6.txt","SP-D6.txt","RV-D6.txt","LV-D6.txt","RA-D6.txt","LA-D6.txt","LV-D6.txt","LA-D6.txt","RA-D6.txt","RV-D6.txt","AX-D6.txt","SP-D6.txt","RA-D7.txt","LV-D7.txt","LV-D7.txt","LA-D7.txt","RA-D7.txt","SP-D7.txt","LA-D7.txt","SP-D7.txt","RV-D7.txt","AX-D7.txt","AX-D7.txt","RV-D7.txt","LV-D11.txt","RV-D11.txt","AX-D11.txt","SP-D11.txt","RA-D11.txt","LA-D11.txt","SP-D11.txt","AX-D11.txt","LA-D11.txt","RV-D11.txt","RA-D11.txt","LV-D11.txt")
#nuclei
sample_list=c("AX-D1.txt","RV-D1.txt","LA-D1.txt","LV-D1.txt","SP-D2.txt","RV-D2.txt","LV-D2.txt","AX-D2.txt","RA-D2.txt","LA-D2.txt","RA-D3.txt","SP-D3.txt","AX-D3.txt","LV-D3.txt","RV-D3.txt","LA-D3.txt","RA-D4.txt","LA-D4.txt","SP-D4.txt","RV-D4.txt","AX-D4.txt","LV-D4.txt","RA-D5.txt","SP-D5.txt","RV-D5.txt","LA-D5.txt","LV-D5.txt","AX-D5.txt","RA-D6.txt","SP-D6.txt","RV-D6.txt","AX-D6.txt","LV-D6.txt","LA-D6.txt","LV-D7.txt","LA-D7.txt","AX-D7.txt","SP-D7.txt","RA-D7.txt","RV-D7.txt","RA-D11.txt","LV-D11.txt","AX-D11.txt","LA-D11.txt","RV-D11.txt","SP-D11.txt")
output="meta_info_nuclei.csv"




#build matrix
celltype=c("Adipocytes","Atrial_Cardiomyocyte","Endothelial","Fibroblast","Lymphoid","Mesothelial","Myeloid","Neuronal","NotAssigned","Pericytes","Smooth_muscle_cells","Ventricular_Cardiomyocyte")

mat=matrix(nrow=length(sample_list),ncol=length(celltype))
colnames(mat)=celltype
rownames(mat)=sample_list

for (i in 1:length(sample_list))
{
	mat[i,]=build_meta_line(sample_list[i])
}

write.table(mat,file=output,sep="\t")












