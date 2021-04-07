function WDC = calculateWDC(A)
%It calculates the weighted degree centrality of the nodes inside the food web.

%---INPUT---
%A = adjacency matrix of the directed graph. The rows should be the preys
%and the columns should be the predators.

%---OUTPUT---
%WDC = vector containing the weighted degree centrality of the species inside
%the food web. 

A = toundirected(A);

WDC = zeros(length(A),1);
for i = 1:length(A)
    for j = 1:length(A)
        WDC(i) = WDC(i) + A(i,j);
    end
end

end