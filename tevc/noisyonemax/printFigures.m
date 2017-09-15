% print success rates
d=100;
T=100000;
opoFHT=load(sprintf('opoFHT_allR1-50_d%dT%d.mat',d,T));
opo=load(sprintf('opo_allR1-50_d%dT%d.mat',d,T));
rmhcFHT=load(sprintf('rmhcFHT_allR1-50_d%dT%d.mat',d,T));
rmhc=load(sprintf('rmhc_allR1-50_d%dT%d.mat',d,T));

hitting{4}=rmhc.outputOpt;
hitting{3}=rmhcFHT.outputOpt;
hitting{2}=opo.outputOpt;
hitting{1}=opoFHT.outputOpt;

gapT=100;
gapPrint=500;
totalT=T/gapT;
for idT=1:T/gapPrint
    t=idT*gapPrint/gapT;
    str=sprintf('%d', idT*gapPrint);
    for i=1:4
        tmp=hitting{i};
        tmp(:,t)
        [v,idx]=max(tmp(:,t));
        str=sprintf('%s & %.2f (%d) ', str, v/10, idx);
    end
    str=sprintf('%s \\\\', str);
    disp(str)
end
