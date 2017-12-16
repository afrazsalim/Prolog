%addTotree(1,null,X) , addTotree(2,X,Y) ,addTotree(3,Y,Z).


%
% main:-
%     write('Inserting 1 into the tree'),
%     X1 = addTotree(1,null,X),
%     nl,
%     write('Inserting 2 into the tree'),
%     nl,
%     format(X1),
%     Y1 = addTotree(2,X,Y).
%



addTotree(X,null,tree(null,X,null)).

addTotree(X,tree(L,X,R),tree(L,X,R)).

addTotree(X,tree(L,V,R),tree(L1,V,R)) :-
    greater(V,X),
    addTotree(X,L,L1).

addTotree(X,tree(L,V,R),tree(L,V,R1)):-

    greater(X,V),
    addTotree(X,R,R1).

greater(X,V):-
    X > V.



deleteFromTree(X,tree(L,X,null) ,L).

deleteFromTree(X,tree(null,X,R),R).

deleteFromTree(X,tree(L,X,R),tree(L,Y,R1)):-
    delmin(R,Y,R1).

deleteFromTree(X,tree(L,V,R),tree(L,V,R1)):-
    greater(X,V),
    deleteFromTree(X,R,R1).

deleteFromTree(X,tree(L,V,R),tree(L1,V,R)):-
    greater(V,X),
    deleteFromTree(X,L,L1).

delmin(tree(null,V,R),V,R).

delmin(tree(L,V,R),Y,tree(L1,V,R)):-
    delmin(L,Y,L1).




count(tree(null,_,null),1).
count(tree(null_,_),1).
count(tree(_,_,null),1).

count(tree(L,_,Right),R):-
    count(L,R1),
    count(Right,R2),
    R is R1 + R2 + 1.




showTree(T):-
    showT(T,0).

showT(null,_).

showT(tree(L,V,R),Ident):-
    NewIdent is Ident + 2,
    showT(L,NewIdent),
    tab(Ident),
    write(V),
    nl,
    showT(R,NewIdent).




%Graph representation in prolog
connected(a,b,5).
connected(b,a,5).
connected(a,c,5).
connected(c,a,5).
connected(e,a,5).
connected(a,e,5).
connected(a,d,5).
connected(d,a,5).
connected(b,c,8).
connected(c,b,2).
connected(d,c,8).
connected(c,d,2).
connected(d,b,8).
connected(b,d,2).



%connected(e,d,4).
%connected(c,f,1).


%G  = graph( [a,b,c,d], [e(a,b), e(b,d), e(b,c), e(c,d)]
%For this structure we use
path(A,Z,R):-
    findPath(A,Z,R,[A]).

findPath(A,Z,P,L):-
    connected(A,Z,_),
    \+ member(Z,L),
    reverse([Z|L],P).

findPath(A,Z,P,Acc):-
    connected(A,X,_),
    \+ member(X,Acc),
    findPath(X,Z,P,[X|Acc]).


%Shrtest hamiltanion path
findShortestPath(R):-
    findall(R1,hamilPath(R1),List),
    constructCosts(List,Res),
    getShortestCostPath(Res,R).


getShortestCostPath([(C,H)|T],R):-
    shortestPath((C,H),T,Acc,R).

shortestPath(_,[],A,A).

shortestPath((C,H),[(C2,H2)|T],Acc,R):-
     (
     C > C2 ->
       NewAcc = (C2,H2)
     ;
        NewAcc = (C,H)
    ),
    shortestPath(NewAcc,T,NewAcc,R).



constructCosts([],[]).
constructCosts([H|T],[(C,H)|T1]):-
    findCost(H,C),
    constructCosts(T,T1).


findCost([H,H2|T],C):-
    find(H,H2,T,R),
    sumUp(R,0,C).

sumUp([],A,A).
sumUp([H|T],Acc,C):-
    NewAcc is Acc + H,
    sumUp(T,NewAcc,C).

find(_,_,[],[]).
find(H,H2,[H3|T],[C1|T1]):-
    connected(H,H2,C1),
    find(H2,H3,T,T1).


%Finding the hamiltonian findPath

hamilPath(R):-
    findall((X,Y),connected(X,Y,_),List),
    flatList(List,Res),
    sort(Res,Res2),
    findPathAll(Res2,R).

%
 covers(Res2,R):-
     length(R,X),
     length(Res2,Y),
     X == Y.

findPathAll(Res2,R):-
    path(_,_,R),
    covers(Res2,R).





flatList([],[]).
flatList([(X,Y)|T] ,[X,Y|P]):-
    flatList(T,P).











% %Find minimum spanning tree
% findMinTree(R):-
%     findall((A-B),connected(A,B,_),List),
%     member((X-Y),List),
%     spread(List,[(X-Y)],R).
%
%
% spread(L,Tree,Tree):-
%     \+ addEdge(L,Tree,Tree).
%
% spread(List,Tree,R):-
%     addEdge(List,Tree,Tree2),
%     spread(List,Tree2,R).
%
%
% addEdge(List,Tree,[(X-Y)|T]):-
%     adjacent((X-Y),List),
%     node(X,Tree),
%     \+ node(Y,Tree).
%
%
% adjacent((X-Y),List):-
%     member((X-Y),List);
%     member((Y-X),List).
%
% node(A,G):-
%     adjacent((A-_),G).
