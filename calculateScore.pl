calculateSingleKeywordTitleScore(Title,Keyword,Points,Score):-
	(sub_string(case_insensitive,Keyword,Title)
	 ->write('Keyword is in the title'),
	 nl,
	 Score is Points*2
	 ; write('Keyword is not in the title'),
	 nl,
	 Score is 0 ).
	 
calculateTotalKeywordsTitleScore([],[],[],0).
calculateTotalKeywordsTitleScore([H|T],[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsTitleScore(T,T1,T2,ScoreOfRest),
	calculateSingleKeywordTitleScore(H,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore+ScoreOfRest.


calculateSingleKeywordSubjectScore(Subject,Keyword,Points,Score):-
	(sub_string(case_insensitive,Keyword,Subject)
	 ->write('Keyword is in the subject'),
	 Score=Points ).

calculatetTotalKeywordsSubjectScore(_,[],[],0).
calculateTotalKeywordsSubjectScore(Subject,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsSubjectScore(Subject,T1,T2,ScoreOfRest),
	calculateSingleKeywordSubjectScore(Subject,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore+ScoreOfRest.

calculateSessionTotalScore(_,_,[],[],0).
calculateSessionTotalScore(Subject,Title,[H1|T1],[H2|T2],FinalScore):-
	calculateSessionTotalScore(Subject,Title,T1,T2,TotalScoreOfRest),
	calculateTotalKeywordsTitleScore(Subject,Title,H1,H2,TotalTitleScore),
	calculateTotalKeywordsSubjectScore(Subject,Title,H1,H2,TotalSubjectScore),
	Score is TotalTitleScore+TotalSubjectScore+TotalScoreOfRest,
	sum_list(Score,Sum),
	max_list(Score,Max),
	TotalScore is 1000*Max+Sum,
	FinalScore is TotalScore.
	
% titles,subject
calculateScore([],[],[],[],[],[]).
calculateScore([H4|T4],[H3|T3],[H1|T1],[H2|T2],TitlesResult,ScoreResult):-
	calculateScore(T4,T3,T1,T2,TitlesResultOfRest,ScoreResultOfRest),
	calculateSessionTotalScore(H4,H3,H1,H2,TotalScore),
	append(TitlesResultOfRest,H4,TitlesResult),
	append(ScoreResultOfRest,TotalScore,ScoreResult).