clear;
cd min_rvalue
cd abacus
filer=dir;

fidg=fopen('aba_glo.txt','wt');
fide=fopen('aba_loc.txt','wt');
fidi=fopen('aba_indloc.txt','wt');

indloc(251,90)=0;
for n=5:length(filer);
    ff=strcat('home/xieye/rest/network/min_rvalue/abacus/',filer(n).name);
    data=textread(ff);
    data(:,252)=[];
    eglo=efficiency_bin(data);
    eloc=efficiency_bin(data,1);
    fprintf(fidg,'%d\n',eglo);
    fprintf(fide,'%d\n',mean(eloc));
    
    indloc(:,n-4)=eloc;
end
d=indloc';
for i=1:90
    for j=1:251
        fprintf(fidi,'%d ',d(i,j));
    end
    fprintf(fidi,'\n');
end
fclose(fidg);
fclose(fide);
fclose(fidi);


    