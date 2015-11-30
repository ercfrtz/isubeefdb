#!/usr/bin/perl

use warnings;
use strict;
use DBI;
 
my $db2 ="isubeefdb";
my $user = "eric";
my $pass = "R1ftw4lker";
my $host="localhost";
#my $dbh2 = DBI->connect("DBI:mysql:$db2:$host", $user, $pass);
my $dbh2 = DBI->connect("DBI:mysql:database=$db2;host=$host;mysql_socket=/data/mysql/mysql.sock",$user,$pass);
my $filename = $ARGV[0];
my $totalCount = 0;
my $enterCount = 0;

 my $outfile = $filename;
$outfile =~ s/.txt/erroneous_data.txt/;
open OUT, ">$outfile";
    
open (GENE, "<$filename");
while(my $finput = <GENE>)
{
        $totalCount++;
        
        chomp $finput;
        my @lineSplit = split(/\t/, $finput);
        my $tempID = $lineSplit[0];
        my $tempDate = $lineSplit[2];
        my @splitDate = split(/\//, $tempDate);
        my $finalDate = "";
        if($splitDate[2] > 90)
        {
        	if($splitDate[0] < 10)
        	{
        		if($splitDate[1] < 10)
        		{
        			$finalDate = "19".$splitDate[2]."-0".$splitDate[0]."-0".$splitDate[1];
        		}
        		else
        		{
        			$finalDate = "19".$splitDate[2]."-0".$splitDate[0]."-".$splitDate[1];
        		}
        	}
        	else
        	{
        		if($splitDate[1] < 10)
        		{
        			$finalDate = "19".$splitDate[2]."-".$splitDate[0]."-0".$splitDate[1];
        		}
        		else
        		{
        			$finalDate = "19".$splitDate[2]."-".$splitDate[0]."-".$splitDate[1];
        		}
        	}
        }
        else
        {
        	if($splitDate[0] < 10)
        	{
        		if($splitDate[1] < 10)
        		{
        			$finalDate = "20".$splitDate[2]."-0".$splitDate[0]."-0".$splitDate[1];
        		}
        		else
        		{
        			$finalDate = "20".$splitDate[2]."-0".$splitDate[0]."-".$splitDate[1];
        		}
        	}
        	else
        	{
        		if($splitDate[1] < 10)
        		{
        			$finalDate = "20".$splitDate[2]."-".$splitDate[0]."-0".$splitDate[1];
        		}
        		else
        		{
        			$finalDate = "20".$splitDate[2]."-".$splitDate[0]."-".$splitDate[1];
        		}
        	}
        }
        my $tempMeasurementID = $lineSplit[5];
        my $tempValue = $lineSplit[3];
        
        if($lineSplit[6])
        {
        	my $tempsdid = $lineSplit[6];
        	my $animalcheck = 0;  
        	
        	my $querycheck = "SELECT AnimalID FROM Pedigree where AnimalID='".$tempID."'";
        	my $isthcheck = $dbh2->prepare($querycheck);
        	$isthcheck->execute();
        	$isthcheck->bind_columns(\$animalcheck);
			while($isthcheck->fetch())
			{
				my $iquery1 = "INSERT INTO SizeMeasurements (AnimalID,Date,MeasurementID,Value,SDID) VALUES ('".$tempID."','".$finalDate."','".$tempMeasurementID."','".$tempValue."','".$tempsdid."')";
        		my $isth1 = $dbh2->prepare($iquery1);
        		$animalcheck = 1;
        		$isth1->execute();
        		$enterCount++;
			}
			if($animalcheck < 1)
				{print OUT $finput."\n";}
		}
		else
		{
			my $animalcheck = 0;  
        	
        	my $querycheck = "SELECT AnimalID FROM Pedigree where AnimalID='".$tempID."'";
        	my $isthcheck = $dbh2->prepare($querycheck);
        	$isthcheck->execute();
        	$isthcheck->bind_columns(\$animalcheck);
			while($isthcheck->fetch())
			{
				my $iquery1 = "INSERT INTO SizeMeasurements (AnimalID,Date,MeasurementID,Value) VALUES ('".$tempID."','".$finalDate."','".$tempMeasurementID."','".$tempValue."')";
        		my $isth1 = $dbh2->prepare($iquery1);
        		$animalcheck = 1;
        		$isth1->execute();
        		$enterCount++;
			}
			if($animalcheck < 1)
				{print OUT $finput."\n";}
		}
}
close OUT;
close GENE;

print $enterCount."/".$totalCount."\n";
