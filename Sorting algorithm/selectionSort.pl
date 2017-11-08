selectionSort(List,Result):-
   selectionSort(List,[],Result).
   
 
 selectionSort([],L,L).
   
 selectionSort([H|T],Acc,Result):-
    findMin(T,H,X),
	NewList = [X|Acc],
	delete(T,X,T2),
	selectionSort(T2,NewList,Result).
	

	

findMin([],X,X).	
	
findMin([H|T],Acc,Result):-
   Max is max(H,Acc),
   findMin(T,Max,Result).
   
	