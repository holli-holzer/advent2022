sub MAIN( \input-file )
{
    my \monkeys = input-file.IO.split( "\n\n" ).map( &parse-monkey ).Array;
sub MAIN( \input-file )
{
    my \monkeys = input-file.IO.split( "\n\n" ).map( &parse-monkey ).Array;

    say monkeys.&monkey-business( 20, 3 );
    say monkeys.&monkey-business( 10000, 1 );
    #dd $_ for |monkeys;

}

multi parse-monkey( \monkey-str )
{
    parse-monkey |reverse monkey-str.comb: / ( <[ \+ \* ]> | \d+ | old ) /;
}

multi parse-monkey( $monkey-false, $monkey-true, $divisible-by, $operand, $operation, $x, *@items )
{

    sub op { $^a, $^b eq "old" ?? $^a !! $^b };

    Hash.new((

        :$divisible-by,
        throw-to => [ $monkey-false, $monkey-true ],
        items    => @items.reverse.skip.Array,
        inspect  => $operation eq "*"
                 ?? sub { [*] op $^a, $operand  }
                 !! sub { [+] op $^a, $operand  }
    ));
}

sub monkey-business( \monkeys, \rounds, \worry-factor )
{
    my @activity;

    my\ $f = [*] monkeys.map( *.<divisible-by> );

    for ^rounds
    {
        for |monkeys.kv -> \n, \monkey
        {
            for |monkey<items> -> \item
            {
                my \worry-level = monkey<inspect>( item ) div worry-factor;
                my \next-monkey = monkey<throw-to>[ worry-level %% monkey<divisible-by> ];

                monkeys[ next-monkey ]<items>.push: worry-level % $f;
            }

            @activity[ n ] += monkey<items>.elems;
            monkey<items> = [];
        }
    }

    #dd @activity;
    [*] @activity.sort.tail: 2;
}

    say monkeys.&monkey-business( 20, 3 );
    say monkeys.&monkey-business( 10000, 1 );
    #dd $_ for |monkeys;

}

multi parse-monkey( \monkey-str )
{
    parse-monkey |reverse monkey-str.comb: / ( <[ \+ \* ]> | \d+ | old ) /;
}

multi parse-monkey( $monkey-false, $monkey-true, $divisible-by, $operand, $operation, $x, *@items )
{

    sub op { $^a, $^b eq "old" ?? $^a !! $^b };

    Hash.new((

        :$divisible-by,
        throw-to => [ $monkey-false, $monkey-true ],
        items    => @items.reverse.skip.Array,
        inspect  => $operation eq "*"
                 ?? sub { [*] op $^a, $operand  }
                 !! sub { [+] op $^a, $operand  }
    ));
}

sub monkey-business( \monkeys, \rounds, \worry-factor )
{
    my @activity;

    my\ $f = [*] monkeys.map( *.<divisible-by> );

    for ^rounds
    {
        for |monkeys.kv -> \n, \monkey
        {
            for |monkey<items> -> \item
            {
                my \worry-level = monkey<inspect>( item ) div worry-factor;
                my \next-monkey = monkey<throw-to>[ worry-level %% monkey<divisible-by> ];

                monkeys[ next-monkey ]<items>.push: worry-level % $f;
            }

            @activity[ n ] += monkey<items>.elems;
            monkey<items> = [];
        }
    }

    #dd @activity;
    [*] @activity.sort.tail: 2;
}
