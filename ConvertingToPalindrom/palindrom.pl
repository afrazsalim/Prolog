


finAll(List,Result):-
    setof(R,palindrom(List,R),L),
    flatten(L,Result).

palindrom(List,Result):-
    convert(List,[],[],0,Result).


convert(List,_,_,_,[]):-
    pal(List).

convert(List,Replacers,Replaced,C,[R|Result]):-
    member(X,List),
    \+ member(X,Replacers),
    member(Y,List),
    Y \= X,
    \+ member(Y,Replaced),
    replace(X,Y,List,C,[],R),
    R = Cost-L,
    NewCost is C+Cost,
    convert(L,[X|Replacers],[Y|Replaced],NewCost,Result).

replace(_,_,[],C,R,C-R).

replace(X,Y,[Y|T],C,Acc,Rs):-
    NewCost is C + 1,
    NewTail = [X|Acc],
    replace(X,Y,T,NewCost,NewTail,Rs).

replace(X,Y,[H|T],C,Acc,Rs):-
    Y \= H,
    NewTail = [H|Acc],
    replace(X,Y,T,C,NewTail,Rs).

replace(X,Y,[X|T],C,Acc,Rs):-
    NewTail = [X|Acc],
    replace(X,Y,T,C,NewTail,Rs).

pal([]).
pal([_]).
pal(Pal) :-
    append([H|T], [H], Pal),
    pal(T).
