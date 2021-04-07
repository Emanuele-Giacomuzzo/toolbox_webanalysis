function [A] = deleteCycle(A, TP, cycle, cycle_nodes_TP_node_to_next, cycle_nodes_out_links, TP_errors)

if TP_errors == 0 && max(cycle_nodes_TP_node_to_next) > 0.2*max(TP)
    
    [~, max_index] = max(cycle_nodes_TP_node_to_next);
    node_from = cycle(max_index);
    if max_index ~= length(cycle)
        node_to = cycle(max_index + 1);
    else
        node_to = cycle(1);
    end
    
    A(node_from, node_to) = 0;

else
    
    [~, min_index] = min(cycle_nodes_out_links);
    node_from = cycle(min_index);
    if min_index ~= length(cycle)
        node_to = cycle(min_index + 1);
    else
        node_to = cycle(1);
    end
    
    A(node_from,  node_to) = 0;
    
end

end