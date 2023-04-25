% Base case: 
min([X], X).

% Recursive case: 
min([H|T], Min) :-
% Recursively find the minimum value in the tail of the list (T)
min(T, TailMin),
% Determine the minimum value between the head of the list (H) and the minimum value in the tail (TailMin)
(H < TailMin -> Min = H ; Min = TailMin).

% Calculate the maximum value in a list of numbers
% Base case: 
max([X], X).

% Recursive case: 
max([H|T], Max) :-
% Recursively find the maximum value in the tail of the list (T)
max(T, TailMax),
% Determine the maximum value between the head of the list (H) and the maximum value in the tail (TailMax)
(H > TailMax -> Max = H ; Max = TailMax).

% Calculate the sum and length of a list of numbers
% Base case:
sum_and_length([], 0, 0).

% Recursive case: calculate the sum and length of the list by adding the head of the list (H) to the sum and length of the tail (T)
sum_and_length([H|T], Sum, Length) :-
% Recursively find the sum and length of the tail of the list (T)
sum_and_length(T, TailSum, TailLength),
% Add the head of the list (H) to the sum of the tail (TailSum)
Sum is H + TailSum,
% Increment the length of the tail (TailLength) by 1
Length is TailLength + 1.

% Calculate the average value of a list of numbers
average(List, Average) :-
% Find the sum and length of the list
sum_and_length(List, Sum, Length),
% Ensure the list has at least one element to avoid division by zero
Length > 0,
% Calculate the average by dividing the sum by the length
Average is Sum / Length.

% Calculate the minimum, maximum, and average values of a list of numbers
min_max_avg(List, Min, Max, Avg) :-
% Calculate the minimum value in the list
min(List, Min),
% Calculate the maximum value in the list
max(List, Max),
% Calculate the average value in the list
average(List, Avg).

% Count the occurrences of a number in a list
count(, [], 0).
count(Number, [Number|Tail], Count) :-
% If the head of the list (Number) is equal to the given number, increment the count of that number
count(Number, Tail, TailCount),
Count is TailCount + 1.
count(Number, [|Tail], Count) :-
% If the head of the list (Number) is not equal to the given number, continue counting the given number in the tail of the list
count(Number, Tail, Count).

% Find the mode in a list
mode(List, Mode) :-
% Create a list of pairs with each element and its count
pairs(List, Pairs),
% Sort the list of pairs by count in descending order
keysort(Pairs, SortedPairs),
reverse(SortedPairs, ReversePairs),
% Get the first element (i.e., the element with the highest count)
[Mode-|] = ReversePairs.

% Create a list of pairs with each element and its count
pairs([], []).
pairs([H|T], [H-Count|Pairs]) :-
% Count the occurrences of the element in the list
count(H, [H|T], Count),
% Create a pair with the element and its count
pairs(T, Pairs).

% Merge sort implementation for sorting the list
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, SortedList) :-
% Divide the list into two roughly equal parts
halve(List, LeftHalf, RightHalf),
% Recursively sort each part
merge_sort(LeftHalf, SortedLeftHalf),
merge_sort(RightHalf, SortedRightHalf),
% Merge the two sorted parts into a single sorted list
merge(SortedLeftHalf, SortedRightHalf, SortedList).

% Halve a list into two roughly equal parts
halve(List, LeftHalf, RightHalf) :-
halve_helper(List, List, LeftHalf, RightHalf).

halve_helper([], LeftHalf, LeftHalf, []).
halve_helper([X|T], [_, _|T2], [X|LeftHalf], RightHalf) :-
halve_helper(T, T2, LeftHalf, RightHalf).

% Merge two sorted lists into a single sorted list
merge([], List, List).
merge(List, [], List).
merge([X|L1], [Y|L2], [X|L]) :-
X =< Y,
merge(L1, [Y|L2], L).
merge([X|L1], [Y|L2], [Y|L]) :-
X > Y,
merge([X|L1], L2, L).

% Calculate the median of a list of numbers
median(List, Median) :-
% Sort the list
merge_sort(List, SortedList),
% Find the median depending on whether the list has an odd or even length
length(SortedList, Length),
( Length mod 2 =:= 0
-> % Even length, so find the two middle elements and take their average
N1 is Length // 2,
nth0(N1, SortedList, Element1),
N2 is N1 - 1,
nth0(N2, SortedList, Element2),
Median is (Element1 + Element2) / 2
; % Odd length, so take the middle element
N is Length // 2,
nth0(N, SortedList, Median)
).

% Calculate the minimum, maximum, average, mode, and median values of a list of numbers
min_max_avg_mode_median(List, Min, Max, Avg, Mode, Median) :-
% Calculate the minimum, maximum, and average values
min_max_avg(List, Min, Max, Avg),
% Calculate the mode
mode(List, Mode),
% Calculate the median
median(List, Median).
% Calculate the median
median(List, Median).
