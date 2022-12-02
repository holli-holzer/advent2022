subset Rock of Str where * eq "A"|"X";
subset Paper of Str where * eq "B"|"Y";   
subset Scissors of Str where * eq "C"|"Z";

multi score( Rock, Rock ) { 1 + 3 }
multi score( Rock, Paper ) { 2 + 6  }
multi score( Rock, Scissors ) { 3 + 0 }  
multi score( Paper, Rock ) { 1 + 0 }
multi score( Paper, Paper ) { 2 + 3 }
multi score( Paper, Scissors ) { 3 + 6 } 
multi score( Scissors, Rock ) { 1 + 6  } 
multi score( Scissors, Paper ) { 2 + 0 }
multi score( Scissors, Scissors ) { 3 + 3 }

say sum map { score( |.words ) },  "input.txt".IO.lines(:chomp);
