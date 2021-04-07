function[cluster_size]=clusterSize(membership)

cluster_size = zeros(max(membership),1);
for node = 1:length(membership)
    cluster = membership(node);
    cluster_size(cluster) = cluster_size(cluster)+1;
end

end