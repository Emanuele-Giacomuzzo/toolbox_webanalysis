function A = tounweighted(A)
%It transforms the adjacency matrix of a weighted food web into the one of
%a binary food web.

A(A > 0) = 1

end