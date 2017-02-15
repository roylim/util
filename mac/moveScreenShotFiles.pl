#!/usr/bin/perl
use strict;
use POSIX 'strftime';
use Time::Local;

my @l = `ls ~/Desktop/*.png`; chomp @l;

my $descPos = "~/Desktop/screenshot";
system "mkdir -p $descPos";

my $now = datetime();
for(@l) {
	if($_ =~ /\d\d\d\d\-\d\d-\d\d/) {
		print "[$now] mv '$_' ~/Desktop/screenshot/\n";
		system "mv '$_' $descPos";
	}
}

###############################################
# Function
###############################################
sub datetime { return strftime("%Y/%m/%d %H:%M:%S", localtime); }
