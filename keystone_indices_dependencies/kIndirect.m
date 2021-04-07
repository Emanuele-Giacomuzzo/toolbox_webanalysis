function [kindir] = kIndirect(prey_coefficients,kbu,n)

for i=1:n
    for j=1:n
        prey_coefficients(i,j)=prey_coefficients(i,j)*kbu(j);
    end
end

kindir=sum(prey_coefficients,2);

end