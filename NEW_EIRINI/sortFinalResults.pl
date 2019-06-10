%sortFinalResults([day-4,'general results'-1,exceptions-5,airplane-1,'general meeting'-2],SortedSessions,SortedScores).

%%%   TEMP - DELETE? START %%%
%concatScoreWithTitles([],[],[]).
%concatScoreWithTitles([H1|T1],[H2|T2],Pairs):-
%	concatScoreWithTitles(T1,T2,PairsOfRest),
%	string_concat(H1,'-',Temp),
%	string_concat(Temp,H2,Pair),
%	NewResult=[Pair],
%	append(NewResult,PairsOfRest,Pairs).
%%%   TEMP - DELETE? END %%%

sortFinalResults(Pairs,SortedSessions,SortedScores) :-
	% Pairs is a key-value list
	transpose_pairs(Pairs,TPairs),
	%print(TPairs),
	nl,
	% Reverse the TPairs value-key list (descending order), 
	% which is currently sorted in ascending order
	reverse(TPairs, DescList),
	%write(DescList),
	nl,
	pairs_values(DescList,SortedSessions),
	pairs_keys(DescList,SortedScores).