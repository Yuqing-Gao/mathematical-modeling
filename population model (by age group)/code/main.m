clc;
load("deathrate.mat");
deathrate=deathrate./sum(deathrate); % deathmode
% sum(deathrate)
count=1;
deathrate_perage=zeros(1,100);
for i=1:100
    deathrate_perage(i)=deathrate(count)./5;
    if mod(i,5)~=0
        continue
    else
        count=count+1;
    end
end
% sum(deathrate_perage)
D=diag(deathrate_perage(1:99),-1);
D(100,100)=D(100,99);
C=diag(ones([1,99]),-1);
C(100,100)=1;
% alpha=?; % total death rate
% S=C-alpha.*D; % survival matrix

% total fertility rate
beta=ones(1,21)./2;
for i=1:20
    beta(i+1)=beta(i)+0.05;
end
load("childbearingage.mat");
y=mean(childbearingage(:,2:6),2);
h=y/sum(y); % bearing mode
B=zeros(100,100); % bearing matrix
for i=15:49
    B(1,i)=h(i-14);
end
result=zeros(40,21);
load("population.mat");

figure(1)
subplot(2,2,1)
popstructure(population);
title('2010 year')

x1=sum(population);
for i=1:21
    population2=population;
    alpha=0.614*5+exp(beta(i)); % total death rate
    for j=1:50 % 2010-2060 year
        population2=(C-alpha.*D)*population2+beta(i)*B*population2;
        result(j,i)=sum(population2);
    end

    switch(i)
        case(1)
            figure(1)
            subplot(2,2,2)
            popstructure(population2);
            title('\beta=1, 2060 year')
        case(10)
            figure(1)
            subplot(2,2,3)
            popstructure(population2);
            title('\beta=2, 2060 year')
        case(21)
            figure(1)
            subplot(2,2,4)
            popstructure(population2);
            title('\beta=3, 2060 year')
    end
end
start_pop=x1.*ones(1,21);

figure(2)
hold on
xlabel('total fertility rate\beta')
ylabel('population')
plot(1:0.1:3,result(50,:),'b-o')
plot(1:0.1:3,start_pop,'--')
text(1.2,6.7e8,'\downarrow women population in 2020')
text(2,6.3e8,'\uparrow \beta=2, population=6.58\times10^{8}')
hold off
