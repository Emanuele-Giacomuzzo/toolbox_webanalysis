function igraph_edgelist = writeIgraphEdgelist(A)
%It writes an edgelist tha can be used in igraph in R.
%
%A = adjacency matrix of the food web.

igraph_edgelist=double.empty;
for node_from=1:length(A)
    for node_to=1:length(A)
        if A(node_from,node_to) ~= 0
            igraph_edgelist = [igraph_edgelist; node_from node_to A(node_from,node_to)];
        end
    end
end

igraph_edgelist = array2table(igraph_edgelist);
writetable(igraph_edgelist,'igraph_edgelist.txt','Delimiter',',','WriteVariableNames',false);

end