function [intake_ratio_heterotrophs] = deleteAutotrophs(intake_ratio,tot_intake)

intake_ratio_heterotrophs = intake_ratio;

autotrophs = double.empty;
for i = 1:length(intake_ratio)
    if tot_intake(i)==0
        autotrophs = [autotrophs; i];
    end
end

intake_ratio_heterotrophs(autotrophs,:) = []; 
intake_ratio_heterotrophs(:,autotrophs) = [];

end