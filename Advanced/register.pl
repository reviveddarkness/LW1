#!/usr/bin/perl

#Simple Registration Form
#by Nick Deighton
#for Doves Perl Website

#Perl Modules and Version Directives
use strict;
use warnings;
use 5.010;
use Email::Valid;
use Digest::SHA qw(sha256_hex);


#Call subroutine register with no parameters
register();


#Declare subroutine register
sub register {
	
	#Variable done, my modifier is good Perl practice, requires 'use strict'
	my $done = 0;  #Since no booleans exist in Perl, simply 0 will be false, anything greater than 0 is true
	
	
	#until is like a while loop, but it does something until the statement is false
	#think of it as while ($done != true) or while (!done)
	until ($done) {
		
		
		#variable declarations
		my $first_name = "";
		my $last_name = "";
		my $email = '';
		my $password = "";
		my $repassword = "";
		my $error_count = 0;
		my $salt;
		my $encrypt;


		#simple print statement to start the registration process
		print "\n           Website Registration Form\n";
		print "--------------------------------------------------------\n\n";


		#Print to request first name, store user input as the first_name variable;
		print "Please enter your first name: \n";
		$first_name = <>;

		#Print to request last name, store user input as the last_name variable;
		print "\nPlease enter your last name: \n";
		$last_name = <>;


		#Print to request email address, store user input as the email variable;
		print "\nPlease enter your email: \n";
		$email = <>;

		#Print to request password, store user input as the password variable;
		print "\nPlease enter your desired password: \n";
		$password = <>;


		#Print to request second password, store user input as the repassword variable;
		print "\nPlease repeat your desired password: \n";
		$repassword = <>;
		
		chomp($first_name);
		chomp($last_name);
		chomp($email);
		chomp($password);
		chomp($repassword);

		#Print to split errors
		print "\n                      Errors \n";
		print "--------------------------------------------------------\n";

		#unless is similar to an if, except it will evaluate if the statement is false
		#unless statement to check if first name matches our Regex, alpha characters and ,.'- are allowed
		unless ( $first_name =~ /^[a-z ,.'-]+$/i) {

			print "First name must only contain alpha characters or , . ' -\n"; #if it doesn't match our regex then prints an error
			$error_count++; 													#and increments the error count
		}

		#unless statement to check if last name matches same Regex
		unless ( $last_name =~ /^[a-z ,.'-]+$/i) {

			print "Last name must only contain alpha characters or , . ' -\n";
			$error_count++;
		}

		
		#unless statement that uses Email::Valid Perl Module
		#This module is built into perl and just simply needs to be installed, once it is installed
		#it can be used to verify email address to ensure they are valid, much simpler than creating a regex
		unless ( Email::Valid->address($email) ) {
	
			print "Email must be a valid email address according to Perl's standards\n";
			$error_count++;
		
		}

		#unless statement to match our password
		#password must contain 8 characters, and at least one upper, one lower, and one number character
		unless ( $password =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/) {

			print "Password must be at least 8 characters and contain at least \none uppercase, one lowercase, and one number";
			$error_count++;
	
		}

		#unless statement to check the passwords match, notice == is not used
		#for comparison of strings, different comparison operators are used than
		#that of numbers, eq is the keyword for equal
		unless ( $password eq $repassword ) {

			print "Passwords must match\n";
			$error_count++;
	
		}
		
		#check if the error count has been incremented using an if
		if ( $error_count < 1 ) {
			
			#technique of "salting" a password or adding additional characters to make one way hashing more secure
			$salt = $password . "jkdasoy79q348975";
			#print $salt;
			#print "\n";
			
			#encrypt variable stored as a one way has with Perls built in sha256 hex encryption.
			$encrypt = sha256_hex($salt);
			#print $encrypt; 
			#print "\n";
			
			#send parameters to be inserted into our userAccounts file
			insert($email, $encrypt, $first_name, $last_name);
		
			complete();  #if no errors present, call the subroutine complete with no parameters
			$done = 1;   #set variable $done to 1, making the statement true and breaking the until loop
		}
		
		else {
			
			#print statement if there is errors to let user know to refill out the form
			print "\n--------------------------------------------------------\n";
			print "\n    ***Please refill out the registration form***\n";
			$done = 0; #doesn't break the until loop, so registration form starts over again
		 }
	}
	
}

#subroutine insert to insert the data into the userAccounts "database"
sub insert {

	#instead of shifting, multiple parameters can be pulled off using this method.
	my ($email, $encrypt, $first_name, $last_name) = (@_);

	#setting my string concat for the useraccount in the table
	#First seperating email:encryptedpassword with : to allow for splitting using delimeter later
	#Second seperating "authentication" info vs personally info with % that will be used as a delimeter for login
	my $useraccount = $email . ":" . $encrypt . "%" . $first_name .
					  ":" . $last_name . "\n"; 

	#filename to write to
	my $filename = '/home/bioniks/myClasses/cs354/lw1/userAccounts.txt';
	
	#>> to append the file instead of overwrite, die if there is an error
	open(FH, '>>', $filename) or die $!;
	
	#read all current lines and reprint them to the file
	while(<FH>) {
	 
    	print $_; 
    } 
    
    #print the useraccount to the file
	print FH $useraccount;

	#close the file
	close(FH);

	#print to let us know that file has been written successfully
	print "            Writing to file successful!\n";
}


#Declaration of subroutine complete
sub complete {

	#simply prints that no errors were found, just used to show calling subroutines in another is possible
	print "        No errors found, registration complete\n";
	print "--------------------------------------------------------\n";
	
}
	


