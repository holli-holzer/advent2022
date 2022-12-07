unit sub MAIN( Str $input-file );

multi parse( $file )
{
    my @path;
    my %result;

    parse $file.IO.lines( :chomp ).list.iterator, @path, %result;

    %result;
}

multi parse( Iterator \data, \path, \result )
{
    loop
    {
        given data.pull-one
        {
            last if IterationEnd =:= .item;

            when /^ \$ \s cd \s \. \./
            {
                path.pop;
                last;
            }

            when /^ \$ \s cd \s (.+) /
            {
                path.push: $/[0];
                parse data, path, result;
            }

            when /^ (\d+) \s (.+) /
            {
                result{ .join: "/" } += $/[0]
                    for [\,] |path;
            }
        }
    }
}

given parse( $input-file )
{
    say "Part 1: ", .values.grep( * < 100000 ).sum;
    say "Part 2: ", .values.grep( * > .item{"/"} - 40000000 ).sort.head;
}