

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

minimumSpanningTree(Graph,Tree):-
    member(Edge,Graph),
    expandTree([Edge],Graph,Tree).


expandTree(Tree,Graph,Tree):-
    \+ addEdge(Tree,Graph,_).


expandTree(Tree1,Graph,Tree):-
    addEdge(Tree1,Graph,Tree2),
    expandTree(Tree2,Graph,Tree).




addEdge(Tree1,Graph,[(X,Y,C)|Tree1]):-
    adjacent((X,Y,C),Graph),
    node(X,Tree1),
    \+ node(Y,Tree1).

node(X,Tree):-
     adjacent((X,_,_),Tree).

adjacent((X,Y,C),Graph):-
    member((X,Y,C),Graph);
    member((Y,X,C),Graph).
