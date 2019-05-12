getWordsOfPhrase(Components,Result) :-
	% Gets the last element of the Components list,
	% which is always the points associated with the phrase.
	last(Components,Points),
	
	% Deletes the Points element from the Components list
	select(Points,Components,PhraseWords),
	Result = PhraseWords.