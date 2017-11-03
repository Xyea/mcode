clear;

fid=fopen('NMI_mudule_correct.txt','wt');
load NMI_all.txt
node=NMI_all;
cd min_rvalue
file=dir;

for n=1:1000
    a=randperm(162,90);
    
    aba=zeros(251,251);
    con=zeros(251,251);
    aas=zeros(251,251);
    acs=zeros(251,251);
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
    for i=1:251
        for j=1:251
            aas(i,j)=aa(node(i),node(j));
            acs(i,j)=ac(node(i),node(j));
        end
    end
    
    
    smaa=zeros(20,20);
    smac=zeros(20,20);

    fpcna=zeros(19,19);
    fpcnc=zeros(19,19);

    cona=zeros(53,53);
    conc=zeros(53,53);

    dmna=zeros(79,79);
    dmnc=zeros(79,79);

    visc=zeros(39,39);
    visa=zeros(39,39);

    for i=1:20
       for j=1:20
           smaa(i,j)=aas(i,j);
           smac(i,j)=acs(i,j);
       end
    end
    for i=21:39
       for j=21:39
           fpcna(i-20,j-20)=aas(i,j);
           fpcnc(i-20,j-20)=acs(i,j);
       end
    end
    for i=40:92
        for j=40:92
            cona(i-39,j-39)=aas(i,j);
            conc(i-39,j-39)=acs(i,j);
        end
    end
    for i=93:171
        for j=93:171
            dmna(i-92,j-92)=aas(i,j);
            dmnc(i-92,j-92)=acs(i,j);
        end
    end
    for i=172:210
        for j=172:210
            visa(i-171,j-171)=aas(i,j);
            visc(i-171,j-171)=acs(i,j);
        end
    end

    [vin1,nmisma]=partition_distance(smaa,smac);
    [vin2,nmifpcn]=partition_distance(fpcna,fpcnc);
    [vin3,nmicon]=partition_distance(cona,conc);
    [vin4,nmidmn]=partition_distance(dmna,dmnc);
    [vin5,nmivis]=partition_distance(visa,visc);
    
    fprintf(fid,'%d %d %d %d %d\n',nmisma,nmifpcn,nmicon,nmidmn,nmivis);
   
end
fclose(fid);
