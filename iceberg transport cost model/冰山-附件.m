clear;clc;
wg=[3,4,5];
Tw=[10,20];
V0=[1000000,5000000,10000000];
answer=zeros(3,3);
answerint=zeros(3,3);
Vprime=zeros(3,3);
fv0=0;
for i=1:3
    for j=1:3
        a=sqrt(V0(j)/120);
        t=400/wg(i);
        wl1=0.006*wg(i)*Tw(1);
        Vtau=(a-2*3*wl1*0.5*t)*(2*a-2*3*wl1*0.5*t)*(54-3*wl1*0.5*t);
        Vprime(i,j)=1.11*Vtau;
    fun=@(t)7.2*wg(i)*(wg(i)+6)*log10(Vprime(i,j))-1+0*t;
    answerint(i,j)=integral(fun,0,t);
    if V0(j)<500000
        fv0=4;
    elseif (500000<V0(j))&&(V0(j)<1000000)
        fv0=6.2;
    elseif V0(j)>1000000
        fv0=8;
    end
    answer(i,j)=(answerint(i,j)+fv0*t)/(0.85*Vprime(i,j));
    end
end
