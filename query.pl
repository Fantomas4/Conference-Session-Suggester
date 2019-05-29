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
	%findall(X,session(X,_),Titles),
	%findall(Y,session(_,Y),Subjects),
	calculateTotalKeywordsTitleScore(['Rules; Semantic Technology; and Cross-Industry Standards', 'Rule Transformation and Extraction', 
	'Rules and Uncertainty', 'Rules and Norms', 'Rules and Inferencing', 'Rule-based Event Processing and Reaction Rules', 'Rule-Based 
	Distributed/Multi-Agent Systems', 'General Introduction to Rules', 'RuleML-2010 Challenge'],FinalKeywords,FinalKeywordsPoints,Score),
	nl,
	write(Score).
	%calculateScore(Titles,Subjects,FinalKeywords,FinalKeywordsPoints,TitlesResults,ScoreResult),
	%write(Subjects),
	%write(ScoreResult),
	%n1,
	%write(TitlesResults),
	%n1.
