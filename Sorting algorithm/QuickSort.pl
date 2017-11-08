
quick_sort([],[]).
quick_sort([H|T],Result):-
    partition(H,T,L,R),
	quick_sort(L,Result1),
	quick_sort(R,Result2),
	append([H|Result2],Result1,Result).
	
	

	
	
	
	

partition(_,[],[],[]).
 
partition(Pivot,[H|T],[H|Left],Right):-
    Pivot =< H ->
	   partition(Pivot,T,Left,Right).
	   
partition(Pivot,[H|T],Left,[H|Right]):-
    Pivot > H ->
	   partition(Pivot,T,Left,Right).
	
	
insert_at_end(_,[],[]).
insert_at_end(X,[H|T],[H|T2]):-
  insert_at_end(X,T,T2).