%calculateSingleKeywordScore() gets a single title or a single subject and a single keyword with its points 
%and calculates the score of title or subject and returns this score. 

%CASE 1:
%Keyword is in the title or the subject of the session and the score is Points*2.
calculateSingleKeywordScore(Input,Keyword,Points,Score):-
	sub_string(case_insensitive,Keyword,Input),
	Score is Points,
	!.
	
%CASE 2:
%Keyword is not in the title or the subject of the sesssion and the score is 0.	
calculateSingleKeywordScore(Input,Keyword,_Points,Score):-
	 not(sub_string(case_insensitive,Keyword,Input)),
	 Score is 0,
	 !.
	 
%calculateTotalKeywordsTitleScore() gets a single title and a list with total keywords and a list with their
%points and calculates the score of the title and returns this score.
calculateTotalKeywordsTitleScore(_,[],[],0).
calculateTotalKeywordsTitleScore(Title,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsTitleScore(Title,T1,T2,ScoreOfRest),
	calculateSingleKeywordScore(Title,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore*2+ScoreOfRest.
	
%calculateTotalKeywordsSubjectScore() gets a single subject and a list with total keywords and a list with their
%points and calculates the score of subject and returns this score.
calculateTotalKeywordsSubjectScore(_,[],[],0).
calculateTotalKeywordsSubjectScore(Subject,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsSubjectScore(Subject,T1,T2,ScoreOfRest),
	calculateSingleKeywordScore(Subject,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore+ScoreOfRest.

%calculateTotalKeywordsTotalSubjectsScore() gets a list with subjects of a session and a list with total keywords and a
%list with their points and calculates the score of total subjects of a session and returns a list which contains
%these scores.
calculateTotalKeywordsTotalSubjectsScore([],_,_,[]).
calculateTotalKeywordsTotalSubjectsScore([H1|T1],Keywords,Points,Score):-
	calculateTotalKeywordsTotalSubjectsScore(T1,Keywords,Points,ScoreOfRest),
	calculateTotalKeywordsSubjectScore(H1,Keywords,Points,ScoreOfSubject),
	append([ScoreOfSubject],ScoreOfRest,Score).

%calculateSessionTotalScore() gets a single title and a list with its subjects and a list with total keywords and a list
%with their points and calculates the total score of session which is 1000*Max+Sum and returns this TotalScore.
calculateSessionTotalScore(Title,Subjects,Keywords,Points,TotalScore):-
	calculateTotalKeywordsTitleScore(Title,Keywords,Points,ScoreOfTitle),
	calculateTotalKeywordsTotalSubjectsScore(Subjects,Keywords,Points,ScoreOfSubjects),
	append([ScoreOfTitle],ScoreOfSubjects,Score),
	sum_list(Score,Sum),
	max_list(Score,Max),
	TotalScore is 1000*Max+Sum.

%calculateScore() gets a list with titles and a list with subjects of all sessions and calculates 
%the total scores of all sessions and returns a list which contains these scores. 
calculateScore([],[],_,_,[]).
calculateScore([H1|T1],[H2|T2],Keywords,Points,FinalScore):-
	calculateScore(T1,T2,Keywords,Points,ScoreOfRest),
	calculateSessionTotalScore(H1,H2,Keywords,Points,ScoreOfSession),
	append([ScoreOfSession],ScoreOfRest,FinalScore),
	!.