#create environment
conda create -n ppms_env python=3
#acticate conda environment
conda activate ppms_env

#install packages
conda install -c conda-forge r-base=4.1.1
conda install -c bioconda samtools
conda install -c bioconda stringtie
conda install -c bioconda umi_tools
conda install -c bioconda subread