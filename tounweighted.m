function [A] = tounweighted(A)
%It preserves the self-loops.

A(A > 0) = 1

end