solve(N):-
    NewValue is N*N-1,
    solve(N,NewValue,[1/1],[X/Y|T]),
    write([X/Y|T]).


solve(_,1,R,R).

solve(N,Size,[X/Y|T],Result):-
    move(N,X/Y,X1/Y1),
    \+ member(X1/Y1,[X/Y|T]),
    NewSize is Size - 1,
    solve(N,NewSize,[X1/Y1,X/Y|T],Result).




move(N,X/Y,X1/Y1):-
    newValues(P,Q),
    X1 is P + X,
    X1 > 0,
    X1 =< N,
    Y1 is Q + Y,
    Y1 > 0,
    Y1 =< N.


newValues(1,2).
newValues(2,1).
newValues(1,-2).
newValues(-2,1).
newValues(-1,2).
newValues(2,-1).
newValues(-2,-1).
newValues(-1,-2).
