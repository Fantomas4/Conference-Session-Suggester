%generateFinalKeywordList(InitialKeywordList,FinalKeywordList)
% test input for this : generateFinalKeywordList(['hello there', 'nice', 'car', 'very big cat', 'm m m m m']).

generateFinalKeywordList([]).
generateFinalKeywordList([WH|T]) :-
	tokenize_atom(WH,WordComponents),
	length(WordComponents,Len),
	write(Len),
	nl,
	( sub_string(case_insensitive,' ',WH)
	-> write('Keyword is a phrase')
	; write('Keyword is a single word')
	),
	nl,
	nl,
	generateFinalKeywordList(T).