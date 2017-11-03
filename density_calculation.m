clear;

cd control
cd pdvalue
fidfull=fopen('full.txt','wt');
file=dir;
for filenum=4:length(file)
    data=textread(file(filenum).name);
    data(:,161)=[];
    rank=zeros(160*159/2,4);
    m=1;
    for i=1:159
        for j=i+1:160
            rank(m,1)=i;
            rank(m,2)=j;
            rank(m,3)=data(i,j);
            m=m+1;
        end
    end
    for k=1:m-1
        n=0;
        for h=1:m-1
            if rank(k,3)>=rank(h,3)&&rank(k,3)~=0
                n=n+1;
            end
        end
        rank(k,4)=n;
    end
    sortrank=-sortrows(-rank,4);
    roi=strcat('rank_',file(filenum).name);
    fidroi=fopen(roi,'wt');
    for i=1:160*159/2
        fprintf(fidroi,'%d %d %d %d\n',sortrank(i,:));
    end
    fclose(fidroi);
    
    seq=zeros(160,1);
    for ano=1:m-1
        seq(sortrank(ano,1))=1+seq(sortrank(ano,1));
        seq(sortrank(ano,2))=1+seq(sortrank(ano,2));
        no=0;
        for iu=1:160
            if seq(iu)==0
                no=no+1;
            end
        end
        if no==0
            fprintf(fidfull,'%d\n',ano);
            break;
        end
    end
end        
fclose(fidfull);
