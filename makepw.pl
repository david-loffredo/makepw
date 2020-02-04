#!/usr/bin/perl
#
# Generate a series of random passwords
#
# Elements come from a wordlist.txt file.  We use the set of 10k most
# common english words 5-8 chars in length, found below:
#
# https://github.com/first20hours/google-10000-english
# google-10000-english-usa-no-swears-medium.txt
# 
# By all means, replace it with your own set of source words.  Use a
# file with at least as many words.  A four element password with the
# 10k word source has at least ten quadrillion (10^16) possibilities.
#
# This site has a collection of 58k words.
# http://www.mieliestronk.com/wordlist.html
#
# John Lawler has compiled a set of around 70k words. 
# http://www-personal.umich.edu/~jlawler/wordlist.html
#
# This is a monster 466k word file.
# https://github.com/dwyl/english-words
#
# Author: David Loffredo (dave@dave.org)

use strict;
use warnings;

use File::Basename;
use File::Spec;
use Math::Random::Secure qw(rand);
# Uses Math::Random::Secure to get a better version of rand()
# Install via cpan or libmath-random-secure-perl package.
 
# The wordfile should be in the same directory that contains the script.
my $datadir = dirname(__FILE__);
my $wordfile = File::Spec->catfile( $datadir, 'wordlist.txt');

my $pwcnt = 50;     # generate this many at once
my $minparts = 4;   # at least this many words long
my $minlen = 15;    # at least this many chars long (excluding separators)

my @seps = ( '!', '@', '#', '$', '%', '^', '&', 
	     '*', '-', '_', '+', '=', '|', '\\', 
	     ',', '.', '/', ':', ';' );
my $sep = $seps[int(rand(scalar @seps))];

    
open (SRC, "$wordfile") or do {
    print "WARNING: No file $wordfile\n";
    exit(1);
};

my @words = <SRC>;
close (SRC);

sub password {
    my @parts;
    my $len = 0;
    
    do {    
	my $w = $words[int(rand(scalar @words))];
	chomp $w;
	push @parts, $w;
	$len += length $w;
    } while ( scalar @parts < $minparts || $len < $minlen );
    return join $sep, @parts;
}

while ($pwcnt-- > 0) { print password(), "\n"; }
