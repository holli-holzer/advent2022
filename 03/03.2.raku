sub priority( Str \c )
{
    .item > 96 ?? .item - 96 !! .item - 38
        given c.ord;
}

dd "03.input.txt".IO
    .lines
    .batch(3)
    .map({ [∩] |.item».comb })
    .map({ |.keys })
    .map({ .&priority  })
    .sum;

