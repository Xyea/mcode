pvalue=zeros(6,6);
hvalue=zeros(6,6);
amc=zeros(1,40);
con=zeros(1,50);
for u=1:6
    for v=1:6
        for num1=1:40
            amc(num1)=data1(u,v,num1);
        end
        for num2=1:50
            con(num2)=data2(u,v,num2);
        end
        [h,p]=ttest2(amc,con);
        pvalue(u,v)=p;
        hvalue(u,v)=h;
    end
end
fidp=fopen('test_p.txt','wt');
fidh=fopen('test_h.txt','wt');
for i=1:6
    for j=1:6
        fprintf(fidp,'%d ',pvalue(i,j));
        fprintf(fidh,'%d ',hvalue(i,j));
    end
    fprintf(fidp,'\n');
    fprintf(fidh,'\n');
end
fclose(fidp);
fclose(fidh);