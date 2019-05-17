% test with: query([day-4,'general results-1',exceptions,airplane-1,'election vote','general meeting-2']).
% or with: query([day-4,exceptions,'general meeting-2']).


% Import generateFinalKeywordList.pl
:- [generateFinalKeywordList].

% Import facts about sessions, and respective topics from sessions.pl
:- [sessions].

% Import calculateScore.pl
:- [calculateScore].

% Input: A list
% Output: The same list, with all its elements converted to atoms
prepareKeywordList([],[]).
prepareKeywordList([H|T],FinalList) :-
	prepareKeywordList(T,ListOfRest),
	( atom(H)
	% If current element is an atom
	-> append([H],ListOfRest,FinalList)
	% Else (if current element is not an atom)
	; term_to_atom(H,AtomElement),
	append([AtomElement],ListOfRest,FinalList)
	).
	
	
	
	
	

query(ListOfKeywords) :-
	% First, we convert all the compounds (for example, airplane-1 is recognised by prolog as a compound)
	% from the user input to atoms, so that we can easily work with the list later. 
	prepareKeywordList(ListOfKeywords,AtomList),
	
	% The prepared list that now contains only atom elements is passed
	% to generateFinalKeywordList function.
	generateFinalKeywordList(AtomList,FinalList),
	nl,
	nl,
	write(FinalList),
	n1,
	calculateScore(FinalList,ListWithResults),
	write(ListWithResults).
	
	
	
	
	
	
	
	
	
	