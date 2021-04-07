function[interactor_matrix] = computeInteractorMatrix(average_effect_matrix, threshold)

%interactor_matrix matrix
for node_from = 1:length(average_effect_matrix)
    for node_to = 1:length(average_effect_matrix)
        if average_effect_matrix(node_from,node_to) > threshold
            interactor_matrix(node_from,node_to) = 'S';
        else
            interactor_matrix(node_from,node_to) = 'W';
        end
    end
end


end