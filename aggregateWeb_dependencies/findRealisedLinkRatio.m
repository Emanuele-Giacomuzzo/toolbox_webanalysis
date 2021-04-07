function [realised_ratio] = realisedLinksRatio(possible_links,realised_links)

realised_ratio = zeros(length(possible_links));
for clust_from = 1:length(possible_links)
    for clust_to = 1:length(possible_links)
        realised_ratio(clust_from,clust_to) = realised_links(clust_from,clust_to)/possible_links(clust_from,clust_to);
    end
end

end