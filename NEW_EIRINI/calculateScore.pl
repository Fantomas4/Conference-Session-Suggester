calculateSingleKeywordTitleScore(Title,Keyword,Points,Score):-
	(sub_string(case_insensitive,Keyword,Title)
	 ->write('Keyword is in the title'),
	 nl,
	 Score is Points*2
	 ; write('Keyword is not in the title'),
	 nl,
	 Score is 0 ).
	 
calculateTotalKeywordsTitleScore(_,[],[],0).
calculateTotalKeywordsTitleScore(Title,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsTitleScore(Title,T1,T2,ScoreOfRest),
	calculateSingleKeywordTitleScore(Title,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore+ScoreOfRest.
	
	
calculateSingleKeywordSubjectScore(Subject,Keyword,Points,Score):-
	(sub_string(case_insensitive,Keyword,Subject)
	 ->write('Keyword is in the subject'),
	 nl,
	 Score is Points
	; write('Keyword is not in the subject'),
	 nl,
	 Score is 0	 ).


calculateTotalKeywordsSubjectScore(_,[],[],0).
calculateTotalKeywordsSubjectScore(Subject,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsSubjectScore(Subject,T1,T2,ScoreOfRest),
	calculateSingleKeywordSubjectScore(Subject,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore+ScoreOfRest.

calculateTotalKeywordsTotalSubjectsScoreA([],_,_,[]).
calculateTotalKeywordsTotalSubjectsScoreA([H1|T1],Keywords,Points,Score):-
	calculateTotalKeywordsTotalSubjectsScoreA(T1,Keywords,Points,ScoreOfRest),
	calculateTotalKeywordsSubjectScore(H1,Keywords,Points,ScoreOfSubject),
	append([ScoreOfSubject],ScoreOfRest,Score).

	
calculateSessionTotalScore(Title,Subjects,Keywords,Points,TotalScore):-
	calculateTotalKeywordsTitleScore(Title,Keywords,Points,ScoreOfTitle),
	calculateTotalKeywordsTotalSubjectsScoreA(Subjects,Keywords,Points,ScoreOfSubjects),
	append([ScoreOfTitle],ScoreOfSubjects,Score),
	sum_list(Score,Sum),
	max_list(Score,Max),
	TotalScore is 1000*Max+Sum.

calculateScore([],[],_,_,[]).
calculateScore([H1|T1],[H2|T2],Keywords,Points,FinalScore):-
	calculateScore(T1,T2,Keywords,Points,ScoreOfRest),
	calculateSessionTotalScore(H1,H2,Keywords,Points,ScoreOfSession),
	append([ScoreOfSession],ScoreOfRest,FinalScore).