% let the coefficient of W(k) in bmr model change from 0% to 33%
gammat=72; % gammat refers to calorie consumption per kilo through sports
calin=10000; % cal_in since week 3
alpha=1/8000;
ncounter=zeros(1,12);
bmr=zeros(12,25);
for i=1:12
    wk=64.25; % weight in week 3
    j=0;
    n=0;
    while wk>50
        j=j+1;
        bmr(i,j)=868.3927+(1+0.003.*(i-1)).*9.5634.*wk; % Basal Metabolic Rate
        calout=7.*bmr(i,j)+72.*wk; % cal_out
        wk=wk+alpha.*(calin-calout);
        n=n+1;
    end
    ncounter(i)=n;
end
plot(1.00:0.03:1.33,ncounter)
xlabel('changes in the coefficient of W(k)')
ylabel('weeks required for the phase 2')