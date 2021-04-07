function [s,cs,ns] = statusIndices(A)
%It calculates the status indices described in 
%Jordán, F., Takács-Sánta, A., & Molnár, I. (1999). A reliability theoretical quest for keystones. Oikos, 453-462.
%
%The results of this code have been tested against the software Graph by
%CosbiLab.

%Watch out: the food web you are using needs to be a directed acyclic graph: 
%it needs to be without self-loops and without simple cycles. You can
%transform the adjacency matrix of the graph into the adjacency matrix of a
%DAG by using the function createDAG of the Food Web Analysis Toolbox. 
%
%A = adjacency matrix of the directed graph. The rows should be the preys
%and the columns should be the predators.


%Network: binary, directed, loop-less. This code was tested against
%CosbiLab results. 

%Watch out: the food web you are using needs to be loopless: it doesn't
%need to contain neither self-loops or simple cycles.

A(A > 0) = 1; %binary

path_length = distances(digraph(A),'Method','unweighted');
path_length(isinf(path_length)) = 0;
s = sum(path_length,2);

path_length_inv = distances(flipedge(digraph(A)),'Method','unweighted');
path_length_inv(isinf(path_length_inv)) = 0;
cs = sum(path_length_inv,2);

ns = s - cs;

end