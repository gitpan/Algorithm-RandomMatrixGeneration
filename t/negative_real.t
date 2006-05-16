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
my @expected = qw (17.8807 -6.4654 -7.1779 -6.1327 7.9772 -6.8657 0.4586 -1.7588 -4.8333 1.6416 3.3625 -3.5801 7.4508 -3.4979 -2.1094 -0.5182 -7.4656 1.7672 15.1828 -8.6167 -2.5644 0.1420 6.5175 -7.0468 6.9403 -8.3196 -0.9516 4.1642 -5.2713 0.6709 0.1233 0.5598 -4.6580 7.1435 -5.4999 4.5446 -3.0922 0.8341 -1.2176 -0.1385 -1.3713 -0.7630 -0.1315 0.9302 -0.3167 -0.6942 0.3674 -0.1049 1.4811 -3.3718 0.5768 -0.7135 0.2049 -0.3271 0.1741 -0.1085 -1.0198 -0.3725 -0.2166 -0.3377 0.2304 -0.0908 0.0450 -0.3220 -1.6349 -0.5932 -0.3229 0.0313 0.3506 0.0220 0.3243 -0.2612 -0.6692 -0.5268 -0.1717 -0.1496 -0.3193 -0.0533 -0.0332 -0.1609);

# given row and column marginals
my @rmar = qw (-2.0840  -2.0840  -2.0840  -2.0840  -2.0840  -2.0840  -2.0840  -2.0840  -2.0840  -2.0840);
my @cmar = qw (4.6500  -9.8600  4.6500  -9.8600  4.6500  -9.8600  4.6500  -9.8600);

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
