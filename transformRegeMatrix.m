function [rege_dissimilarity_vector]=transformRegeMatrix(rege_similarity)
%The ouput of UCINET is a similarity matrix. However, the Matlab function
%linkage takes only dissimilarity matrix. This is why it needs to be
%converted into a dissimilarity matrix. First, however, we need to
%normalise the similarity matrix.

rege_similarity_normalised = rege_similarity/100;

rege_dissimilarity_matrix = 1 - rege_similarity_normalised;

rege_dissimilarity_vector = squareform(rege_dissimilarity_matrix);

end