

merge_sort([X],[X]):-
   !.

merge_sort(List,Result):-
    devide_array(List,L,R),
	merge_sort(L,ResultLeft),
	merge_sort(R,ResultRight),
	merge(ResultLeft,ResultRight,Result).	
	
devide_array(List,L,R):-
 length(List,Len),
 Length is div(Len,2),
 devide_array(List,Length,0,L,R).
 
 
devide_array(T,Length,Length,[],T):-
!.

devide_array([H|T],Length,Acc,[H|L],R):-
   NewAcc is Acc + 1,
 devide_array(T,Length,NewAcc,L,R).







merge(List1,List2,Result):-
  merge(List1,List2,[],Result).

merge([],L,X,Result):-
   append(X,L,Result).
merge(L,[],X,Result):-
    append(X,L,Result).
	
merge([H1|T1],[H2|T2],Acc,Result):-
      (
	   H1 =< H2 ->
            apend(Acc,H1,NewList),
     	    merge(T1,[H2|T2],NewList,Result)
	  ;
           apend(Acc,H2,NewList),
           merge([H1|T1],T2,NewList,Result)
	  ).
	  
%i think prolog implementation of append/3 does work with empty list so i implemented here.
apend([],X,[X]).

apend([H|T],X,[H|T2]):-
  apend(T,X,T2).