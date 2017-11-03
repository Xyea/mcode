clear;
cd min_rvalue
cd control
load ave_con.txt
a=ave_con;
Qlmax=0.4;
bl(1,251)=0;
fid=fopen('Cimax_fin_con.txt','wt');
for i=1:200
    
    [Ci,Q]=modularity_finetune_und_sign(a);
    
    if Q>Qlmax
        Qlmax=Q;
        bl=Ci;
    end
end
for i=1:251
    fprintf(fid,'%d\n',bl(1,i));
end

fclose(fid);
            
        