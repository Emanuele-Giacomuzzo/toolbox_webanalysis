function [A_aggregated_weighted] = buildWeightedNetwork(A,membership,weight_method)

A_clustered_min = zeros(max(membership));
A_clustered_max = zeros(max(membership));
A_clustered_sum = zeros(max(membership));
A_clustered_mean = zeros(max(membership));
for clus_from = 1:max(membership)
    for clus_to = 1:max(membership)
        MIN = inf;
        MAX = 0;
        SUM = 0;
        COUNT = 0;
        for node_from = 1:length(A)
            for node_to = 1:length(A)
                if A(node_from,node_to) ~= 0 && membership(node_from) == clus_from && membership(node_to) == clus_to
                    if A(node_from,node_to) <= MIN; MIN = A(node_from,node_to); end
                    if A(node_from,node_to) >= MAX; MAX = A(node_from,node_to); end
                    SUM = SUM+A(node_from,node_to);
                    COUNT = COUNT+1;
                end
            end
        end
        if COUNT ~= 0
            A_clustered_min(clus_from,clus_to) = MIN;
            A_clustered_max(clus_from,clus_to) = MAX;
            A_clustered_sum(clus_from,clus_to) = SUM;
            A_clustered_mean(clus_from,clus_to) = SUM/COUNT; 
        end
    end
end
if weight_method == "min"; A_aggregated_weighted = A_clustered_min; end
if weight_method == "mean"; A_aggregated_weighted = A_clustered_mean; end
if weight_method == "max"; A_aggregated_weighted = A_clustered_max; end
if weight_method == "sum"; A_aggregated_weighted = A_clustered_sum; end

end