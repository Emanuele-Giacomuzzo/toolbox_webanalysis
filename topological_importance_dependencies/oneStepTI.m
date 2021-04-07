function [TI] = oneStepTI(web)

n=length(web);
TI=zeros(n);

summed_web=sum(web);
for i=1:n
    for j=1:n
        TI(i,j)=web(i,j)/summed_web(j);
    end
end

end