#!/usr/bin/perl
##################################################
# How to set
#*/3 * * * * perl /Users/naver/mygit/util/mac/moveScreenShotFiles.pl >> /Users/naver/mygit/util/mac/moveScreenShotFiles.log 2>&1
##################################################

use strict;
use POSIX 'strftime';
use Time::Local;

my @l = `ls ~/Desktop/*.png 2>/dev/null`; chomp @l;

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
