% the program is forced to pick both elements of the choice rule
% due to the following rules so both rows and columns are generated
col(0..D) :- dim(D), D'=D-1.
row(0..D) :- dim(D), D'=D-1.

% for each tree location, asign to it ownership of a location neighboring it on any axis
1 { own((X, Y), (X', Y')) : |X - X'|+|Y - Y'| = 1, row(X'), col(Y') } 1 :- tree(X, Y).
% generate a tent atom at each location owned by a tree
1 { tent(X', Y') } 1 :- own((X, Y), (X', Y')).

% one same tent cannot belong to two different trees
:- own((X, Y),(Z, T)), own((X', Y'),(Z, T)), (X, Y)!=(X', Y').

% no two tents can be neighbours in both axis
:- tent(X,Y), tent(X',Y'), |X - X'|+|Y - Y'| = 1.
% or diagonally
:- tent(X,Y), tent(X',Y'), Y!=Y', X!=X', |X-X'|=1, |Y-Y'|=1.

% check number of tents in each row and column matches assigned values
:- rowVal(R,V), #count{X: tent(X,R)}!=V.
:- colVal(C,V), #count{Y: tent(C,Y)}!=V.

