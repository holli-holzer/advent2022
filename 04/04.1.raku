sub parse( \s ) {
    cache s.split( ',' ).map: { Range.new: |.split( '-' )>>.Int }
}

say "input.txt"
    .IO
    .lines
    .map({ .&parse })
    .grep({ ( [⊇] .list ) || [⊆] .list  })
    .elems;
