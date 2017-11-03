clear;
load roi_use.txt
a=roi_use;
load Ci_fin_all.txt
b=Ci_fin_all;
c=zeros(251,6);
for i=1:251
    c(i,1)=a(i,2);
    c(i,2)=a(i,3);
    c(i,3)=a(i,4);
    c(i,4)=b(i,1);
    c(i,5)=1;
    c(i,6)=a(i,1);
end
save all_fin_lable.node c -ascii;
