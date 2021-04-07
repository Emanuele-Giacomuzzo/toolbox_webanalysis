function A_undirected = toundirected(A)
%It transforms the adjacecny matrix of a directed graph into the adjacency
%matrix of an undirected one. 
%A = adjacency matrix of the food web. 

if issymmetric(A) == 0
    
    A_undirected = zeros(length(A));
    for node_from = 1:length(A)
        for node_to = 1:length(A)
            if A(node_from,node_to) ~= 0
                A_undirected(node_from,node_to) = A(node_from,node_to);
                A_undirected(node_to,node_from) = A(node_from,node_to);
            end
        end
    end
    
else
    
    A_undirected = A;

end

end