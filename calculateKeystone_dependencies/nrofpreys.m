function[nr_of_preys]=nrofpreys(adj_loopless)

nr_of_preys=zeros(length(adj_loopless),1);

for i=1:length(adj_loopless)
    for j=1:length(adj_loopless)
        if adj_loopless(i,j)>0
            nr_of_preys(j)=nr_of_preys(j)+1;
        end
    end
end

end