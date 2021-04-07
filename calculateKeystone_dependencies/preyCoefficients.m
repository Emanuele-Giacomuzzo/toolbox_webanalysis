function [prey_coefficients] = preyCoefficients(web,preys,n)

prey_coefficients=zeros(n,n);

for i=1:n
    for j=1:n
        if web(i,j) ~= 0
            prey_coefficients(i,j)=web(i,j)*preys(j);
            prey_coefficients(i,j)=1/prey_coefficients(i,j);
        end
    end
end

end