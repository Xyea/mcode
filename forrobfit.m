fid=fopen('rob_aba.txt','wt');
for i=1:12720
    [b,stat]=robustfit(all(:,i),mathz);
    fprintf(fid,'%d %d\n',b(2,1),stat.p(2,1));
end
fclose(fid);