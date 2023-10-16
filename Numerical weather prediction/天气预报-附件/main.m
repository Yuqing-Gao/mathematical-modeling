load("data.mat");
pre1 = data(:,1);
pre2 = data(:,2);
pre3 = data(:,3);
pre4 = data(:,4);
observed = data(:,5);

% plot reliablity diagram of prex
% pre4 as an example
plotreliability(observed,pre4);

result_of_bs=zeros(1,4);
result_of_bss=zeros(1,4);

result_of_bs(1)=BS(pre1,observed);
result_of_bs(2)=BS(pre2,observed);
result_of_bs(3)=BS(pre3,observed);
result_of_bs(4)=BS(pre4,observed);

result_of_bss(1)=BSS(pre1,observed);
result_of_bss(2)=BSS(pre2,observed);
result_of_bss(3)=BSS(pre3,observed);
result_of_bss(4)=BSS(pre4,observed);