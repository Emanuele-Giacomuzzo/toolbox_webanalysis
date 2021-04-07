function STO = topologicalOverlap(A, nr_of_steps, min_threshold, max_threshold, learning_rate, weight)
%It calculates the species uniqueness as described in 
%Lai, S. M., Liu, W. C., & Jordán, F. (2015). A trophic overlap-based measure for species uniqueness in ecological networks. Ecological Modelling, 299, 95-101.

%---INPUT---
%A = adjacency matrix of the directed graph. The rows should be the preys
%and the columns should be the predators.
%nr_of_steps = nr of steps to be considered for the spread of the effect.
%For example, if we set nr_of_steps = 3, then we consider only the effect
%reaching 3 species away.
%min_threshold = minimum threshold over which an interaction is considered
%to be strong
%max_threshold = maximum threshold over which an interaction is considered
%to be strong
%learning_rate = differences in the values of the thresholds. For example,
%if min_threshold = 0.1, max_threshold = 0.5 and learning_rate = 0.1, the
%threshold considered will be 0.1, 0.2, 0.3, 0.4, 0.5. 
%weight = whether you want to consider interaction strength or not. By
%default the function considers it. If you do not want to consider it you
%need to input "binary". 

%---OUTPUT---
%STO = vector containing the species uniqueness (STO) of the species in the
%food web. 

if weight == "binary"
    A(A > 0) = 1;
end

A = A - diag(diag(A)); %loopless
degree_matrix = computeDegreeMatrix(A,weight);
threshold = [min_threshold:learning_rate:max_threshold];

for thresh = 1:length(threshold)
    TI1_matrix = calculateTI1(A, degree_matrix);
    for step = 1:nr_of_steps
        TIn_matrices{step} = TI1_matrix .^ step; 
    end
    average_effect_matrix = calculateTIAverage(A, TIn_matrices, nr_of_steps);
    interactor_matrix = computeInteractorMatrix(average_effect_matrix, threshold(thresh));
    overlap_matrix = computeTOMatrix(interactor_matrix);
    TO(:,thresh) = sum(overlap_matrix, 2);
end

STO = sum(TO,2);

end