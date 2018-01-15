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


bFirstSearch(Source,Goal,Graph,Result):-
    findall([(Source,Y,C)],connected(Source,Y,C),List),
    bSearch(List,Goal,Graph,Result).

bSearch([[(X,Target,C)|Path]|_],Target,_,[(X,Target,C)|Path]).

bSearch([[(X,Y,C)|Path]|Paths],Goal,Graph,Result):-
    findall([(Y,Z,C2),(X,Y,C)|Path],(member((Y,Z,C2),Graph),\+ adjacent(Z,[(X,Y,C)|Path])),List),
    conc(List,Paths,NewPaths),!,
    bSearch(NewPaths,Goal,Graph,Result);
    bSearch(Paths,Goal,Graph,Result).

adjacent(X,List):-
    member((X,_,_),List);
    member((_,X,_),List).


conc(List,[],List).
conc(List,[H|T],[H|R]):-
    conc(List,T,R).
