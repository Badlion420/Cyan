#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket;

my $host = shift or die "Usage: $0 <host>\n";

for my $port (1..65535) {
    my $socket = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto    => 'tcp',
        Timeout  => 1,
    );
    if ($socket) {
        print "Port $port is open\n";
        close($socket);
    }
}
