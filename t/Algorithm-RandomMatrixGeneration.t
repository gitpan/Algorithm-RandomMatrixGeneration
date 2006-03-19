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

BEGIN { use_ok('Algorithm::RandomMatrixGeneration') };

# expected matrix 
my @expected = qw (10.18206 2.43378 0.11974 0.26442 2.93730 4.36886 1.60203 2.09181 1.76251 2.62698 4.64942 3.96109 4.94094 1.92863 2.46260 3.66783 2.96313 8.64955 0.37342 0.01390 0.21406 11.99220 0.79279 0.00095 );

# given row and column marginals
my @rmar = (13,11,13,13,12,13);
my @cmar = (23,32,10,10);

my $n = $#rmar;
my $m = $#cmar;

my @result = generateMatrix(\@rmar, \@cmar, 5, 3);

my @tmp = ();
	for(my $i=0; $i<=$n; $i++)
	{
		for(my $j=0; $j<=$m; $j++)
		{
			push @tmp, $result[$i][$j];
		}
	}	

is_deeply(\@tmp, \@expected, "Verified generated array - OK.");

__END__
