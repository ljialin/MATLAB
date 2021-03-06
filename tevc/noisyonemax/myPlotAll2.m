% count and plot
opoFHT=load('opoFHT_r1-50_d100T100000.mat');
opo=load('opo_r1-50_d100T100000.mat');
rmhcFHT=load('rmhcFHT_r1-50_d100T100000.mat');
rmhc=load('rmhc_r1-50_d100T100000.mat');

hitting1=rmhc.outputOpt;
hitting2=rmhcFHT.outputOpt;
hitting3=opo.outputOpt;
hitting4=opoFHT.outputOpt;


figure

plot(hitting1/1000,'r-','LineWidth',2);
hold on

plot(hitting2/1000,'b-','LineWidth',2);
plot(hitting3/1000,'r:','LineWidth',2);
plot(hitting4/1000,'b:','LineWidth',2);


xlabel('Resampling rate','FontSize',14);
ylabel('Success rate (%)','FontSize',14);
legend({'RMHC, no FHT', 'RMHC, FHT', '(1+1)-EA, no FHT','(1+1)-EA, FHT'},'Box','off','Location','best')
%title('RMHC','FontSize',14);
title('Success rate versus sampling rate: Noisy OneMax d=100, T=100,000','FontSize',14);

set(gca,'FontSize',12);
%print('RMHC_findOpt','-dpng')
print('pix/findOpt_d100T100000All','-dpng')
