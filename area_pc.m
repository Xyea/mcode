clear;
load node_6.txt
a=node_6;
cd min_rvalue
cd abacus

load parcoe_6_aba.txt
b=parcoe_6_aba;
f(90,5)=0;
d=zeros(1,5);
for usenum=1:5
    for i=1:251
        if a(i,1)==usenum
            f(:,usenum)=f(:,usenum)+b(:,i);
            d(1,usenum)=d(1,usenum)+1;
        end
    end
    f(:,usenum)=f(:,usenum)./d(1,usenum);
end

fid=fopen('areanodepc_6_aba.txt','wt');
for i=1:90
    for j=1:5
        fprintf(fid,'%d ',f(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);