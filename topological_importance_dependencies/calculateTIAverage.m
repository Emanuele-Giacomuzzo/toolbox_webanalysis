function [average_effect] = calculateTIAverage(A, step_effect_matrix, nr_of_steps)

average_effect = zeros(length(A));
for step = 1:nr_of_steps
    average_effect = average_effect + step_effect_matrix{step};
end

average_effect = average_effect * (1/nr_of_steps);

end