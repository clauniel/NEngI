%% experiment 1

% large range plot
figure(1)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
dV = [-1:0.05:1];
dVx = [-0.3:0.02:0.3];
figure(1)
plot(dVx, i16x./max(i16x), '-k');
hold on
plot(dVx, i18x./max(i16x), '-k');
plot(dVx, (i16x+i18x)./max(i16x), '-.k');
plot(dVx, (i18x-i16x)./max(i16x), '--k');
hold off
%set(gca, 'YTickMode', 'manual');
set(gca, 'YTick', [0])
set(gca, 'XTick', [0])
ylim([-1.5,1.5])
xlim([-0.3,0.3])
xlabel('$\delta V$ / V', 'Interpreter', 'LaTeX')
ylabel('I / A', 'Interpreter', 'LaTeX')
title('Differential pair currents versus $\delta V$', 'Interpreter', 'LaTeX')
text(-0.25, -1.2, '$I_1-I_2$', 'Interpreter', 'LaTeX')
text(-0.2, 0.2, '$I_1$', 'Interpreter', 'LaTeX')
text(0.2, 0.2, '$I_2$', 'Interpreter', 'LaTeX')
text(-0.025, 1.2, '$I_2+I_2$', 'Interpreter', 'LaTeX')
grid on
saveas(gcf,'./figs/prelab2.eps','epsc')

%%
figure(2)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
r1 = 1;
r2 = 1;
It = 1;
x = -0.5:0.01:0.5;
y = (r1.*r2.*It.*(1+x).*(1-x))./(2.*(r1.*(1+x)+r2.*(1-x)))
plot(x,y, 'k')
r1 = 2;
y = (r1.*r2.*It.*(1+x).*(1-x))./(2.*(r1.*(1+x)+r2.*(1-x)))
hold on;
plot(x,y, '--k')
hold off
legend('r_1 = r_2', 'r_1 > r_2', 'Location', 'south')
set(gca, 'YTick', [0])
set(gca, 'XTick', [0])
xlabel('$x$', 'Interpreter', 'LaTeX')
ylabel('$I$ / A', 'Interpreter', 'LaTeX')
title('Current correlator current', 'Interpreter', 'LaTeX')
grid on
saveas(gcf,'./figs/prelab3.eps','epsc')