function [cycle_nodes_out_links,cycle_nodes_TP_to_next] = calculateOutStrengthAndTP(A, cycle, cycle_nodes_TP)

for node = 1:length(cycle)
    if node ~= length(cycle)
        cycle_nodes_out_links(node) = A((cycle(node)), (cycle(node+1)));
        cycle_nodes_TP_to_next(node) = abs(cycle_nodes_TP(node) - cycle_nodes_TP(node+1));
    else
        cycle_nodes_out_links(node) = A((cycle(node)), (cycle(1)));
        cycle_nodes_TP_to_next(node) = abs(cycle_nodes_TP(node) - cycle_nodes_TP(1));
    end
end

end