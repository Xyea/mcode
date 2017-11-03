%use for generate the 20X40 digit matrix for digit cancellation test in
%which subject is asked to cancel the even digit between 3 and 7
clear;
clc;
celling=randperm(800);
z=zeros(1,800);
seq=ceil((9-1)*rand(1,630));
x=randperm(85);
for i=1:630
    if seq(i)==3
        seq(i)=9;
    end
end
for n=1:170
    z(celling(n))=3;
end
for n=171:800
    z(celling(n))=seq(n-170);
end
for n=1:85
    z(celling(x(n))+2)=7;
end
k=0;
for n=1:798
    if z(n)==3&&z(n+2)==7&&rem(z(n+1),2)==0
        k=k+1;
    end
end
k              %make sure the number of traget digits


