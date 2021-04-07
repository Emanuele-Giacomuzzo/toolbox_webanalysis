function[overlap_matrix] = computeTOMatrix(interactor_matrix)

overlap_matrix = zeros(length(interactor_matrix));
for prey1 = 1:length(interactor_matrix)
    for prey2 = 1:length(interactor_matrix)
        for predator = 1:length(interactor_matrix)
            if (interactor_matrix(prey1, predator) == 'S') && (interactor_matrix(prey2, predator) == 'S')
                overlap_matrix(prey1,prey2) = overlap_matrix(prey1,prey2) + 1;
            end
        end
    end
end

end