#!/usr/bin/perl

#Basic Fibonacci Program using loop
#by Nick Deighton
#for Doves Perl Website

#Perl Modules and Version Directives
use strict;
use warnings;

#Perl Module used to determine if a variable is an int
#since variables don't have strict datatypes, Perl Modules
#like this are extremely useful for data validaton
use Scalar::Util::Numeric qw(isint);


#Variables declared
my $count;
my $start = 0;
my $next = 1;
my $sum;

#Grab user input and store it to count
print "How far do you want to count the fibonacci sequence: \n";
$count = <>;

#Somewhat of a boolean, storing either the value 0 or 1
#$int will be 0 if $count isn't an int, otherwise 1
my $int = isint $count;

#Once again using unless, if int is 'false' this bit of
#code won't be reached
unless ($int < 1 ) {

	#verifing the max count allowed for fibonacci
	unless ($count > 0 && $count <= 50) {

		print "Count needs to be between 0 and 51\n";
	}
	
	#unless/else works similar to if/else and matches the count verification
	else {

		#When user input is taken, Perl stores the newline character in addition
		#to the user input, chomp removes that newline character
		chomp($count);
		
		#Concatenation in Perl is done with a ., this is concatenated statement variable
		my $statement = "The first " . $count . " numbers of the fibonacci sequence are: \n";
		
		print "\n\n";
		print $statement;
		print "\n";
		
		
		#For loops in Perl can also be done incrementally, instead of having the 'traditional'
		#for( x =; ; x++), for(0..$count) will continue the loop from 0 to $count incrementing
		#by 1 after each completion
		for(0..$count) {
		
			print $start;
			print ", ";
			$sum = $start + $next;
			$start = $next;
			$next = $sum;
		}
	}
}

#else connected to first unless statement
else {

	print "Count needs to be an int";
}

print "\n\n";

