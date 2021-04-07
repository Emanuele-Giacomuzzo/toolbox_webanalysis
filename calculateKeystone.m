function[k, kbu, ktd, kdir, kindir] = calculateKeystone(A)
%It calculates the keystone indices described in 
%Jordán, F., Takács-Sánta, A., & Molnár, I. (1999). A reliability theoretical quest for keystones. Oikos, 453-462.

%The results of this code have been tested against the software Graph by
%CosbiLab. This function was originally coded by Wei-Chung Liu in R and then
%implemented in MATLAB by Emanuele Giacomuzzo.

%Watch out: the food web you are using needs to be a directed acyclic graph: 
%it needs to be without self-loops and without simple cycles. You can
%transform the adjacency matrix of the graph into the adjacency matrix of a
%DAG by using the function createDAG of the Food Web Analysis Toolbox. 

%---INPUT---
%A = adjacency matrix of the directed graph. The rows should be the preys
%and the columns should be the predators.

%---OUTPUT---
%k = keystone index
%kbu = keystone index for bottom-up effects
%ktd = keystone index for top-down effects
%kdir = keystone index for directed effects
%kindir = keystone index for indirected effects

A(A > 0) = 1; %binary

n = length(A);
preys = sum(A); 
preys = preys.';
predators = sum(A,2);

prey_coefficients = preyCoefficients(A,preys,n);
vw = sum(prey_coefficients,2)*-1;
diagonal = diag(ones(n,1)*-1); 
prey_coefficients_updated = prey_coefficients+diagonal;
kbu = linsolve(prey_coefficients_updated,vw);

predator_coefficients = predatorCoefficients(A,predators,n);
vw = sum(predator_coefficients,2)*-1;
predator_coefficients_updated = predator_coefficients+diagonal;
ktd = linsolve(predator_coefficients_updated,vw);

for i = 1:n
    k(i) = kbu(i) + ktd(i);
end

kdir = sum(prey_coefficients,2);
kindir = kIndirect(prey_coefficients,kbu,n);

predator_coefficients_col = predatorCoefficientsCol(A,predators,n);
vw = sum(predator_coefficients_col);
for i = 1:n
    kdir(i) = kdir(i) + vw(i);
end

for i = 1:n
    for j = 1:n
        predator_coefficients_col(i,j) = ktd(i)*predator_coefficients_col(i,j);
    end
end
predator_coefficients_col_sum = sum(predator_coefficients_col);
for i = 1:n
    kindir(i) = kindir(i)+predator_coefficients_col_sum(i);
end

k = k';

end