#step 1: generate download script

#read sample information table
setwd("/Users/jiahuiji/Dropbox/project/microRNA/code/code_cell/")
setwd("/Users/jiahuiji/Dropbox/project/microRNA/code/code_nuclei/")

input_file="/Users/jiahuiji/Dropbox/project/microRNA/data/HCA_map_sanger_cell.csv"
input_file="/Users/jiahuiji/Dropbox/project/microRNA/data/HCA_map_sanger_nuclei.csv"

sample_id=read.table(input_file,header=T,sep=',') #54x21
sample_id=sample_id[order(sample_id$Rawdata_ID),]



#write download script - curl download
output_file="2_data_download_curl.sh"
sink(output_file)
for (i in 1:length(rownames(sample_id)))
{
	charac_bam=paste0("curl -o ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".bam ",
		strsplit(sample_id$submitted_ftp[i],split=';')[[1]][1])

	charac_bai=paste0("curl -o ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".bai ",
		strsplit(sample_id$submitted_ftp[i],split=';')[[1]][2])

	cat(charac_bam)
	cat('\n')
	cat(charac_bai)
	cat('\n')
}
sink()







#step 2: transfer bam to sam
output_bam_to_sam="3_bam_to_sam.sh"
sink(output_bam_to_sam)
for (i in 1:length(rownames(sample_id)))
{
	charac=paste0("samtools view ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".bam ",
		"> ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".sam ")

	cat(charac)
	cat('\n')
}
sink()








#step 3: transfer sam to fastq
output_sam_to_fastq="4_sam_to_fastq.sh"
sink(output_sam_to_fastq)
for (i in 1:length(rownames(sample_id)))
{
	charac=paste0("perl sam_to_fastq_v2.pl ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".sam")

	cat(charac)
	cat('\n')
}
sink()





#step 4: change fastq name for cellranger mapping
output_change_name="5_cellranger_change_name.sh"
sink(output_change_name)
for (i in 1:length(rownames(sample_id)))
{
	charac1=paste0("mv ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"_I1.fastq.gz ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"_S1_L001_I1_001.fastq.gz")
	charac2=paste0("mv ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"_R1.fastq.gz ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"_S1_L001_R1_001.fastq.gz")
	charac3=paste0("mv ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"_R2.fastq.gz ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"_S1_L001_R2_001.fastq.gz")
	cat(charac1)
	cat('\n')
	cat(charac2)
	cat('\n')
	cat(charac3)
	cat('\n')
}
sink()









#step 5: map cellranger
output_cellranger="6_cellranger_map.sh"
sink(output_cellranger)
for (i in 1:length(rownames(sample_id)))
{
	charac1=paste0("S=",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])
	charac2="cellranger count --id=$S --fastqs=$FQ --sample=$S --transcriptome=$GENOME --localcores=10 --include-introns"

	cat(charac1)
	cat('\n')
	cat(charac2)
	cat('\n')
}
sink()






#step 6.1: prepare cell type information for sinto
meta=read.table(file="hca_heart_global_ctl200601_metadata.csv",header=T,sep=",")

#enter like under code to create cell type information, go to 7.1_create_celltype_info.sh
create_celltype_info('D1','AX',meta)


output_cellranger="7.1_create_celltype_info.sh"
sink(output_cellranger)
for (i in 1:length(rownames(sample_id)))
{
	charac1=paste0("create_celltype_info(",
		"'",
		sample_id$HCA_paper_ID[i],
		"',",
		"'",
		sample_id$Region[i],
		"',",
		"meta)")

	cat(charac1)
	cat('\n')
}
sink()





#step 6.2: run sinto
output_sinto="7.2_sinto.sh"
sink(output_sinto)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("cd ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])

	charac1=paste0("sinto filterbarcodes -b ./outs/possorted_genome_bam.bam -c ../celltype_info/",
		sample_id$Region[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".txt -p 10 > ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"-filter.bam")

	charac2="cd .."

	cat(charac0)
	cat('\n')
	cat(charac1)
	cat('\n')
	cat(charac2)
	cat('\n')
}
sink()




#step 7: run stringtie
output_stringtie="8.1_stringtie.sh"
sink(output_stringtie)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("cd ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])

	charac1="sh /rds/general/user/jj1419/ephemeral/microRNA/code/stringtie_script.sh"

	charac2="cd .."

	cat(charac0)
	cat('\n')
	cat(charac1)
	cat('\n')
	cat(charac2)
	cat('\n')

}



output_stringtie="8.2_stringtie_gtf.sh"
sink(output_stringtie)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("cd ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])

	charac1="sh /rds/general/user/jj1419/ephemeral/project/microRNA/code/stringtie_script_gtf.sh"

	charac2="cd .."

	cat(charac0)
	cat('\n')
	cat(charac1)
	cat('\n')
	cat(charac2)
	cat('\n')

}







#step 8: extract count matrix from gtf file
type="Cardiomyocyte"


output_stringtie="9.1_extract_count_matrix_gtf_mkdir.sh"

sink(output_stringtie)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("mkdir ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])


	cat(charac0)
	cat('\n')

}




output_stringtie="9.2_extract_count_matrix_gtf_cp.sh"

sink(output_stringtie)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("cp ./",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"/",
		"*",
		type,
		"_fr.gtf",
		" ./",
		type,
		"_count_matrix/",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i],
		"/")

	cat(charac0)
	cat('\n')
	
}


















#other 1: make directory
output_stringtie="o1_make_directory.sh"
sink(output_stringtie)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("mkdir ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])

	cat(charac0)
	cat('\n')

}



#other 2: copy stringtie results
output_stringtie="o2_copy_stringtie_results.sh"
sink(output_stringtie)
for (i in 1:length(rownames(sample_id)))
{
	charac0=paste0("cd ",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])

	charac1=paste0("cp *txt ",
		"/rds/general/user/jj1419/ephemeral/microRNA/data-nuclei/stringtie/",
		sample_id$Rawdata_ID[i],
		"-",
		sample_id$Region[i],
		"-",
		sample_id$Sample_type[i],
		"-",
		sample_id$HCA_paper_ID[i])

	charac2="cd .."

	cat(charac0)
	cat('\n')
	cat(charac1)
	cat('\n')
	cat(charac2)
	cat('\n')

}



#other 4: create celltype cell number metatable from txt file
output_cellranger="o4_metatable_from_txt.R"
sink(output_cellranger)
for (i in 1:length(rownames(sample_id)))
{
	charac1=paste0('"',
		sample_id$Region[i],
		"-",
		sample_id$HCA_paper_ID[i],
		".txt",
		'"')

	cat(charac1)
	cat(',')
}
sink()




