function A = deleteCycle(A, cycle, cycle_nodes_out_links)

[~, min_index] = min(cycle_nodes_out_links);

if min_index == length(cycle)
    A(cycle(min_index),  cycle(1)) = 0;
else
    A(cycle(min_index),  cycle(min_index + 1)) = 0;
end


end