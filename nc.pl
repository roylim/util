#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

# Server details
my $host = '192.10.10.70';  # Replace with the server IP
my $port = 54321;         # Replace with the server port

# Create a new TCP socket
my $client = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto    => 'tcp'
) or die "Could not connect to server: $!\n";

print "Connected to server at $host:$port...\n";

# Read from STDIN and send to server in chunks (use tar cvf - for binary data)
my $buffer;
while (read(STDIN, $buffer, 1024)) {   # Read 1024 bytes at a time
    print $client $buffer;             # Send the data to the server
}

# Close the client socket after sending all data
close $client;

print "Data sent to server successfully.\n";
