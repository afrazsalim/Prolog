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



depthFirstSearch(Source,Goal,Graph,Result):-
    search(Source,Goal,Graph,[Source],Result).

search(Target,Target,_,Visited,Result):-
    reverse(Visited,Result).

search(Source,Goal,Graph,Visited,Result):-
    member((Source,Y,C),Graph),
    \+ adjacent(Y,Visited),
    search(Y,Goal,Graph,[(Source,Y,C)|Visited],Result).

adjacent(Y,Visited):-
    member((Y,_,_),Visited).
