$file=$ARGV[0];
open(FH,$file);
$file_out1=$file;
$file_out1=~s/\.sam/_R1\.fastq/;
$file_out2=$file;
$file_out2=~s/\.sam/_R2\.fastq/;
$file_out3=$file;
$file_out3=~s/\.sam/_I1\.fastq/;
open(OUT1,">$file_out1");
open(OUT2,">$file_out2");
open(OUT3,">$file_out3");
while($fh=<FH>)
{
	if($fh !~/^@/)
	{
		chomp($fh);
		@temp=();
		@temp=split(/\t/,$fh);
#		for($a=0;$a<=$#temp;$a=$a+1)
		{
#			print "$a\t$temp[$a]\n";
			$temp_header_1=$temp[11];
			$temp_header_1=~s/\@1/ 1/;
			$temp_header_1=~s/on:Z://;
			$temp[11]=~s/\@1/ 2/;
			$temp[11]=~s/on:Z://;
			#writing R2
			print OUT2 "\@$temp[11]\n";
			print OUT2 "$temp[9]\n+\n$temp[10]\n";
			#writing R1
			print OUT1 "\@$temp_header_1\n";
			$temp[15]=~s/CR:Z://;
			$temp[16]=~s/CY:Z://;
			$temp[13]=~s/QX:Z://;
			$temp[14]=~s/OQ:Z://;
			print OUT1 "$temp[15]$temp[13]\n+\n$temp[16]$temp[14]\n";
			#writing I1
			$temp[17]=~s/BC:Z://;   
                        $temp[18]=~s/QT:Z://;
			print OUT3 "\@$temp_header_1\n";
			print OUT3 "$temp[17]\n+\n$temp[18]\n"
		}
	}
}
close(OUT1);
close(OUT2);
close(OUT3);
system("gzip $file_out1");
system("gzip $file_out2");
system("gzip $file_out3");

