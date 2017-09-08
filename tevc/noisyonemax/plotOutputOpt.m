opoFHT=load('opoFHT_d100T100000.mat');
opo=load('opo_d100T100000.mat');
rmhcFHT=load('rmhcFHT_d100T100000.mat');
rmhc=load('rmhc_d100T100000.mat');

for idXToPlot=1:length(R)
r=R(idXToPlot);
% count and plot


figure
plot([1:T/gapT]*gapT,opoFHT.outputOpt(idXToPlot,:),'b-','LineWidth',1)
hold on
plot([1:T/gapT]*gapT,opo.outputOpt(idXToPlot,:),'r-','LineWidth',1)
plot([1:T/gapT]*gapT,rmhcFHT.outputOpt(idXToPlot,:),'b:','LineWidth',1)
plot([1:T/gapT]*gapT,rmhc.outputOpt(idXToPlot,:),'r:','LineWidth',1)

xlabel('Evaluation number','FontSize',14);
ylabel('Optimum is returned (%)','FontSize',14);
legend({'(1+1)-EA FHT','(1+1)-EA','RMHC FHT','RMHC'},'Box','off','Location','best')
title(sprintf('Noisy OneMax d=100, r=%d',r),'FontSize',14);
set(gca,'FontSize',12);
print(sprintf('pix/outputOpt_d100r%d',r),'-dpng')


figure
tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=mean(opoFHT.quality(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'b-','LineWidth',1)

hold on
tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=mean(opo.quality(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'r-','LineWidth',1)

tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=mean(rmhcFHT.quality(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'b:','LineWidth',1)

tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=mean(rmhc.quality(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'r:','LineWidth',1)
legend({'(1+1)-EA FHT','(1+1)-EA','RMHC FHT','RMHC'},'Box','off','Location','best')


xlabel('Evaluation number','FontSize',14);
ylabel('Quality of output solution','FontSize',14);
title(sprintf('Noisy OneMax d=100, r=%d',r),'FontSize',14);
set(gca,'FontSize',12);
print(sprintf('pix/quality_d100r%d',r),'-dpng')


figure
tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=sum(opoFHT.visitedOpt(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'b-','LineWidth',1)
hold on
tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=sum(opo.visitedOpt(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'r-','LineWidth',1)

tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=sum(rmhcFHT.visitedOpt(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'b:','LineWidth',1)

tmp=zeros(1,T/gapT);
for idxT=1:T/gapT
    tmp(idxT)=sum(rmhc.visitedOpt(idXToPlot,idxT,:));
end
plot([1:T/gapT]*gapT,tmp,'r:','LineWidth',1)
legend({'(1+1)-EA FHT','(1+1)-EA','RMHC FHT','RMHC'},'Box','off','Location','best')

xlabel('Evaluation number','FontSize',14);
ylabel('Optimum has been visited (%)','FontSize',14);
title(sprintf('Noisy OneMax d=100, r=%d',r),'FontSize',14);
set(gca,'FontSize',12);
print(sprintf('pix/visitedOpt_d100r%d',r),'-dpng')

end