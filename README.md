# PEMS

**How to run PEMS:** 

**Step 1: Download app folder of the version you want**
PEMS app have one version for MacOS system and one version for linux system.

**Step 2: Download RStudio and load PEMS**
Download RStudio in your computer first. Go to app folder you downloaded and double click ui.R, ui.R will show in your RStudio. Click Runn App, PEMS shinyR interface will show. In the interface, if you click Open in Browser, it will be opened in browser.

![plot](./readme_figure/rstudio.png)

![plot](./readme_figure/interface.png)

**Step 3: Download required R packages and tools for analysis**
Once you click Run App butten, it will automatically install the R packages that you don't have for you. All required tools are downloaded under the app folder. You don't need to download them. 

If you would like to calculate UMI for your single sample run, you need to install UMI-tools (see download instruction here: https://umi-tools.readthedocs.io/en/latest/QUICK_START.html#step-1-install-umi-tools. You can download it by entering system("conda install -c bioconda umi_tools") or system("pip install umi_tools") in R Console in R studio. 

![plot](./readme_figure/console.png)

**Step 4: Run PEMS**
Now you can run PEMS using the PEMS interface for single sample run, multi-sample run, differential expression analysis and power estimation.
