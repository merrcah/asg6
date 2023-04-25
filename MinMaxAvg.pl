% base case 
min_max_avg([], 0, 0, 0).

% recursive case for a non-empty list
min_max_avg([H|T], Min, Max, Avg) :-
    % recursive call on the tail of the list
    min_max_avg(T, RestMin, RestMax, RestAvg),
    % minimum
    Min is min(H, RestMin),
    % maximum
    Max is max(H, RestMax),
    % average
    Avg is (H + RestAvg * length(T)) / (length(T) + 1).
    
    
