function [bss] = BSS(predict,observed)
% dim predict == dim observed
obar=mean(observed,"all");
bsref=obar*(1-obar);
bss=1-(BS(predict,observed)./bsref);
end

