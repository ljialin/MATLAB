% count and plot

figure

plot(hitting1/100,'ro-','LineWidth',2);
hold on

plot(hitting2/100,'r+:','LineWidth',2);
plot(hitting3/100,'bo-','LineWidth',2);
plot(hitting4/100,'b+:','LineWidth',2);


xlabel('Resampling number','FontSize',14);
ylabel('Optimum found (%)','FontSize',14);
legend('RMHC', 'RMHC,FHT', '(1+1)-EA','(1+1)-EA,FHT')
%title('RMHC','FontSize',14);
title('T=500 fitness evaluations','FontSize',14);

set(gca,'FontSize',12);
%print('RMHC_findOpt','-dpng')
print('pix/findOpt_T500d10All','-dpng')