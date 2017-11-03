%¶þÖµ»¯
clear;
cd control
cd pdvalue
file=dir;
for n=54:length(file)
    roi=zeros(160);
    rank=textread(file(n).name);
    for i=1:1670
        roi(rank(i,1),rank(i,2))=rank(i,3);
    end
    dude=strcat('b',file(n).name);
    fidr=fopen(dude,'wt');
    for u=1:160
        for k=1:160
            fprintf(fidr,'%d ',roi(u,k));
        end
        fprintf(fidr,'\n');
    end
    fclose(fidr);
end
