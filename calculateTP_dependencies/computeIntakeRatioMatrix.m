function [intake_ratio] = computeIntakeRatioMatrix(A)

tot_intake = sum(A);

intake_ratio = zeros(length(A));
for prey = 1:length(A)
    for predator = 1:length(A)
        if A(prey,predator) ~= 0
            intake_ratio(prey,predator) = A(prey,predator)/tot_intake(predator);
        end
    end
end

end