% the phase 2 is taken as an example
% betaprime is increased from 0.033 to 0.044, with length step of 0.001
betaprime=0.033:0.001:0.044; % cal_out coefficient
wk=64.25; % weight in week 3
ck=10000; % cal_in since week 3
k=4; % week counter beginning with k=3
alpha=1/8000;
wn=50; % targeted weight in week 3+n
n=zeros(1,12);
for i=1:12
    num=(wn-(alpha.*ck./betaprime(i)))./(wk-(alpha.*ck./betaprime(i)));
    den=1-betaprime(i);
    n(i)=log(num)./log(den);
end
plot(betaprime,n)
xlabel('the value of \beta^{\prime}')
ylabel('weeks required for the phase 2')
