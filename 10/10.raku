sub infix:<+->( $a, $b ) { any $a - $b .. $a + $b }
sub infix:<±>(  $a, $b ) { any $a - $b .. $a + $b } # Yes, that works too

my $register := 1;

multi execute( "addx", \value ) { $register, $register := $register + value }
multi execute( "noop"         ) { $register }

sub draw( \r ) {
    r.value +- 1 == r.key % 40 ?? "#" !! " ";
}

sub MAIN( Str \input-file )
{
    #Part 1
    my @register = 1, |input-file.IO.lines.map: { |execute |.words };
    say sum [ 20, 60, 100, 140, 180, 220 ].map: { .item * @register[ .item - 1 ] };

    #Part 2
    .join( "" ).say
        for @register.pairs.map( &draw ).batch: 40;
}