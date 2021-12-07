setwd("/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio")


#-------Step 1: Read DE results-------
#read in differential reuslts
compare="AvsV"
deg_type="_mir.csv"
deg_dict="/Users/jiahuiji/Dropbox/project/microRNA/results/nuclei-cardio/DEG_edgeR/"
input=paste0(deg_dict,compare,deg_type)

deg_table=read.table(file=input,header=T,sep="\t")

AvsV=rownames(deg_table)[which(deg_table$FDR<0.1)]




#-------Step 2: miRNA targets-------
mirna_list=c("miR208B","miR567","miR378D2","miR4512","miR570","miR3936","miR320E","miR3128","miR125B1","miR744","miR3714","miR5094","miR628")
alldeg_file="AvsV_all_paired"
mirdeg_file="AvsV_mir_paired"
AvsV_mir_target=c()
for(i in 1:length(mirna_list))
{
	target=opposite_mir_target(mirna_list[i],alldeg_file,mirdeg_file)
	AvsV_mir_target=append(AvsV_mir_target,target)
}


mirna_list=c("miR3941","miR5094","miR208B","miR6777","miR628","miR6719","miR5690")
alldeg_file="LVvsRA_all"
mirdeg_file="LVvsRA_mir"
LVvsRA_mir_target=c()
for(i in 1:length(mirna_list))
{
	target=opposite_mir_target(mirna_list[i],alldeg_file,mirdeg_file)
	LVvsRA_mir_target=append(LVvsRA_mir_target,target)
}



mirna_list=c("miR208B","miR651","miR567")
alldeg_file="LVvsLA_all"
mirdeg_file="LVvsLA_mir"
LVvsLA_mir_target=c()
for(i in 1:length(mirna_list))
{
	target=opposite_mir_target(mirna_list[i],alldeg_file,mirdeg_file)
	LVvsLA_mir_target=append(LVvsLA_mir_target,target)
}



mirna_list=c("miR208B","miR3941","miR3139","miR30B","miR6719","miR628","miR636")
alldeg_file="RVvsRA_all"
mirdeg_file="RVvsRA_mir"
RVvsRA_mir_target=c()
for(i in 1:length(mirna_list))
{
	target=opposite_mir_target(mirna_list[i],alldeg_file,mirdeg_file)
	RVvsRA_mir_target=append(RVvsRA_mir_target,target)
}



all_target=unique(c(AvsV_mir_target,LVvsLA_mir_target,RVvsRA_mir_target))
write.table(all_target,file="allAvsv_mir_target.csv",sep="\t",quote=F)


write.table(unique(AvsV_mir_target),file="all_mir_target_paired.csv",sep="\t",quote=F)








#------Step 3: Create miRNA target interaction for network-------
alldeg_file="AvsV_all_paired"
mirdeg_file="AvsV_mir_paired"
AvsV_mir_interaction=matrix(nrow=1,ncol=2)
for(i in 1:length(mirna_list))
{
	target=mir_target_network(mirna_list[i],alldeg_file,mirdeg_file)
	AvsV_mir_interaction=rbind(AvsV_mir_interaction,target)
}

write.table(AvsV_mir_interaction,file="mir_target_interaction_paired.csv",sep="\t",quote=F)








#------Step 4: Create miRNA and target interaction matrix-------
mirna_list=c("miR208B","miR567","miR378D2","miR4512","miR570","miR3936","miR320E","miR3128","miR125B1","miR744","miR3714","miR5094","miR628")
alldeg_file="AvsV_all_paired"
mirdeg_file="AvsV_mir_paired"
AvsV_mir_target=matrix(nrow=1,ncol=2)
for(i in 1:length(mirna_list))
{
	target=opposite_mir_target_v2(mirna_list[i],alldeg_file,mirdeg_file)
	AvsV_mir_target=rbind(AvsV_mir_target,target)
}









#-------Step 5: Find miRNA targets for customor list of miRNAs-------
#AvsV comparison
mirna_list=c("miR208B","miR567","miR378D2","miR4512","miR570","miR3936","miR320E","miR3128","miR744","miR3714","miR5094","miR628")
output="Vhigh_mirna_targets.csv"

mirna_list=c("miR125B1")
output="Ahigh_mirna_targets.csv"

#analysis
alldeg_file="AvsV_all_paired"
mirdeg_file="AvsV_mir_paired"
AvsV_mir_target=c()
for(i in 1:length(mirna_list))
{
	target=opposite_mir_target(mirna_list[i],alldeg_file,mirdeg_file)
	AvsV_mir_target=append(AvsV_mir_target,target)
}
write.table(AvsV_mir_target,file=output,sep="\t",quote=F)











