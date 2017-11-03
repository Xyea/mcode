clear;
load distance.txt
a=distance;
cd rvalue;
file=dir;
for n=3:length(file)
    data=textread(file(n).name);
    ff=strcat('d',file(n).name);
    fid=fopen(ff,'wt');
    for i=1:524
        f=a(i,1);
        g=a(i,2);
        data(f,g)=0;
        data(g,f)=0;
    end
    for i=1:251
        data(i,i)=0;
        for j=1:251
            fprintf(fid,'%d ',data(i,j));
        end
        fprintf(fid,'\n');
    end
    fclose(fid);  
end
