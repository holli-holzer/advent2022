sub halves( Str \s ) {
    s.substr( 0, $_ ), s.substr( $_ )
        given s.chars div 2;
}

sub priority( Str \c )
{
    .item > 96 ?? .item - 96 !! .item - 38
        given c.ord;
}

dd "03.input.txt".IO
    .lines
    .map({ [∩] |.&halves».comb })
    .map({ |.keys })
    .map({ .&priority  })
    .sum;

