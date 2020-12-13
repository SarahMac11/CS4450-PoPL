/* 
 * 4 December 2020
 * Assignment 4 - Prolog Programming
 */

% Q1:- Eliminate consecutive duplicates of list elements
% Define remove function
remove(List, X) :-
    % Imput list sorted by unique elements without duplicates
    sort(List, Unique),
    % Set x to unique list returned from sort
    X = Unique .


/** <examples>
?- remove(([a,a,a,b,q,q,q,q,e,e,e]),X)
*/


% Q2:- Factorial of a number
% Factoral rules
% If input is 0, then factoral is 1
fact(0,1). 
fact(N,R) :-  
    % num must be greater than 0
   	N > 0, 
    % n - 1
    % multiply N in decreasing order
   	N1 is N-1, 
   	fact(N1,R1),
    % multiply new R
   	R is N * R1.

/** <examples>
?- fact(5,R) ;
?- fact(0,R) .
*/


% Q3:- Check if an element X is occurring N times in a list L
% Occurrence rules
% If empty string
occurrence(_, [], 0) .
% If num is different than H, recurrsively call occurrence
occurrence(Num, [H|T], X) :- 
    dif(Num,H), 
    occurrence(Num, T, X) .
% Increment occurrence of num if equal to h and call occurence again
occurrence(Num, [H|T], X) :- 
    Num = H, 
    occurrence(Num, T, X1), 
    X is X1 + 1 .

/** <examples>
?- occurrence(a, [a,b,c,a,a,w,a,f,r,e], 4).
*/


% Q4:- Create a list containing all integers within a given range
% Define range
% If range is same number return I
range(I, K, L) :-
% If I is less than K, set list to I, increment and recursively call range
    ( I > K -> L = []; L = [I|L1],
	Next is I + 1,
range(Next, K, L1)) .

/** <examples>
?- range(2,5, L).
*/
