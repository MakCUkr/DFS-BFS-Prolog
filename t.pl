solve(From,To,Cost,Path) :- 
    best_first(From,To, [From], Path, 0).

% if reached Goal
best_first(Goal, Goal, C, [Goal], Cost) :- 
    nl,write('Cost for the following path is : '),write(Cost), nl,nl, reverse(C, C1), print_list(C1),nl.

best_first(Start, Goal, Visited, [Start|Path], Cst) :- 
    next_node1(Start, Next_node, Goal, Visited, Cost), 
    MCst is Cst+Cost,
    best_first(Next_node, Goal, [Next_node|Visited], Path, MCst).

next_node1(Current, Next, Goal, Path, Cost) :- 
    hueristic_min(Current, Next, Goal, _), 
    distance2(Current, Next, Cost), 
    not(member(Next, Path)).

hueristic_min(Current, Next, Goal, Cost) :- 
    aggregate(
        min(Cost, Next), 
        hueristic(Current,Next,Goal,Cost), 
        min(_, Next)
    ).


% -------------------------------------
start(Distance,Route):-
    bestfirstsearch(agartala,hubli,Distance,Route),
    write("start_Distance:"), write(Distance),nl,
    write("start_Route:"), write(Route).


bestfirstsearch(Start,Goal,Dist,[Start,Goal]):-
    dist(Start,Goal,Dist).

bestfirstsearch(Start,Goal,Dist,Route):-
    heur(Start,Goal,Heuristic),  
    write("bestfirstsearch_Heuristic:"), write(Heuristic), nl,
    min_path(Heuristic,(_:_),Dist,Route).

min_path([(A:_)|T],(X:Y),X,Y):-
    min_path(T,(X:Y),X,Y),A >= X.

min_path([(A:B)|T],(A:B),A,B):-
    min_path(T,(X:Y),X,Y), A < X.
    s
min_path([(A:B)],(A:B),A,B).    


