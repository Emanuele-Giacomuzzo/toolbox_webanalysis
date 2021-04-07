function [predator_coefficients] = predatorCoefficients(web,predators,n)

predator_coefficients=zeros(n,n);

for i=1:n
    for j=1:n
        predator_coefficients(i,j)=predators(j)*web(j,i);
        if predator_coefficients(i,j) ~= 0
            predator_coefficients(i,j)=1/predator_coefficients(i,j);
        end
    end
end

end