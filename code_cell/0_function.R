#create_celltype_info




#required packages
library(stringr) #deal with string






#######
#######
####### Create cell type information for sinto (function)
####### Return cell type information txt file (result)
####### a: donor, character
####### b: region, charactor
####### meta: read-in meta data
####### Sanger-Cells or Sanger Nuclei
#######



create_celltype_info=function(a,b,meta) 
{
	line=which(meta$cell_source=="Sanger-Nuclei" & meta$donor==a & meta$region==b)
	celltype=as.vector(meta[line,5])

	cellname=c()
	for (i in 1:length(line))
	{
		sep=strsplit(as.character(meta[line,1][i]),split="-")
		cellname=append(cellname,paste0(sep[[1]][1],"-",sep[[1]][2]))
	}
			
	sink(paste0(b,'-',a,'.txt'))
	for (i in 1:length(cellname))
	{
		cat(cellname[i])
		cat('\t')
		cat(celltype[i])
		cat('\n')
	}
	sink()	
}

####### done!







#######
#######
####### Read in stringtie results table get FPKM value - cell version (function)
####### Return FPKM value one line matrix (result)
####### sample: sample name, character
####### celltype: celltype name, character
####### dic: results directory + /
#######
#######

get_fpkm_cell=function(sample,celltype,dic)
{
	#parameter
	dict=paste0(dic,sample,"/")
	input=paste0(dict,celltype,"_fr_table.txt")

	#read-in 
	read_table=read.table(file=input,header=T,sep="\t")

	#select MIR genes
	mir_table=read_table[which(str_detect(read_table$Gene.Name,"MIR")),]
	vec=mir_table$FPKM
	names(vec)=mir_table$Gene.Name
	return(vec)
}

####### done!








#######
#######
####### Read in stringtie results table get FPKM value - nuclei version (function)
####### Return FPKM value one line matrix (result)
####### sample: sample name, character
####### celltype: celltype name, character
####### 
#######


get_fpkm_nuclei=function(sample,celltype,dic)
{
	#parameter
	dict=paste0(dic,sample,"/")
	input=paste0(dict,celltype,"_fr_table.txt")

	#read-in 
	read_table=read.table(file=input,header=T,sep="\t")

	#select MIR genes
	mir_table=read_table[which(str_detect(read_table$Gene.Name,"MIR")),]
	vec=mir_table$FPKM
	names(vec)=mir_table$Gene.Name
	return(vec)
}

####### done!























