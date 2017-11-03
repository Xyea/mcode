clear;
load roi_use.txt
a=roi_use;
fid=fopen('distance.txt','wt');
for i=1:250
    for j=i+1:251
        x1=a(i,2);
        y1=a(i,3);
        z1=a(i,4);
        x2=a(j,2);
        y2=a(j,3);
        z2=a(j,4);
        d=sqrt((x1-x2)^2+(y1-y2)^2+(z1-z2)^2);
        if d<=20
            fprintf(fid,'%d %d\n',i,j);
        end
    end
end
fclose(fid);