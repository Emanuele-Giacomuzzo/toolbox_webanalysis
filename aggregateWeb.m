function A_aggregated = aggregateWeb(A, membership, linkage_method, strength_method)
%This function aggregates the nodes of a food web according to the linkage
%method and the strength method you set.
%A = adjacency matrix of the original food web 
%A_aggregated = adjacency matrix of the aggregated food web 
%membership = vector containing the cluster membership of each node. For 
%example, if I have five nodes and the first two belong to the first 
%cluster and the third, fourth and fifth belong to the second cluster, 
%I should have membership = 1 1 2 2 2.
%linkage_method = minimum ratio of realised links/possible links to 
%consider a connection between two clusters. For example, linkage_method =
%0.1, it means that 10% of the possible links between the nodes of cluster 
%A to cluster B need to be realised for us to consider a connection from A
%to B. 
%strength_method = it can be set as "min", "mean", "max", or "sum". It is
%the weight of the links in the newly created food web. With min the
%interaction strength from cluster A to cluster B  is the minimum
%interaction strength going from the nodes of A to the nodes of B. With max
%it is the maximum. With mean it is the mean. With sum it is the sum. 

cluster_size = findClusterSize(membership);
possible_links = findPossibleLinks(cluster_size);
realised_links = findRealisedLinks(A, membership);
realised_link_ratio = findRealisedLinkRatio(possible_links, realised_links);

A_aggregated_weighted = buildWeightedNetwork(A, membership, strength_method);
A_aggregated_binary = buildBinaryNetwork(realised_link_ratio, linkage_method);
A_aggregated = A_aggregated_weighted .* A_aggregated_binary;

end