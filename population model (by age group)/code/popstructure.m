function [structure] = popstructure(population)
% input: population with age of 0-99
% output: population in 0-14, 15-49, 50-64, 65-99
structure=zeros(1,4);
structure(1)=sum(population(1:15));
structure(2)=sum(population(16:50));
structure(3)=sum(population(51:65));
structure(4)=sum(population(66:100));
bar(structure);
set(gca,'xticklabel',{'0-14','15-49','50-64','65-99'});
end

