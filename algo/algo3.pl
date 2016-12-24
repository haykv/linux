#!/usr/bin/perl
sub PD {
    my ($arr) = @_;
    my $n=scalar @$arr;
    my @b;
    my @a=@$arr;
    $b[0]=@$arr[0];

    for ( my $i=1; $i < $n; $i++ ) {
        $b[$i] = $b[$i-1] < 1 ? $a[$i] : $a[$i] * $b[$i-1];
    }

    my $max=0;
    foreach (@b) {
        if ($_>$max) {
            $max=$_; 
        }
    }

    return $max;
    
}

sub P {

    my ($arr) = @_;
    my $n=scalar @$arr;
    my $max=0;
    my $maxstr="";
    for ( my $i=0; $i < $n; $i++ ) {
        my $temp=1;
        my $str="";
        for ( my $j=$i; $j < $n ; $j++ ) {
            if ($j==$i) {
                $str = "A[$j]"
            } else {
                $str = "${str}*A[$j]";
            }
            $temp = $temp * @$arr[$j];
            print $str . "\n";
            if ( $temp > $max ) {
                $maxstr = $str;
                $max = $temp;
            }
        }
        print "MAX : $max : $maxstr\n";
        print "$str\n";
    } 
    return $max;
}

my @A = map { rand(2) } ( 1..10 );
my $result = P(\@A);
my $resultd = PD(\@A);
my $i=0;
print "\n";
foreach my $val (@A) {
    $i+=1;
    printf("A[%d] [%.2f]\n",$i,$val);
}
print "\nn^2 : $result\n";
print "DYNAMIC: $resultd\n";
