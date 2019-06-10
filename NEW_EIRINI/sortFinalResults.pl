%sortFinalResults([day-4,'general results'-1,exceptions-5,airplane-1,'general meeting'-2],SortedSessions,SortedScores).

sortFinalResults(Pairs,SortedSessions,SortedScores) :-
	% Pairs is a key-value list
	transpose_pairs(Pairs,TPairs),
	print(TPairs),
	nl,
	% Reverse the TPairs value-key list (descending order), 
	% which is currently sorted in ascending order
	reverse(TPairs, DescList),
	write(DescList),
	nl,
	pairs_values(DescList,SortedSessions),
	pairs_keys(DescList,SortedScores),
	print(SortedSessions),
	nl,
	print(SortedScores),
	nl.