%generateFinalKeywordList(InitialKeywordList,FinalKeywordList)
% test input for this : generateFinalKeywordList(['hello there', 'nice', 'car', 'very big cat', 'm m m m m']).

generateFinalKeywordList([]).
generateFinalKeywordList([H|T]) :-
	tokenize_atom(H, WordComponents),
	length(WordComponents,Len),
	write(Len),
	nl,
	generateFinalKeywordList(T).