function A_aggregated = buildBinaryNetwork(realised_ratio,min_ratio)
%Min ratio is the minimum ratio to consider a link between two clusters. 

realised_ratio(realised_ratio >= min_ratio) = 1;
realised_ratio(realised_ratio < min_ratio) = 0;
A_aggregated = realised_ratio;

end