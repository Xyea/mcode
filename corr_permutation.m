clear;
cd con;
file=dir;
for run=1:1000
    digit=run
    fid=fopen(['conrandcor_',num2str(run),'.txt'],'wt');
    
    all=zeros(251,251);
    a=randperm(175);
    b=randperm(7);
    for n=3:length(file)
   
        data=textread(file(n).name);
        data(:,252)=[];
        for i=1:251
            for k=1:175
                redata(k,i)=data(a(k),i);
            end
        end
        for i=1:251
            for k=1:7
                for u=1:25
                    blcdata((k-1)*25+u,i)=redata((b(k)-1)*25+u,i);
                end
            end
        end
      
        all=all+corr(blcdata);
    end
    ave=all./72;
    for i=1:251
        for j=1:251
            fprintf(fid,'%d ',ave(i,j));
        end
        fprintf(fid,'\n');
    end
end


            