unit sub MAIN( Str $input-file, Int $length );

sub uni( \p ) { .unique.elems == .elems with p.value }

say $length + $input-file.IO
        .comb
        .rotor( $length =>  1 - $length  )
        .pairs
        .first( &uni )
        .key;