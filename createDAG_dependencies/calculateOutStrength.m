function cycle_nodes_out_links  = calculateOutStrengthAndTP(A, cycle)

for node = 1:length(cycle)
    if node ~= length(cycle)
        cycle_nodes_out_links(node) = A((cycle(node)), (cycle(node+1)));
    else
        cycle_nodes_out_links(node) = A((cycle(node)), (cycle(1)));
    end
end

end