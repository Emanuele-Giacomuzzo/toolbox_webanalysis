function[k, kbu, ktd, kdir, kindir] = calculateKeystone(A)
%
%It calculates the keystone indices described in
%Jordán, F., Takács-Sánta, A., & Molnár, I. (1999). A reliability theoretical quest for keystones. Oikos, 453-462.
%
%The results of this code have been tested against the software Graph by
%CosbiLab. See Valentini, R., & Jordán, F. (2010). CoSBiLab Graph: the network analysis module of CoSBiLab. Environmental Modelling & Software, 25(7), 886-888.
%
%This function was originally coded by Wei-Chung Liu in R and then
%implemented in MATLAB by Emanuele Giacomuzzo.
%
%A = adjacency matrix of the directed graph. The rows should be the preys
%and the columns should be the predators.
%k = keystone index
%kbu = keystone index for bottom-up effects
%ktd = keystone index for top-down effects
%kdir = keystone index for directed effects
%kindir = keystone index for indirected effects

A(A > 0) = 1; %binary
A = createDAG(A);

preys = sum(A);
preys = preys.';
predators = sum(A,2);

prey_coefficients = preyCoefficients(A,preys,length(A));
vw = sum(prey_coefficients,2)*-1;
diagonal = diag(ones(length(A),1)*-1);
prey_coefficients_updated = prey_coefficients+diagonal;
kbu = linsolve(prey_coefficients_updated,vw);

predator_coefficients = predatorCoefficients(A,predators,length(A));
vw = sum(predator_coefficients,2)*-1;
predator_coefficients_updated = predator_coefficients+diagonal;
ktd = linsolve(predator_coefficients_updated,vw);

for i = 1:length(A)
    k(i) = kbu(i) + ktd(i);
end

kdir = sum(prey_coefficients,2);
kindir = kIndirect(prey_coefficients,kbu,length(A));

predator_coefficients_col = predatorCoefficientsCol(A,predators,length(A));
vw = sum(predator_coefficients_col);
for i = 1:length(A)
    kdir(i) = kdir(i) + vw(i);
end

for i = 1:length(A)
    for j = 1:length(A)
        predator_coefficients_col(i,j) = ktd(i)*predator_coefficients_col(i,j);
    end
end
predator_coefficients_col_sum = sum(predator_coefficients_col);
for i = 1:length(A)
    kindir(i) = kindir(i)+predator_coefficients_col_sum(i);
end

k = k';

end
