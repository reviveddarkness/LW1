#!/usr/bin/perl

#Basic String Array operations
#by Nick Deighton
#for Doves Perl Website

#Perl Modules and Version Directives
use strict;
use warnings;

#Array declaration doesn't require initial elements
my @names;

print "Empty Names Array: ";
print @names;

#Elements of an array can be pushed and popped
#pushing puts the element at the end of the list
push (@names, "Nick");
push (@names, "Deighton");
push (@names, "name1");
push (@names, "name2");


#printing the array like this, will result in the
#array printing on one line without spaces between elements

print "\n\nNames array after elements are pushed: ";
print @names;


print "\n\nNames array printed using foreach: \n";

#Foreach loops can be used to print each element of the array
foreach(@names) {

	#$_ is the placeholder for the element of the array
	print "$_ \n";
}

print "\nPopping off the last two items of the array\n";

#Elements can also be popped off the end of an array like a stack
print pop (@names); #name2 will be popped of the array and printed
print "\n";

#Elements can just be popped off an array as well, or stored or as a variable
my $popped = pop (@names); #name1 will be popped of the array and not printed

#Variable can be stored and used later, in this case just printed.
print "\nPopped variable: ";
print $popped;

print "\n\n";

#An interesting trick with arrays, is to get the size of an array
#you can simply set a variable equal to the array
my $size = @names;
print "Size of the array: ";
print $size;


#Reprints the names array to show name1 and name2 missing
print "\n\nRemainder of Array: \n";
foreach(@names) {
	
	print "$_ \n";
	
}
print "\n";



