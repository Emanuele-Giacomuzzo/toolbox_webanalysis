function A = transformEdgelistToA(edgelist)
%It reads an edgelist and transforms into an adjacency matrix.

%---INPUT---
%edgelist = the edegelist. The first column should be the prey, the second
%should be the predator and the third the interaction strength. 

%---OUTPUT---
%A = the adjacency matrix. 

edgelist = strrep(edgelist,",",".");
species = [edgelist(:,1) edgelist(:,2)];
names = unique(species);

A = zeros(length(names));
for list_edge = 1:length(edgelist)
    prey = find(contains(names, edgelist(list_edge,1)));
    predator = find(contains(names, edgelist(list_edge,2)));
    A(prey,predator) = str2double(edgelist(list_edge,3));
end

end