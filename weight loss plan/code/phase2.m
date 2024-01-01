betaprime=0.033; % cal_out coefficient
wk=64.25; % weight in week 3
ck=10000; % cal_in since week 3
alpha=1/8000;
wn=50; % targeted weight in week 3+n
num=(wn-(alpha.*ck./betaprime))./(wk-(alpha.*ck./betaprime));
den=1-betaprime;
n=log(num)./log(den) % show n=23.1642
