#! /usr/bin/perl

if (!$ARGV[0] || !$ARGV[1]) {
    print "Images parameters \$9 and \$1 missing!\n";
    exit
}

my $IMAGE1 = $ARGV[0];
my $IMAGE2 = $ARGV[1];

my $COMPARE = `convert $IMAGE1 $IMAGE2 -metric RMSE -format %[distortion] -compare info:`;
my $DIFFERENCE = $COMPARE * 100;

if ($ARGV[2]) {
    print "-------------------------\n";
    print "|       IMAGE DIFF      |\n";
    print "-------------------------\n\n";
    print "IMAGE1: $IMAGE1\n";
    print "IMAGE2: $IMAGE2\n";
    print "DIFFERENCE: $DIFFERENCE%\n";

    print "Result: ";
}

# Image difference should be 2% or less to pass
if ($DIFFERENCE > 2) {
    print "FAIL\n";
} else {
    print "PASS\n";
}