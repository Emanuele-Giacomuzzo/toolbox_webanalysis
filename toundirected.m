function [undirected_network] = toundirected(A)
%It preserves the self-loops.

if issymmetric(A) == 0
    
    undirected_network = zeros(length(A));
    for node_from = 1:length(A)
        for node_to = 1:length(A)
            if A(node_from,node_to) ~= 0
                undirected_network(node_from,node_to) = A(node_from,node_to);
                undirected_network(node_to,node_from) = A(node_from,node_to);
            end
        end
    end
    
else
    
    undirected_network=A;

end

end