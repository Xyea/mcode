clear;
load NMI_all.txt
node=NMI_all;
fid=fopen('NMI_210.txt','wt');
cd min_rvalue
file=dir;

for n=1:1000
    a=randperm(162,90);
    
    aba=zeros(251,251);
    con=zeros(251,251);
    aas=zeros(210,210);
    acs=zeros(210,210);
    u=0;
    v=0;   
  
    for m=6:167
        data=textread(file(m).name);
        data(:,252)=[];
        j=0;
        for i=1:90
            if a(i)==m-5
                j=1;
            end
        end
        if j==1
            aba=data+aba;
            u=u+1;
        else
            con=data+con;
            v=v+1;
        end
    end
    
    aa=aba./u;
    ac=con./v;
    for i=1:210
        for j=1:210
            aas(i,j)=aa(node(i),node(j));
            acs(i,j)=ac(node(i),node(j));
        end
    end
    
    [VIN,NMI]=partition_distance(aas,acs);
    fprintf(fid,'%d\n',NMI);
   
end
fclose(fid);
