%calculateSingleKeywordTitleScore() gets a single title and a single keyword with its points 
%and calculates the score of title and returns this score. 

%CASE 1:
%Keyword is in the title of session and the score is Points*2.
calculateSingleKeywordTitleScore(Title,Keyword,Points,Score):-
	sub_string(case_insensitive,Keyword,Title),
	write('Keyword is in the title'),
	nl,
	Score is Points*2,
	!.
	
%CASE 2:
%Keyword is not in the title of the sesssion and the score is 0.	
calculateSingleKeywordTitleScore(Title,Keyword,Points,Score):-
	 not(sub_string(case_insensitive,Keyword,Title)),
	 write('Keyword is not in the title'),
	 nl,
	 Score is Points*0,
	 !.
	 
%calculateTotalKeywordsTitleScore() gets a single title and a list with total keywords and a list with their
%points and calculates the score of the title and returns this score.
calculateTotalKeywordsTitleScore(_,[],[],0).
calculateTotalKeywordsTitleScore(Title,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsTitleScore(Title,T1,T2,ScoreOfRest),
	calculateSingleKeywordTitleScore(Title,H1,H2,SingleKeywordScore),
	Score is SingleKeywordScore+ScoreOfRest.
	
%calculateSingleKeywordSubjectScore() gets a single subject and a single keyword with its points
%and calculates the score of subject and returns this score.	

%CASE 1:
%Keyword is in the subject of session and the score is its points.
calculateSingleKeywordSubjectScore(Subject,Keyword,Points,Score):-
	 sub_string(case_insensitive,Keyword,Subject),
	 write('Keyword is in the subject'),
	 nl,
	 Score is Points,
	 !.

%CASE 2:
%Keyword is not in the subject of session and the score is 0.	 
calculateSingleKeywordSubjectScore(Subject,Keyword,Points,Score):-
	not(sub_string(case_insensitive,Keyword,Subject)),
	write('Keyword is not in the subject'),
	nl,
	Score is Points*0,
	!.

%calculateTotalKeywordsSubjectScore() gets a single subject and a list with total keywords and a list with their
%points and calculates the score of subject and returns this score.
calculateTotalKeywordsSubjectScore(_,[],[],0).
calculateTotalKeywordsSubjectScore(Subject,[H1|T1],[H2|T2],Score):-
	calculateTotalKeywordsSubjectScore(Subject,T1,T2,ScoreOfRest),
	calculateSingleKeywordSubjectScore(Subject,H1,H2,SingleKeywordScore),
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
	append([ScoreOfSession],ScoreOfRest,FinalScore).