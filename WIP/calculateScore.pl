


% test with: calculateSingleKeywordSubjectScore("rule",0.5,"Defeasibility and norms - modeling rule exceptions and priority relations among rules",Result).

calculateSingleKeywordSubjectScore(Keyword,Points,Subject,Score) :-
	( sub_string(case_insensitive,Keyword,Subject)
	-> write("Yes"),
	nl,
	Score = Points
	; write("No"),
	nl,
	Score = 0
	).


% test with: calculateSingleSubjectScore(['rule exception',rule,exception],[1,0.5,0.5],"Defeasibility and norms - modeling rule exceptions and priority relations among rules",Result).

calculateSingleSubjectScore([],[],_,0).
calculateSingleSubjectScore([WH|WT],[SH|ST],Subject,Result) :-
	calculateSingleSubjectScore(WT,ST,Subject,ResultOfRest),
	calculateSingleKeywordSubjectScore(WH,SH,Subject,SingleKeywordScore),
	Result is SingleKeywordScore + ResultOfRest.

calculateTotalSubjectsScore

calculateTitleScore

calculateSingleSeasonScore

calculateSeasonsScore