function DAG = createDAG(A)

%if the network had problems with the TP,  then we need to eliminate cycles
%until the network gives us a good answer. At that point we need to
%calculate TP and that's going to be our ultimate TP.

A = A - diag(diag(A));
TP = calculateTP(A);
TP_errors = sum(isinf(TP)) + sum(isnan(TP));

cycles = 1;
    
while isempty(cycles) == 0
    
    cycle_lengths = double.empty;
    cycle_TPs = cell(length(cycles), 1);
    cycle_TPs_to_next = cell(length(cycles), 1);
    cycle_out_links = cell(length(cycles), 1);
    
    cycles = findCycles(A);
    
    for cycle = 1:length(cycles)
        cycle_lengths(cycle) = length(cycles{cycle});
    end
    
    for cycle = 1:length(cycles)
        if cycle_lengths(cycle) == min(cycle_lengths)
            for node = 1:cycle_lengths(cycle)
                cycle_TPs{cycle}(node) = TP(cycles{cycle}(node));
            end
            [cycle_out_links{cycle}, cycle_TPs_to_next{cycle}] = calculateOutStrengthAndTP(A, cycles{cycle}, cycle_TPs{cycle});
            A = deleteCycle(A, TP, cycles{cycle}, cycle_TPs_to_next{cycle}, cycle_out_links{cycle}, TP_errors);
        end
    end
    
end

if isdag(digraph(A)) == 1
    DAG = A;
else
    msg('Error: the graph you produced is not a DAG.')
end

end