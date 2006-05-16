# test1.t version 0.01
# (Updated 03/18/2006 -- Anagha)
#
# A script to run test on the Algorithm::RandomMatrixGeneration module.
# This test cases check if same seed for the random number generated is used 
# then is the generated matrix same as that expected.
# The following are among the tests run by this script:
# 1. Try loading the Algorithm::RandomMatrixGeneration i.e. is it added to the @INC variable
# 2. Compare the answer returned by the Algorithm::RandomMatrixGeneration with the actual andwer

use strict;
use warnings;

use Test::More tests => 2;

BEGIN { use_ok('Algorithm::RandomMatrixGenerationNegative') };

# expected matrix 
my @expected = ('-1','3','-5','-2','5','0','0','0','-2','0','3','-4');

# given row and column marginals
my @rmar = ('-5','5','-3');
my @cmar = ('2','3','-2','-6');

my $n = $#rmar;
my $m = $#cmar;

my @result = generateMatrix(\@rmar, \@cmar, 4, 3);

my @tmp = ();
	for(my $i=0; $i<=$n; $i++)
	{
		for(my $j=0; $j<=$m; $j++)
		{
			if(defined $result[$i][$j])
			{
				push @tmp, $result[$i][$j];
			}
			else
			{
				push @tmp, 0;
			}
		}
	}	

is_deeply(\@tmp, \@expected, "Verified generated array - OK.");

__END__
