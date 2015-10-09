R = 0:0.01:1;
h1 = plot(R, 1./R)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 4]);
set(h1, 'linewidth',1)
set(gca,'Fontsize',6)
set(gca, 'YTickMode', 'manual');
set(gca, 'YTick', [0]);
set(gca, 'XTick', [0]);
title('$I_R$ as $R\rightarrow \infty$ for constant V', 'Interpreter', 'LaTeX')
ylabel('$I_R$/A', 'Interpreter', 'LaTeX')
xlabel('R/$\Omega$', 'Interpreter', 'LaTeX')
saveas(gcf,'./figs/prelab-1-1-2-1.eps','epsc')
%%
h1 = plot(R, 1*R)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 4]);
set(h1, 'linewidth',1)
set(gca,'Fontsize',6)
title('$V_R$ as $R\rightarrow \infty$ for constant I', 'Interpreter', 'LaTeX')
ylabel('$V_R$/A', 'Interpreter', 'LaTeX')
xlabel('R/$\Omega$', 'Interpreter', 'LaTeX')
set(gca, 'YTickMode', 'manual');
set(gca, 'YTick', [0]);
set(gca, 'XTick', [0]);
saveas(gcf,'./figs/prelab-1-1-2-2.eps','epsc')