function branches = useLinkageWithBestCriteria(dissimilarity,best_linkage)

if best_linkage=="single" branches = linkage(dissimilarity, 'single'); end
if best_linkage=="complete" branches = linkage(dissimilarity, 'complete'); end
if best_linkage=="average" branches = linkage(dissimilarity, 'average'); end
if best_linkage=="weighted" branches = linkage(dissimilarity, 'weighted'); end
if best_linkage=="centroid" branches = linkage(dissimilarity, 'centroid'); end
if best_linkage=="median" branches = linkage(dissimilarity, 'median'); end
if best_linkage=="ward" branches = linkage(dissimilarity, 'ward'); end

end