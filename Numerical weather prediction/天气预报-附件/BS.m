function [bs] = BS(predict,observed)
% dim predict == dim observed
n=length(predict);
sum=0;
for i = 1:n
    count = (predict(i)-observed(i)).^2;
    sum = sum+count;
end
bs = sum/n;
