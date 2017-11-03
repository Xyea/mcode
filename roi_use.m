clear;
load roi_origin.txt
a=roi_origin;
load mmc.txt
b=mmc;
fid=fopen('roi_use.txt','wt');
for i=1:264
    for j=1:252
        if b(i,1)==a(j,2)
            fprintf(fid,'%d %d %d %d\n',b(i,1),b(i,2),b(i,3),b(i,4));
        end
    end
end
