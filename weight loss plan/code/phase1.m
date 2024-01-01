beta=0.024; % metabolic coefficient
wk=65; % weight in week 0
ck=14000; % cal_in in week 0
k=0; % week counter
alpha=1/8000;
while ck>10000
    %ck=((beta.*wk)-0.25)*8000;
    ck=(beta./alpha).*wk-(1/alpha).*(0.25+beta.*k);
    ck % show ck in week k
    wk=wk-0.25;
    k=k+1;
end
k % show k=3
