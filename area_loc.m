clear;
load Ci_fin_aba.txt
a=Ci_fin_aba;
cd min_rvalue
cd abacus

load aba_indloc.txt
b=aba_indloc;
f(90,5)=0;
d1=0;
d2=0;
d3=0;
d4=0;
d5=0;
for i=1:251
    if a(i,1)==9
        f(:,1)=f(:,1)+b(:,i);
        d1=d1+1;
    end
end
f(:,1)=f(:,1)./d1;
for i=1:251
    if a(i,1)==6
        f(:,2)=f(:,2)+b(:,i);
        d2=d2+1;
    end  
end
f(:,2)=f(:,2)./d2; 
for i=1:251
    if a(i,1)==4
        f(:,3)=f(:,3)+b(:,i);
        d3=d3+1;
    end   
end
f(:,3)=f(:,3)./d3;
for i=1:251
    if a(i,1)==5
        f(:,4)=f(:,4)+b(:,i);
        d4=d4+1;
    end    
end
f(:,4)=f(:,4)./d4;
for i=1:251
    if a(i,1)==8
        f(:,5)=f(:,5)+b(:,1);
        d5=d5+1;
    end    
end
f(:,5)=f(:,5)./d5;
fid=fopen('areale_aba.txt','wt');
for i=1:90
    for j=1:5
        fprintf(fid,'%d ',f(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);
       

        