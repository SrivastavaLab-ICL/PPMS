#get_fpkm
#get_fpkm_all
#opposite_mir_target









#required packages
library(stringr) #deal with string

















#######
#######
####### Read in stringtie results table get FPKM value - nuclei version (function)
####### Return FPKM value one line matrix of MIR genes (result)
####### sample: sample name, character
####### celltype: celltype name, character
####### 
#######


get_fpkm=function(dict,celltype)
{
	#parameter
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
####### Return FPKM value one line matrix of all genes (result)
####### sample: sample name, character
####### celltype: celltype name, character
####### 
#######


get_fpkm_all=function(dict,celltype)
{
	#parameter
	input=paste0(dict,celltype,"_fr_table.txt")

	#read-in 
	read_table=read.table(file=input,header=T,sep="\t")

	#select MIR genes
	mir_table=read_table[which(str_detect(read_table$Gene.ID,"ENSG")),]
	vec=mir_table$FPKM
	names(vec)=mir_table$Gene.Name
	return(vec)
}

####### done!













#######
#######
####### Find significantly differential miRNA targets with opposite fold change (function)
####### Return a vector of filtered MIR targets (result)
####### mirna: character, miRxxx
####### alldeg_file: all differential expression genes table
####### mirdeg_file: only MIR differential expression genes table
#######
#######


opposite_mir_target=function(mirna,alldeg_file,mirdeg_file)
{
	#read in mirna target file
	dic="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/mirna_target/"
	input_target=paste0(dic,mirna,".csv")
	target_table=read.table(file=input_target,header=T,sep=",")

	#read DEGs of all genes
	dic_dif="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/DEG_edgeR/"
	deg_all=read.table(file=paste0(dic_dif,alldeg_file,".csv"),header=T,sep="\t")
	#read DEGs of MIR genes
	deg_mir=read.table(file=paste0(dic_dif,mirdeg_file,".csv"),header=T,sep="\t")
	#read in miRNA targeting genes
	target_gene=unique(target_table$genesymbol)
	varify=unique(target_table$genesymbol[which(str_detect(target_table$validated,"MIR"))])


	#read fold change of MIR gene
	mir_fc=deg_mir[toupper(mirna),]$logFC
	if (mir_fc>0)
	{
		mir_target=intersect(deg_all$gene_name[which(deg_all$logFC<0)],target_gene)
	}

	if (mir_fc<0)
	{
		mir_target=intersect(deg_all$gene_name[which(deg_all$logFC>0)],target_gene)
	}

	return(mir_target)
}

#######done!














#######
#######
####### Find significantly differential miRNA targets with opposite fold change (function)
####### Return a two column matrix with MIR name and filtered MIR targets (result)
####### mirna: character, miRxxx
####### alldeg_file: all differential expression genes table
####### mirdeg_file: only MIR differential expression genes table
#######
#######


opposite_mir_target_v2=function(mirna,alldeg_file,mirdeg_file)
{
	#read in mirna target file
	dic="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/mirna_target/"
	input_target=paste0(dic,mirna,".csv")
	target_table=read.table(file=input_target,header=T,sep=",")

	#read DEGs of all genes
	dic_dif="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/DEG_edgeR/"
	deg_all=read.table(file=paste0(dic_dif,alldeg_file,".csv"),header=T,sep="\t")
	#read DEGs of MIR genes
	deg_mir=read.table(file=paste0(dic_dif,mirdeg_file,".csv"),header=T,sep="\t")
	#read in miRNA targeting genes
	target_gene=unique(target_table$genesymbol)
	varify=unique(target_table$genesymbol[which(str_detect(target_table$validated,"MIR"))])


	#read fold change of MIR gene
	mir_fc=deg_mir[toupper(mirna),]$logFC
	if (mir_fc>0)
	{
		mir_target=intersect(deg_all$gene_name[which(deg_all$logFC<0)],target_gene)
	}

	if (mir_fc<0)
	{
		mir_target=intersect(deg_all$gene_name[which(deg_all$logFC>0)],target_gene)
	}


	mat=matrix(nrow=length(mir_target),ncol=2)
	colnames(mat)=c("miR","miR targets")
	mat[,1]=rep(mirna,times=length(mir_target))
	mat[,2]=mir_target
	return(mat)
}

#######done!




















#######
#######
####### Find significantly differential miRNA targets with opposite fold change and create network (function)
####### Return all interactions matrix (result)
####### mirna: character, miRxxx
####### alldeg_file: all differential expression genes table
####### mirdeg_file: only MIR differential expression genes table
#######
#######



mir_target_network=function(mirna,alldeg_file,mirdeg_file)
{
	#read in mirna target file
	dic="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/mirna_target/"
	input_target=paste0(dic,mirna,".csv")
	target_table=read.table(file=input_target,header=T,sep=",")

	#read DEGs of all genes
	dic_dif="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/DEG_edgeR/"
	deg_all=read.table(file=paste0(dic_dif,alldeg_file,".csv"),header=T,sep="\t")
	#read DEGs of MIR genes
	deg_mir=read.table(file=paste0(dic_dif,mirdeg_file,".csv"),header=T,sep="\t")
	#read in miRNA targeting genes
	target_gene=unique(target_table$genesymbol)
	varify=unique(target_table$genesymbol[which(str_detect(target_table$validated,"MIR"))])


	#read fold change of MIR gene
	mir_fc=deg_mir[toupper(mirna),]$logFC
	if (mir_fc>0)
	{
		mir_target=intersect(deg_all$gene_name[which(deg_all$logFC<0)],target_gene)
	}

	if (mir_fc<0)
	{
		mir_target=intersect(deg_all$gene_name[which(deg_all$logFC>0)],target_gene)
	}

	mat=matrix(nrow=length(mir_target),ncol=2)
	for (i in 1:length(mir_target))
	{
	mat[i,1]=mirna
	mat[i,2]=mir_target[i]
	}
	
	return(mat)

}

####### done!





