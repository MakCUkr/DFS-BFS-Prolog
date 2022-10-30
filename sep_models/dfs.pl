member(X,[X|_]).
member(X,[_|Tail]):-member(X,Tail).

print_ls([]).
print_ls([A|B]) :-
  write(A),
  write(","),
  print_ls(B).


solve_dfs(Start,Target):-
    dfs(Start,[Start],0,Target).


dfs(Node,Searched,Len,Target):-
    nl, write("1."),nl, 
    Node == Target,
    nl,nl,nl,
    write("Final cost: "),
    write(Len),nl,
    write("Path: "),
    print_ls(Searched).

dfs(Node,Searched,Len,Target):-
    write("2.Visiting "), write(Node), nl,
    dist(Node,Neighbor,Len2), 
    not(member(Neighbor,Searched)),
    write(Neighbor), write(" is at a distance of "), 
    write(Len2),
    write(" and is not a member of "), 
    write(Searched),
    NewLen is Len+Len2,
    dfs(Neighbor,[Neighbor|Searched],NewLen,Target).

dfs(Node,Searched,Len,Target):-
    write("3."), write(Node), nl,
    member(Node,Searched),
    write("Backtracking..."),nl,
    %write("Reached roadbloc because "),write(Node),
    %write(" is part of Searched: "), write(Searched),
    1==2.

dist(delhi, mumbai, 2000).
dist(mumbai, delhi, 2000).
dist(delhi, kota, 1000).
dist(kota, delhi, 1000).
dist(delhi, agartala, 3000).
dist(agartala, delhi,  3000).
dist(delhi, hubli, 5000).
dist(hubli, delhi,5000).
dist(agartala, kota, 6000).