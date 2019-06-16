
% Gets a list of words and an amount of points
% and returns 2 lists, one containing the words 
% and another containing the points associated with each word

pairWordsWithPoints([],_,[],[]).
pairWordsWithPoints([WH|T1],Points,[WH|T2],[Points|T3]) :-
	pairWordsWithPoints(T1,Points,T2,T3).