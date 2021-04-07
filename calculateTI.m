function TI = calculateTI(A, num_steps, weight)
%
%It calculates the topological importance (TI) described in 
%Jordán, F., Liu, W. C., & van Veen, J. F. (2003). Quantifying the importance of species and their interactions in a host-parasitoid community. Community Ecology, 4(1), 79-88.
%
%This function was originally coded by Wei-Chung Liu in R and then
%implemented in MATLAB by Emanuele Giacomuzzo.
%
%A = adjacency matrix of the directed graph. The rows should be the preys
%and the columns should be the predators.
%num_steps = nr of steps to be considered for the spread of the effect.
%For example, if we set num_steps = 3, then we consider only the effect
%reaching 3 species away.
%weight = whether you want to consider interaction strength or not. By
%default the function considers it. If you do not want to consider it you
%need to input "binary". 
%TI = vector containing the topological importance of the species inside
%the food web. 

A = toundirected(A); %undirected
if weight == "binary"
    A(A > 0) = 1; %binary
end

n=length(A);
TI=oneStepTI(A);
CI=ones(n);
CI=diag(diag(CI));
SI=zeros(n);

for i=1:num_steps
    CI=CI*TI;
    CI(isnan(CI))=0; %Nan appears if one of the species inside the web is not connected to the others.
    SI=SI+CI;
end

TI=sum(SI,2);
TI=TI/num_steps;

end