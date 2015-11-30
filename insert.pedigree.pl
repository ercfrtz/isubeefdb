#!/usr/bin/perl

use warnings;
use strict;
use DBI;
 
my $db2 ="isubeefdb";
my $user = "eric";
my $pass = "R1ftw4lker";
my $host="localhost";
my $dbh2 = DBI->connect("DBI:mysql:database=$db2;host=$host;mysql_socket=/data/mysql/mysql.sock",$user,$pass);
my $filename = $ARGV[0];
    
open (GENE, "<$filename");
while(my $finput = <GENE>)
{
        chomp $finput;
        my @inputArray = split(/\n/, $finput);
        foreach my $inputLine(@inputArray)
        {
        	my @lineSplit = split(/\t/, $inputLine);
        	my $tempAID = $lineSplit[0];
        	my $tempBD = $lineSplit[1];
        	my $tempWD = $lineSplit[2];
        	my $tempLD = $lineSplit[3];
        	my $tempSD = $lineSplit[4];
        	my $tempDam = $lineSplit[5];
        	my $tempSire = $lineSplit[6];
        	my $tempSex = $lineSplit[7];
        	my $tempRegNum = $lineSplit[8];
        	my $tempBirNum = $lineSplit[9];
        	my $tempISUBPID = $lineSplit[10];
        	
        	my $finalBD = "";
        	my $finalWD = "";
        	my $finalLD = "";
        	my $finalSD = "";
        	
        	if(!($tempBD =~ /\./))
        	{
        		my @splitBD = split(/\//, $tempBD);
        		if($splitBD[2] > 90)
        		{
        			if($splitBD[0] < 10)
        			{
        				if($splitBD[1] < 10){$finalBD = "19".$splitBD[2]."-0".$splitBD[0]."-0".$splitBD[1];}
        				else{$finalBD = "19".$splitBD[2]."-0".$splitBD[0]."-".$splitBD[1];}
        			}
        			else
        			{
        				if($splitBD[1] < 10){$finalBD = "19".$splitBD[2]."-".$splitBD[0]."-0".$splitBD[1];}
        				else{$finalBD = "19".$splitBD[2]."-".$splitBD[0]."-".$splitBD[1];}
        			}
        		}
        		else
        		{
        			if($splitBD[0] < 10)
        			{
        				if($splitBD[1] < 10){$finalBD = "20".$splitBD[2]."-0".$splitBD[0]."-0".$splitBD[1];}
        				else{$finalBD = "20".$splitBD[2]."-0".$splitBD[0]."-".$splitBD[1];}
        			}
        			else
        			{
        				if($splitBD[1] < 10){$finalBD = "20".$splitBD[2]."-".$splitBD[0]."-0".$splitBD[1];}
        				else{$finalBD = "20".$splitBD[2]."-".$splitBD[0]."-".$splitBD[1];}
        			}
        		}
        	}
        	else{$finalBD = "0000-00-00";}
        	
        	if(!($tempWD =~ /\./))
        	{
        		my @splitWD = split(/\//, $tempWD);
        		if($splitWD[2] > 90)
        		{
        			if($splitWD[0] < 10)
        			{
        				if($splitWD[1] < 10){$finalWD = "19".$splitWD[2]."-0".$splitWD[0]."-0".$splitWD[1];}
        				else{$finalWD = "19".$splitWD[2]."-0".$splitWD[0]."-".$splitWD[1];}
        			}
        			else
        			{
        				if($splitWD[1] < 10){$finalWD = "19".$splitWD[2]."-".$splitWD[0]."-0".$splitWD[1];}
        				else{$finalWD = "19".$splitWD[2]."-".$splitWD[0]."-".$splitWD[1];}
        			}
        		}
        		else
        		{
        			if($splitWD[0] < 10)
        			{
        				if($splitWD[1] < 10){$finalWD = "20".$splitWD[2]."-0".$splitWD[0]."-0".$splitWD[1];}
        				else{$finalWD = "20".$splitWD[2]."-0".$splitWD[0]."-".$splitWD[1];}
        			}
        			else
        			{
        				if($splitWD[1] < 10){$finalWD = "20".$splitWD[2]."-".$splitWD[0]."-0".$splitWD[1];}
        				else{$finalWD = "20".$splitWD[2]."-".$splitWD[0]."-".$splitWD[1];}
        			}
        		}
        	}
        	else{my $finalWD = "0000-00-00";}
        	
        	if(!($tempLD =~ /\./))
        	{
        		my @splitLD = split(/\//, $tempLD);
        		if($splitLD[2] > 90)
        		{
        			if($splitLD[0] < 10)
        			{
        				if($splitLD[1] < 10){$finalLD = "19".$splitLD[2]."-0".$splitLD[0]."-0".$splitLD[1];}
        				else{$finalLD = "19".$splitLD[2]."-0".$splitLD[0]."-".$splitLD[1];}
        			}
        			else
        			{
        				if($splitLD[1] < 10){$finalLD = "19".$splitLD[2]."-".$splitLD[0]."-0".$splitLD[1];}
        				else{$finalLD = "19".$splitLD[2]."-".$splitLD[0]."-".$splitLD[1];}
        			}
        		}
        		else
        		{
        			if($splitLD[0] < 10)
        			{
        				if($splitLD[1] < 10){$finalLD = "20".$splitLD[2]."-0".$splitLD[0]."-0".$splitLD[1];}
        				else{$finalLD = "20".$splitLD[2]."-0".$splitLD[0]."-".$splitLD[1];}
        			}
        			else
        			{
        				if($splitLD[1] < 10){$finalLD = "20".$splitLD[2]."-".$splitLD[0]."-0".$splitLD[1];}
        				else{$finalLD = "20".$splitLD[2]."-".$splitLD[0]."-".$splitLD[1];}
        			}
        		}
        	}
        	else{$finalLD = "0000-00-00";}
        	
        	if(!($tempSD =~ /\./))
        	{
        		my @splitSD = split(/\//, $tempSD);
        		if($splitSD[2] > 90)
        		{
        			if($splitSD[0] < 10)
        			{
        				if($splitSD[1] < 10){$finalSD = "19".$splitSD[2]."-0".$splitSD[0]."-0".$splitSD[1];}
        				else{$finalSD = "19".$splitSD[2]."-0".$splitSD[0]."-".$splitSD[1];}
        			}
        			else
        			{
        				if($splitSD[1] < 10){$finalSD = "19".$splitSD[2]."-".$splitSD[0]."-0".$splitSD[1];}
        				else{$finalSD = "19".$splitSD[2]."-".$splitSD[0]."-".$splitSD[1];}
        			}
        		}
        		else
        		{
        			if($splitSD[0] < 10)
        			{
        				if($splitSD[1] < 10){$finalSD = "20".$splitSD[2]."-0".$splitSD[0]."-0".$splitSD[1];}
        				else{$finalSD = "20".$splitSD[2]."-0".$splitSD[0]."-".$splitSD[1];}
        			}
        			else
        			{
        				if($splitSD[1] < 10){$finalSD = "20".$splitSD[2]."-".$splitSD[0]."-0".$splitSD[1];}
        				else{$finalSD = "20".$splitSD[2]."-".$splitSD[0]."-".$splitSD[1];}
        			}
        		}
        	}
        	else{$finalSD = "0000-00-00";}
	
			if(!($tempAID eq ""))
			{
				my $iquery1 = "INSERT INTO Pedigree (AnimalID,BirthDate,WeaningDate,LeaveDate,SlaughterDate,DamID,SireID,Sex,AngusRegNum,AngusBirNum,ISUBPID,ISU) VALUES";
				$iquery1 .= " ('".$tempAID."','".$finalBD."','".$finalWD."','".$finalLD."','".$finalSD."','".$tempDam."','".$tempSire."','".$tempSex."','".$tempRegNum."','".$tempBirNum."','".$tempISUBPID."','Y')";
            	my $isth1 = $dbh2->prepare($iquery1);
            	$isth1->execute();
			}
		}
}
close GENE;
