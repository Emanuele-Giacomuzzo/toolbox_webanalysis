function [degree_matrix] = degreeMatrix(A,weight)

degree_matrix = zeros(length(A));

if weight == "binary"

    A = toundirected(A);
    A(A > 0) = 1;
    network_U = graph(A);
    node_degrees = degree(network_U);    
    for node = 1:length(node_degrees)
        degree_matrix(node,node) = node_degrees(node);
    end
    
elseif weight == "weighted"
    
    node_degrees = calculateWDC(A);
    for node = 1:length(node_degrees)
        degree_matrix(node,node) = node_degrees(node);
    end
    
end


end