function[realised_connections] = realisedLinks(A, membership)

realised_connections = zeros(max(membership));
for clus_from = 1:length(realised_connections)
    for clus_to = 1:length(realised_connections)
        for node_from = 1:length(A)
            for node_to = 1:length(A)
                if membership(node_from) == clus_from && membership(node_to) == clus_to && A(node_from,node_to) ~=0
                    realised_connections(clus_from,clus_to) = realised_connections(clus_from,clus_to) + 1;
                end
            end
        end
    end
end

end