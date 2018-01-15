edge(a,b,1).
edge(a,c,3).
edge(a,d,2).
edge(c,e,1).
edge(c,g,2).
edge(g,b,2).
edge(b,f,2).
edge(f,d,1).

graph(Graph):-
    findall((X,Y,C),connected(X,Y,C),Graph).

connected(X,Y,C):-
    edge(X,Y,C);
    edge(Y,X,C).


hamiltonainPath(Graph,Path):-
    path(_,_,Graph,Path),
    covers(Path,Graph).


covers(Path,Graph):-
    \+ (adjacent(N,Graph), \+ adjacent(N,Path)).







path(Source,Target,Graph,Result):-
    path1(Source,[Source],Target,Graph,Result).


path1(Target,Visited,Target,_,Visited).


path1(Source,Visted,Target,Graph,Result):-
    member((Source,Y,C),Graph),
    \+ adjacent(Y,Visted),
    path1(Y,[(Source,Y,C)|Visted],Target,Graph,Result).

adjacent(Y,Visited):-
    member((_,Y,_),Visited);
    member((Y,_,_),Visited).
