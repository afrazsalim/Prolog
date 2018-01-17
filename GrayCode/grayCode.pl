grayCode(N,Result):-
    createLists(N,List),!,
    findGrayCode([List],[List],Result).

createLists(0,[]).
createLists(N,[0|List]):-
    NewN is N-1,
    createLists(NewN,List).

findGrayCode([H|T],Visited,[H|T]):-
     \+ (moves(H,NextMove),
        legalMove(H,NextMove),
        \+ exist(NextMove,Visited)).




findGrayCode([H|T],Visited,Result):-
    moves(H,NextMove),
    \+ exist(NextMove,[H|Visited]),
    legalMove(H,NextMove),
    findGrayCode([NextMove,H|T],[NextMove|Visited],Result).


legalMove(Move,NextMove):-
    checkForLegality(Move,NextMove,0).


checkForLegality([],[],C):-
    C == 1.
checkForLegality([H|T],[H2|T2],C):-
    (
     H == H2 ->
        NewCost is C
        ;
     H \= H2 ->
        NewCost is C + 1
    ),
    checkForLegality(T,T2,NewCost).


exist(List,[H|_]):-
  checkForList(List,H).

exist(List,[_|T]):-
    exist(List,T).

checkForList([],[]).
checkForList([H|T],[H|T]):-
    checkForList(T,T).



moves(List,Res):-
    per(List,Res).


per([0|T],[1|T]).
per([1|T],[0|T]).
per([H|T],[H|Res]):-
    per(T,Res).
