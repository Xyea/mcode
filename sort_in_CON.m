clear;
load node_ci.txt
ci=node_ci(:,5);
position=zeros(53);
x=1;
for i=1:251
    if ci(i)==66
        position(x)=i;
        x=x+1;
    end
end
cd rvaluedeal
cd rvalue
cd aba
file=dir;
rvalue=zeros(90,1378);
for n=3:length(file)
    data=textread(file(n).name);
    data(:,252)=[];
    d=0;
    for u=1:52
        for v=1:53-u
            d=d+1;
            rvalue(n-2,d)=data(position(u),position(v));
        end
    end
end
fid=fopen('aba_conrvalue.txt','wt');
for i=1:90
    for j=1:1378
        fprintf(fid,'%d ',rvalue);
    end
    fprintf(fid,'\n');
end

        
        
