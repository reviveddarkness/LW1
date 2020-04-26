#!/usr/bin/perl

#Simple Login Form
#by Nick Deighton
#for Doves Perl Website

#Perl Modules and Version Directives
use strict;
use warnings;
use 5.010;
use Email::Valid;
use Digest::SHA qw(sha256_hex);

login();

#Declare subroutine login
sub login {
	
	#Variable done, my modifier is good Perl practice, requires 'use strict'
	my $done = 0;  #Since no booleans exist in Perl, simply 0 will be false, anything greater than 0 is true
	
	
	#until is like a while loop, but it does something until the statement is false
	#think of it as while ($done != true) or while (!done)
	until ($done) {
		
		
		#variable declarations
		my $email = '';
		my $password = "";
		my $salt;
		my $encrypt;


		#simple print statement to start the login process
		print "\n                Website Login Form\n";
		print "--------------------------------------------------------\n\n";


		#Print to request email, store user input as the email variable;
		print "Please enter your email: \n";
		$email = <>;

		#Print to request password, store user input as the password variable;
		print "\nPlease enter your password: \n";
		$password = <>;
		
		#Chomp removes the /n (newline) character off the user inputted variables
		chomp($email);
		chomp($password);
		
		#Like in registration, we need to one way hash our data to make sure the
		#user password matches the encrypted email and password in our file
		$salt = $password . "jkdasoy79q348975";
		$encrypt = sha256_hex($salt);
		
		#saving the authentication to test as email:encryptedpassword to make it easier
		#for authentication
		my $authentication = $email . ":" . $encrypt;
		
		#Set a variable true to check if the user is done, check called and will return 1 or 0
		my $true = check($authentication);
		
		#if true, breaking the loop more "conventionally" by setting done to 1 (true)
		if($true > 0) {
			
			$done = 1;
		}
		
		#if not authenticated, that means the username and password don't match, restart the 
		#form after printing an unsuccessful message
		else {
		
			print "\n\n Username and Password are not a match\n";
			print "          ***Please Try Again***\n";
			
		}
	}
}

#subroutine check used for authentication
sub check {

	#shift the parameter to authentication, found for return value
	my $authen = shift;
	my $found = 0;
	
	#set filename to the path of our userAccount file
	my $filename = '/home/bioniks/myClasses/cs354/lw1/userAccounts.txt';

	#open the file as read, die to close if there is an error
	open(FH, '<', $filename) or die $!;

	#while loop to keep reading the file until there isn't anything left
	while(<FH>){
	
		#line variable set to read each line
   		my $line = $_;
   		
   		#splitting based on the % which seperates authentication stuff from firstname:lastname
   		my ($test, $info) = split /%/, $line; 
   		
   		#print "\n\n$line \n";
   		#print "$test \n";
   		#print "$info \n\n";
   		
   		#check the authentication by user vs the read authentication line of the test
   		if($test eq $authen) {
   			
   			#if it matches, split the first and last name used for thank you message
   			my ($first, $last) = split /:/, $info;
   			
   			#print "$first \n";
   			#print "$last \n\n";
   			
   			#call subroutine success to print first and last name and success
   			success($first, $last);
   			
   			#found set to one so routine returns a 1 to login routine
   			$found = 1;
   			
   			#last is similar to break in other languages
   			last;
   		}
	}
	
	#close the file
	close(FH);
	
	#return the $found value based on authentication
	return $found;
}


#subroutine success to print 
sub success {
	
	#shifting first and last name from parameters
	my $f = shift;
	my $l = shift;
	
	#simple print statement to start the registration process
	print "\n\nSuccessfully Logged In As: $f $l \n";
	print "                       Thank You!\n";
	print "--------------------------------------------------------\n\n";
	
}
	

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
