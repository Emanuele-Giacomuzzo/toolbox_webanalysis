function[possible_connections] = possibleLinks(cluster_size)

possible_connections = zeros(length(cluster_size));
for clus_from = 1:length(cluster_size)
    for clus_to = 1:length(cluster_size)
        possible_connections(clus_from,clus_to) = cluster_size(clus_from) * cluster_size(clus_to);
    end
end

end