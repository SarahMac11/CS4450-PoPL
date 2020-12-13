/* 
 * 23 November 2020
 * Assignment 4 - Prolog Programming
 */

% Q1:- Check if list of coordinates (x1,y1,x2,y2,x3,y3, x4,y4) form a square
% Functions
% Calculate distance
distance(X1,Y1,X2,Y2,D) :- D is sqrt(((X1-X2) * (X1-X2)) + ((Y1-Y2) * (Y1-Y2))) .
% Check if coordinates form a square using distance calculated
is_square(X1,Y1,X2,Y2,X3,Y3,X4,Y4) :-
    						% calculate 4 sides
    						distance(X1,Y1,X2,Y2,D1),
    						distance(X2,Y2,X3,Y3,D2),
    						distance(X3,Y3,X4,Y4,D3),
    						distance(X1,Y1,X4,Y4,D4),
    						% calculate diagonals
    						distance(X1,Y1,X3,Y3,D5),
    						distance(X2,Y2,X4,Y4,D6),
    						% check distance of sides are equal
    						D1 == D2,
    						D1 == D3,
    						D1 == D4,
    						D2 == D3,
    						D2 == D4,
    						D3 == D4,
    						% check diagonals are equal
    						D5 == D6,
    						% check distances are valid
    						D1 > 0,
                            D2 > 0,
    						D3 > 0,
    						D4 > 0,
    						D5 > 0,
    						D6 > 0 .



% Q2:- Find out whether a list is a palindrome
% Is palindrome function
is_pal(L) :-
    % compare input list to the list reversed, if the same then a palindrome
    reverse(L, L) .



% Q3:- Find if given list has even number of elements.
% Is even function defined
is_even(L) :-
    % use length function to send list L to get number N of elements in L 
    length(L, N),
    % verify elements N returned from length are divisible by 2 or even
    0 is mod(N,2) .



% Q4:- Find the Kth element of a list.
% Find k element function defined
% If K = 1, then return first item in list
k_element(X,[X|_],1) .
% Recursively call k_element with list and index where index = K + 1
k_element(X,[_|L],K) :- k_element(X,L,K1), K is K1+1 .
% Input: ?-k_element(X ,[7,1,4,2,9], 2) > Output: X = 1
% Input: ?-k_element(X ,[7,1,4,2,9], 5) > Output X = 9
