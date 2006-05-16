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
my @expected = qw (10 3 3 2 3 3 4 1 2 6 3 8 1 1 12 3 6 4);

# given row and column marginals
my @rmar = (13,11,13,13,12,13);
my @cmar = (23,32,10,10);

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
		}
	}	

is_deeply(\@tmp, \@expected, "Verified generated array - OK.");

__END__
