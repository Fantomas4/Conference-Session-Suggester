% test with: query([day-4,'general results'-1,exceptions,airplane-1,'election vote','general meeting'-2]).

% Import calculateScore.pl
:- [calculateScore].

% Import generateFinalKeywordList.pl
:- [generateFinalKeywordList].

% Import facts about sessions, and respective topics from sessions.pl
:- [sessions].

:- [sortFinalResults].


atomToString([],[]).
%atomToString([H|T],FinalTitles):-
	%atomToString(T,ResultsOfRest),
	%atom_string(H,Z),
	%NewResult=[Z],
	%append(NewResult,ResultsOfRest,FinalTitles).


printResults([],[]).
printResults([H1|T1],[H2|T2]):-
	write(' Session:'),
	write(H1),nl,
	write('	Relevance = '),
	write(H2),nl,
	printResults(T1,T2).

query(InitialListOfKeywords) :-
	generateFinalKeywordList(InitialListOfKeywords,FinalKeywords,FinalKeywordsPoints),
	nl,
	nl,
	write(FinalKeywords),
	nl,
	write(FinalKeywordsPoints),
	nl,
	findall(X,session(X,_),Titles),
	write(Titles),
	findall(Y,session(_,Y),Subjects),
	calculateScore(Titles,Subjects,FinalKeywords,FinalKeywordsPoints,Score),
	nl,
	write(Score),
	nl,
	%concatScoreWithTitles(Titles,Score,Pairs),
	pairs_keys_values(Pairs,Titles,Score),
	write(Pairs),
	sortFinalResults(Pairs,SortedTitles,SortedScore),
	write(SortedTitles),
	nl,
	write(SortedScore).

