clear;
cd min3_rvalue
cd control
filer=dir;
d(251,251)=0;
for n=3:length(filer)
    data=textread(filer(n).name);
    data(:,252)=[];
    d=data+d;
end
d=d./72;
fid=fopen('ave3_con.txt','wt');
for i=1:251
    for j=1:251
        fprintf(fid,'%d ',d(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);
            
