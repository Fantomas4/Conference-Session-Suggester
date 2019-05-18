% Import query.pl
:- [query].

% Import sessions.pl
:- [sessions].
 
% calculateScore() gets the FinalKeywords, abstracting head from tail and the FinalKeywordsPoints and returns the ListWithResults which is 
% the list with titles of sessions and their final score
calculateScore([],[],[]).
calculateScore([H2|T2],[H3|T3],ListWithResults):-
	% get from every session the title X and the list with topics 
	session(X,[H1|T1]),
	% call the query 
	query(ListWithKeywords),
	% check if the H2 (the user's input) exists in X (the title)
	( sub_string(case_insensitive,H2,X)
	->write('Keyword is in the title of session'),
	ScoreOfTitle is H3*2 ),
	% add in the new list (Score) the current ScoreOfTitle
	append([],ScoreOfTitle,Score),
	% check if the H2 (the user's input) exists in H1 (the topic)
	( sub_string(case_insensitive,H2,H1)
	->write('Keyword is in the topic of session'),
	ScoreOfTopic is H3 ),
	% add in the new list (Score) the current ScoreOfTopic
	append([],ScoreOfTopic,Score),
	% find the max score of the list 'Score'
	max_list(Score,Max),
	% calculate the sum of the list 'Score'
	sum_list(Score,Sum),
	% calculate the FinalScore according the given type
	FinalScore is 1000*Max+Sum,
	% combine the title of session with the FinalScore
	string_concat(X,'-',Temp),
	string_concat(Temp,FinalScore,Result),
	% add this 'Titleofsession-FinalScore' in a new list which is named 'ListWithResults'
	append([],Result,ListWithResults).
