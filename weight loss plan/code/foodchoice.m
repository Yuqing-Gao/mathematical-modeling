clear;clc
load("H.mat");
load("P.mat");
load("E.mat");
Hstar=normalize(H,'range');
Pstar=normalize(P,'range');
C=[10480,10240,10000];
x=zeros(10,3);
%% linear weighting method
for i=1:3
    Aeq=E';
    beq=C(i)./7;
    A=[P';ones(1,10)];
    b=[30;10];
    f=0.3.*Pstar'-0.7.*Hstar';
    x(:,i)=linprog(f,A,b,Aeq,beq,zeros(10),8.*ones(1,10));
end