function A = transformEdgelistToA(edgelist)

edgelist = strrep(edgelist,",",".");
species = [edgelist(:,1) edgelist(:,2)];
names = unique(species);

A = zeros(length(names));
for x = 1:length(edgelist)
    i = find(contains(names, edgelist(x,1)));
    j = find(contains(names, edgelist(x,2)));
    A(i,j) = str2double(edgelist(x,3));
end

end