row(0..D') :- dim(D), D'=D-1.
col(0..D') :- dim(D), D'=D-1.

N {tent(X,Y): row(X), col(Y)} N :- #count{X,Y: tree(X,Y)} = N.
1 {own((X,Y),(X',Y')): tree(X,Y), |X-X'|<=1, |Y-Y'|<=1} 1 :- tent(X',Y'). % |X-X'|<=1, |Y-Y'|<=1.

:- own((X,Y),(Z,T)), own((X,Y),(Z',T')), (Z,T)!=(Z',T').

:- tent(X,Y), tree(X,Y).
:- own((X,Y),(X,Z)), Y!=Z, |Y-Z|!=1.
:- own((Y,X),(Z,X)), Y!=Z, |Y-Z|!=1.
:- own((X,Y),(X',Y')), |X-X'|=1, |Y-Y'|=1.

%:- tent(Y,X), tree(Z,X), Y!=Z, |Y-Z|!=1.
%tent(X,Y) :- row(X), col(Y), tree(X,Z), Y!=Z, |Y-Z|=1.
%tent(Y,X) :- row(X), col(Y), tree(Z,X), Y!=Z, |Y-Z|=1.

:- tent(X,Y), tent(X,Z), Y!=Z, |Y-Z|=1.
:- tent(Y,X), tent(Z,X), Y!=Z, |Y-Z|=1.
:- tent(X,Y), tent(X',Y'), Y!=Y', X!=X', |X-X'|=1, |Y-Y'|=1.

:- rowVal(R,V), #count{Y: tent(R,Y)}!=V.
:- colVal(C,V), #count{X: tent(X,C)}!=V.

#show tent/2.
#show tree/2.
#show own/2.
#show #count{Y: tent(Y,4)}/1.
