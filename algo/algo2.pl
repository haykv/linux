#!/usr/bin/perl
# Algorithm divide&conquer for finding odd/even

sub P {

    my ($arr, $i, $j) = @_;

    if ($i == $j) {
        return @$arr[$i-1]%2==0;
    }

    my $mid = int( ($i+$j)/2 );

    my $L=P($arr,$i,$mid);
    my $R=P($arr,$mid+1,$j);
    
    return ($L && $R) || (!$L && !$R);

}

my @A = map { int(rand(100)) } ( 1..10 );
my $result = P(\@A,1,10);
foreach my $val (sort { $b <=> $a } @A) {
    printf("%d ",$val);
}
my $oddeven=$result?"even":"odd";
print "\nRESULT: $oddeven\n";
