load lab6data
%%
figure(1)
clf(1)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(t1,wf1,'b')
hold on
plot(t2, wf2, 'r');
hold off
legend({'V_{i14} > V_{i13}','V_{i13} > V_{i14}'}, 'Location', 'northwest')
xlabel('t / s', 'Interpreter', 'LaTeX')
ylabel('V / V', 'Interpreter', 'LaTeX')
title('WTA competition between cell 13 and 14', 'Interpreter', 'latex')
saveas(gcf,'./figs/ex1','epsc')
%%
figure(2)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(V1,-I1, '-xk')
hold on
plot(V2,-I2, '--ok')
hold off
legend({'$-\Delta V \rightarrow +\Delta V$', '$+\Delta V \rightarrow -\Delta V$'}, 'Interpreter', 'latex', 'Location', 'northwest')
xlabel('$\Delta V$ / V', 'Interpreter', 'LaTeX')
ylabel('I / A', 'Interpreter', 'LaTeX')
ylim([-0.5e-6, 3.5e-6])
title('HWTA cell 13 hysteresis, $V_{gain}=5$ V, $V_b = 0.85$ V', 'Interpreter', 'latex')
saveas(gcf,'./figs/ex2-1','epsc')

%%
figure(3)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(V12,-I12, '-xk')
hold on
plot(V22,-I22, '--ok')
hold off
legend({'$-\Delta V \rightarrow +\Delta V$', '$+\Delta V \rightarrow -\Delta V$'}, 'Interpreter', 'latex', 'Position',[0.39,0.45,0.25,0.1])
xlabel('$\Delta V$ / V', 'Interpreter', 'LaTeX')
ylabel('I / A', 'Interpreter', 'LaTeX')
ylim([-0.5e-6, 3.5e-6])
title('HWTA cell 13 hysteresis, $V_{gain}=4.5$ V, $V_b = 0.85$ V', 'Interpreter', 'latex')
saveas(gcf,'./figs/ex2-2','epsc')
%%
figure(4)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
V11x = [V11(1:8), Vx, V11(14:end)];
I11x = [I11(1:8)', Ix', I11(14:end)'];
V21x = [V21(1:8), flip(Vx), V21(14:end)];
I21x = [I21(1:8)', flip(Ix'), I21(14:end)'];
plot(V11x,-I11x, '-xk')
hold on
plot(V22x,-I21x, '--ok')
hold off
xlabel('$\Delta V$ / V', 'Interpreter', 'LaTeX')
ylabel('I / A', 'Interpreter', 'LaTeX')
ylim([-0.5e-6, 3.5e-6])
title('HWTA cell 13 no hysteresis, $V_{gain}=4.0$ V, $V_b = 0.85$ V', 'Interpreter', 'latex')
index = find(Vx <= 0.001 & Vx >= -0.09)
fitg = fit(Vx(index)', -Ix(index), 'poly1')
hold on
plot(V22x, fitg.p1.*V22x+fitg.p2, '-.k')
hold off
legend({'$-\Delta V \rightarrow +\Delta V$', '$+\Delta V \rightarrow -\Delta V$', '$3.265\cdot10^{-4}\cdot \frac{\Delta V}{V} + 2.971\cdot10^{-6}$'}, 'Interpreter', 'latex', 'Location', 'southeast')

saveas(gcf,'./figs/ex2-3','epsc')

