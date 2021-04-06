function [edge_list] = writeEdgeList(A,path)

edge_list = string.empty;
for prey = 1:length(A)
    for predator = 1:length(A)
        if A(prey,predator) ~= 0
            edge_list = [edge_list; "S"+addFrontZeros(prey) "S"+addFrontZeros(predator) A(prey,predator)];
        end
    end
end

edge_list = array2table(edge_list);
edge_list.Properties.VariableNames = {'Prey' 'Predator' 'Link'};
writetable(edge_list, path, 'Delimiter', ',');

end