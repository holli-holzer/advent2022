subset Rock     of Str where * eq "A";
subset Paper    of Str where * eq "B";
subset Scissors of Str where * eq "C";

subset Loss     of Str where * eq "X";    
subset Draw     of Str where * eq "Y";    
subset Win      of Str where * eq "Z";    

multi choose( Rock,     Loss ) { "C" }
multi choose( Rock,     Draw ) { "A" }
multi choose( Rock,     Win )  { "B" }
multi choose( Paper,    Loss ) { "A" }  
multi choose( Paper,    Draw ) { "B" }     
multi choose( Paper,    Win )  { "C" }
multi choose( Scissors, Loss ) { "B" }     
multi choose( Scissors, Draw ) { "C" }     
multi choose( Scissors, Win )  { "A" }

multi score( Rock,     Rock )     { 1 + 3 }
multi score( Rock,     Paper )    { 2 + 6 }
multi score( Rock,     Scissors ) { 3 + 0 }  
multi score( Paper,    Rock )     { 1 + 0 }
multi score( Paper,    Paper )    { 2 + 3 }
multi score( Paper,    Scissors ) { 3 + 6 } 
multi score( Scissors, Rock )     { 1 + 6 } 
multi score( Scissors, Paper )    { 2 + 0 }
multi score( Scissors, Scissors ) { 3 + 3 }

say sum "input.txt".IO.lines(:chomp)>>.words.map( -> ($choice, $outcome) {
    score( $choice, choose( $choice, $outcome ) ) ;
})
