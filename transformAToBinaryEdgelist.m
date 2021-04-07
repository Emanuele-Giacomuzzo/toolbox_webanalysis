function[edgelist] = transformAToBinaryEdgelist(A)
%I transforms an adjacency matrix A to a binary edgelist.

edgelist = double.empty; 

for node_from = 1:length(A)
    for node_to = 1:length(A)
        if A(node_from,node_to) ~= 0
            edgelist = [edgelist; node_from node_to];
        end
    end
end

end