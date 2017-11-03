clear;
ci=xlsread('dosenbach_ci.xlsx');
cd bin_abacus
file=dir;

for n=3:length(file)
    corstr=zeros(6);
    data=textread(file(n).name);
    data(:,161)=[];
    for i=1:160
        for j=1:160
            if data(i,j)~=0
                corstr(ci(i),ci(j))=corstr(ci(i),ci(j))+data(i,j);
            end
        end
    end
    cat=strcat('cs',file(n).name);
    fid=fopen(cat,'wt');
    for u=1:6
        for k=1:6
            fprintf(fid,'%d ',corstr(u,k));
        end
        fprintf(fid,'\n');
    end
    fclose(fid);
end

