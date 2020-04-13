#!/usr/bin/perl

#Basic Number Array operations
#by Nick Deighton
#for Doves Perl Website

#Perl Modules and Version Directives
use strict;
use warnings;

#Array declaration doesn't require initial elements
my @numbers = (1, 2, 3);

print "Half filled numbers array: ";
print @numbers;

#Elements of an array can be shift and unshift
#unshifting elements to an array shifts the elements right
#and puts the element at the front of the list
unshift (@numbers, 4);
unshift (@numbers, 5);
unshift (@numbers, 6);


print "\n\nNumbers array aftershifting: \n";

#Foreach loops can be used to print each element of the array
foreach(@numbers) {

	#$_ is the placeholder for the element of the array
	print "$_ \n";
}

print "\nShifting off the first two items of the array\n";

#Elements can also be shift off the end of an array like a stack
print shift (@numbers); #name2 will be popped of the array and printed
print "\n";

#Elements can just be shifted off an array as well, or stored or as a variable
my $shifted = shift (@numbers); #name1 will be shifted off the array and not printed

#Variable can be stored and used later, in this case just printed.
print "\nShifted variable: ";
print $shifted;

print "\n\n";

#Reprints the names array to show name1 and name2 missing
print "Remainder of Array: \n";
foreach(@numbers) {
	
	print "$_ \n";
	
}




