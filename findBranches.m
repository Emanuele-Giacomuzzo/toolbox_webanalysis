function [branches] = findBranches(A,similarity,rege_similarity)

A = tounweighted(A);

if similarity == "jaccard"
    dissimilarity = pdist (A, 'jaccard');
elseif similarity == "rege"
    dissimilarity = transformRegeMatrix(rege_similarity);
end

best_linkage = chooseLinkageCriteria(dissimilarity);
branches = useLinkageWithBestCriteria(dissimilarity,best_linkage);

end