sub parse( \s ) {
    s.split( ',' ).map: { Range.new: |.split( '-' )>>.Int }
}

say "input.txt"
    .IO
    .lines
    .grep({ +( [∩] .&parse ) })
    .elems;