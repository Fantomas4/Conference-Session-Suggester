% test with: query([day-4,'general results'-1,exceptions,airplane-1,'election vote','general meeting'-2]).

% Import calculateScore.pl
:- [calculateScore].

% Import generateFinalKeywordList.pl
:- [generateFinalKeywordList].

% Import facts about sessions, and respective topics from sessions.pl
:- [sessions].

	
query(InitialListOfKeywords) :-
	generateFinalKeywordList(InitialListOfKeywords,FinalKeywords,FinalKeywordsPoints),
	nl,
	nl,
	write(FinalKeywords),
	nl,
	write(FinalKeywordsPoints),
	nl,
	findall(X,session(X,_),Titles),
	findall(Y,session(_,Y),Subjects),
	calculateScore(Titles,Subjects,FinalKeywords,FinalKeywordsPoints,Score),
	nl,
	write(Score).

