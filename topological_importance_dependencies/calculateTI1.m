function [TI1_matrix] = calculateTI1(A, degree_matrix)

TI1_matrix = zeros(length(A));
for node_from = 1:length(A)
    for node_to = 1:length(A)
        if A(node_from, node_to) > 0
            TI1_matrix(node_from, node_to) = A(node_from, node_to)/(degree_matrix(node_to, node_to));
        end
    end
end
    
end