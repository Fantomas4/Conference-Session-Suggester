% Import calculateScore.pl
:- [calculateScore].

% Import generateFinalKeywordList.pl
:- [generateFinalKeywordList].

% Import facts about sessions, and respective topics from sessions.pl
:- [sessions].

% Import sortFinalResults.pl
:- [sortFinalResults].

printResults([],[]).
printResults([H1|T1],[H2|T2]):-
	write(' Session: '),
	write(H1),nl,
	write('	Relevance = '),
	write(H2),nl,
	printResults(T1,T2).

query(ListOfKeywords) :-
	generateFinalKeywordList(ListOfKeywords,FinalKeywords,FinalKeywordsPoints),
	findall(X,session(X,_),Titles),
	findall(Y,session(_,Y),Subjects),
	calculateScore(Titles,Subjects,FinalKeywords,FinalKeywordsPoints,Score),
	%creates pairs title-score
	pairs_keys_values(Pairs,Titles,Score),
	sortFinalResults(Pairs,SortedTitles,SortedScore),
	printResults(SortedTitles,SortedScore).

