
%sortFinalResults() gets a list with pairs (key-value) which are title-score pairs and
%divides them in two lists and after sorts them with descending order and then
%returns these two sorted lists, titles and scores
sortFinalResults(Pairs,SortedTitles,SortedScores) :-
	% Pairs is a key-value list
	transpose_pairs(Pairs,TPairs),
	% Reverse the TPairs value-key list (descending order), 
	% which is currently sorted in ascending order
	reverse(TPairs, DescList),
	pairs_values(DescList,SortedTitles),
	pairs_keys(DescList,SortedScores).