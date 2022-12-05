unit sub MAIN( Str $input-file, Int :$crate-mover-model where 9000|9001 );

my ( $stacks, $moves ) = $input-file.IO.split( "\n\n" );

my @stacks = [Z] $stacks.lines[ 0 .. * - 2 ].map: *.comb[ 1, 5 ... * ];
   @stacks = @stacks.map: *.grep( * ne ' ' ).Array;

my @moves  = $moves.lines.map: *.comb( /\d+/ )>>.Int;

for @moves -> ( $amount, $from, $to ) 
{
    my @crates  = @stacks[ $from - 1 ].splice: 0, $amount;
    
    @crates .= reverse 
        if $crate-mover-model eq '9000';
   
   @stacks[ $to - 1 ].unshift: |@crates;
};

dd @stacks.map( *.head ).join( '' );
