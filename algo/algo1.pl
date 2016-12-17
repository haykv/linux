#!/usr/bin/perl
# Algorithm divide&conquer for finding min/max

sub P {

    my ($arr, $i, $j) = @_;
    my %y;

    if ($i == $j) {
        $y{min}=@$arr[$i-1];
        $y{max}=@$arr[$i-1];
        return \%y;
    }

    my $mid = int( ($i+$j)/2 );

    my $L=P($arr,$i,$mid);
    my $R=P($arr,$mid+1,$j);
    
    if (%$L{max}>%$R{max}) {
        $y{max}=%$L{max};
    } else {
        $y{max}=%$R{max};
    }
    
    if (%$L{min}<%$R{min}) {
        $y{min}=%$L{min};
    } else {
        $y{min}=%$R{min};
    }
    
    return \%y;

}

my @A = map { rand(100) } ( 1..10 );
my $result = P(\@A,1,10);
foreach my $val (sort { $b <=> $a } @A) {
    printf("%.2f ",$val);
}
print "\n";
my $max=%$result{max};
my $min=%$result{min};
printf("MAX : %.2f\n", $max);
printf("MIN : %.2f\n", $min);
