
%%Implementatin of Insertionsort

insert_sort(List,Result):-
   insert_sort(List,[],Result).
 
insert_sort([],L,L):-
  !.

insert_sort([H|T],ACC,Result):-
   insert(H,ACC,InsertedList),
   insert_sort(T,InsertedList,Result).
   
   
insert(Element,[],[Element]):-
   !.
   
insert(Element,[X],InsertedList):-
     (
	   X > Element ->
	   InsertedList = [Element,X]
	   ;
	   InsertedList = [X,Element]
	   ).
	   
insert(Element,[H|T],InsertedList):-
    (
	 Element > H ->
	    InsertedList = [H|NewList],
		insert(Element,T,NewList)
		;
		InsertedList = [Element,H|T]
	).