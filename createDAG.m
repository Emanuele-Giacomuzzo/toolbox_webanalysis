function DAG = createDAG(A)
%It creates a directed acyclic graph from one with simple cycles. 
%
%A = adjacency maxtrix of the directed graph. 
%DAG = adjacency matrix of the DAG.

A = A - diag(diag(A));

cycles = 1;
while isempty(cycles) == 0
    
    cycle_lengths = double.empty;
    cycle_out_links = cell(length(cycles), 1);
    
    cycles = findCycles(A);
    
    for cycle = 1:length(cycles)
        cycle_lengths(cycle) = length(cycles{cycle});
    end
    
    for cycle = 1:length(cycles)
        if cycle_lengths(cycle) == min(cycle_lengths)
            cycle_out_links{cycle} = calculateOutStrength(A, cycles{cycle});
            A = deleteCycle(A, cycles{cycle}, cycle_out_links{cycle});
        end
    end
    
end

if isdag(digraph(A)) == 1
    DAG = A;
else
    msg('Error: the graph you produced is not a DAG.')
end

end