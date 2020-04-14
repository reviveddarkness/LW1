#!/usr/bin/perl

#Basic Fibonacci Program using recursion
#by Nick Deighton
#for Doves Perl Website

#Perl Modules and Version Directives
use strict;
use warnings;

#Because perl has unshift functionality to push elements
#to the front of an array, an array can easily be used to
# store the fibonacci sequence and print later
my @array;


#subroutine called fibonacci, notice no parameters if declaration
sub fibonacci {

	#shift is also a keyword to grab the first parameter if its used
	#so number will store the value of that parameter
	my $number = shift;
	
	#return 0 if number is 0
	if ($number == 0 ) {
		
		return 0;
	}
		
	#return 1 if the number (count) is 1 or 2
	if ($number == 1 || $number == 2) {
	
		return 1;
	}
	
	#counting backwards to get the previous two numbers to add
	my $back = $number - 1;
	my $backAgain = $number - 2;
	
	#return after recursively calling fibonacci twice, to get the
	#previous two numbers to add together
	return (fibonacci($back) + fibonacci($backAgain));
}

#subroutine called printFibo to print the fibonacci sequence
sub printFibo {

	#again shifting the parameter to the length printed.
	my $length = shift;
	
	
	my $statement = "The first " . $length . " numbers of the fibonacci series are: \n\n";
	
	print $statement; 
	print "\n";
	
	#simply printing by calling fibonacci from 0 to the length will work, similar to
	#our previous example
	for (my $x = 0; $x <= $length; $x++) {
	
		print fibonacci($x);
		print ", ";
	}
	
	#But an array can also be used counting in reverse from the length, meaning 
	#the largest number will be returned and added first to the array, after that
	#each number will be the previous number in the sequence so it will be pushed
	#to the front of the array with unshift
	for ($length; $length > -1; $length--) {
	
		unshift (@array, fibonacci($length));
	} 
}


print "\n";

printFibo(20);

print "\n\n";

print "If an array and unshift function used fibonacci sequence should match: \n\n";

#printing the array using the unshift functionality
foreach(@array) {

	print "$_";
	print ", ";
}

print "\n";














	
