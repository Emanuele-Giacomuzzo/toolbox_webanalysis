function [s,cs,ns] = statusIndices(A)
%
%It calculates the status indices described in  
%Jordán, F., Takács-Sánta, A., & Molnár, I. (1999). A reliability theoretical quest for keystones. Oikos, 453-462.
%
%The results of this code have been tested against the software Graph by CosbiLab. 
%See Valentini, R., & Jordán, F. (2010). CoSBiLab Graph: the network analysis module of CoSBiLab. Environmental Modelling & Software, 25(7), 886-888.
%
%A = adjacency matrix of the food web. The rows should be the preys
%and the columns should be the predators.
%s = status index
%cs = contrastatus index
%ns = net status index

A(A > 0) = 1; %binary
A = createDAG(A);

path_length = distances(digraph(A),'Method','unweighted');
path_length(isinf(path_length)) = 0;
s = sum(path_length,2);

path_length_inv = distances(flipedge(digraph(A)),'Method','unweighted');
path_length_inv(isinf(path_length_inv)) = 0;
cs = sum(path_length_inv,2);

ns = s - cs;

end