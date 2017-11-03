clear;
load NMIall_ave_aba.txt
a=NMIall_ave_aba;
load NMIall_ave_con.txt
b=NMIall_ave_con;

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
        smaa(i,j)=a(i,j);
        smac(i,j)=b(i,j);
    end
end
for i=21:39
    for j=21:39
        fpcna(i-20,j-20)=a(i,j);
        fpcnc(i-20,j-20)=b(i,j);
    end
end
for i=40:92
    for j=40:92
        cona(i-39,j-39)=a(i,j);
        conc(i-39,j-39)=b(i,j);
    end
end
for i=93:171
    for j=93:171
        dmna(i-92,j-92)=a(i,j);
        dmnc(i-92,j-92)=b(i,j);
    end
end
for i=172:210
    for j=172:210
        visa(i-171,j-171)=a(i,j);
        visc(i-171,j-171)=b(i,j);
    end
end

[vin1,nmisma]=partition_distance(smaa,smac);
[vin2,nmifpcn]=partition_distance(fpcna,fpcnc);
[vin3,nmicon]=partition_distance(cona,conc);
[vin4,nmidmn]=partition_distance(dmna,dmnc);
[vin5,nmivis]=partition_distance(visa,visc);