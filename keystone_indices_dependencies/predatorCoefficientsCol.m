function [predator_coefficients_col] = predatorCoefficientsCol(web,predators,n)

predator_coefficients_col=zeros(n);

for i=1:n
    for j=1:n
        predator_coefficients_col(i,j)=predators(i)*web(i,j);
        if predator_coefficients_col(i,j) ~= 0
            predator_coefficients_col(i,j)=1/predator_coefficients_col(i,j);
    end
end

end