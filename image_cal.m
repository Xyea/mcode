clear;
spm_get_defaults  
global defaults
spm_jobman('initcfg');

cd /home/xieye/rest/ROI/ROI_Resliced
filename=dir;

for i=3:length(filename)
    cd /home/xieye/rest/ROI/ROI_Resliced
    f=strcat('mask_',filename(i).name)
    jobs{1}.spm.util.imcalc.input = cellstr(filename(i).name);
    jobs{1}.spm.util.imcalc.output = f;
    jobs{1}.spm.util.imcalc.outdir = {'/home/xieye/rest/ROI/mask/'};
    jobs{1}.spm.util.imcalc.expression = 'i1>0.01';
    jobs{1}.spm.util.imcalc.options.dmtx = 0;
    jobs{1}.spm.util.imcalc.options.mask = 0;
    jobs{1}.spm.util.imcalc.options.interp = 1;
    jobs{1}.spm.util.imcalc.options.dtype = 4;
    
    spm_jobman('run',jobs); 
    clear jobs;


end