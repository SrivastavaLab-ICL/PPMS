import pysam
import re
import sys



#bamfile=pysam.AlignmentFile("possorted_genome_bam.bam", "rb");
bamfile=pysam.AlignmentFile(sys.argv[1], "rb");
#ANN=open("Annotation_H6.txt","r");
ANN={}
cell_types={}
#with open('Annotation_H6.txt') as f:
with open(sys.argv[2]) as f:
#with open('temp') as f:
    for lines in f:
        lines=lines.replace("\n","")
        ann=lines.split('\t',2)
        ANN[ann[0]]=ann[1]
        cell_types[ann[1]]=1
#        print (ANN[ann[0]])


key_ANN=list(ANN.keys())
key_cell_types=list(cell_types.keys())

#print (key_cell_types[2])
out_files=[]

for CT in key_cell_types:
    out=pysam.AlignmentFile(sys.argv[3] + "_" + CT + ".bam", "wb", template=bamfile)
    out_files.append(out)
#out.write("hello")

#out_files[0].write("hello world")

#bamfile=pysam.AlignmentFile("possorted_genome_bam.bam", "rb");


for read in bamfile.fetch(sys.argv[4]):
#    print (read)
    if read.has_tag('CB'):
        CB=read.get_tag('CB')
        for i in range(len(key_cell_types)):
            if(key_cell_types[i] == ANN.get(CB)):
                out_files[i].write(read)
#        print (CB)
#        print (ANN.get(CB))

bamfile.close()
