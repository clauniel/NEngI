%% exp 1
figure(1)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
wfdiff = (wf1-mean(wf1))-(wf2-mean(wf2));
plot(t1,log(abs(wfdiff)))
index = find(t1 <= 0.00136 & t1 >= 0.001105)
fitexp1 = fit(t1(index), log(wfdiff(index)), 'poly1')
hold on
plot(t1, fitexp1.p1*t1+fitexp1.p2,'r')
hold off
ylim([-10,1])
xlim([1,2]*1e-3)
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$\log\left(\frac{V}{\mathrm{V}}\right)$', 'Interpreter', 'LateX')
title('RC circuit rise time in log domain', 'Interpreter', 'LaTeX')
legend({'$\log\left(\max(V_c) - V_c(t)\right)$', '$\frac{-1}{\tau}$ slope fit $\tau=0.1003\mathrm{ms}$'}, 'Interpreter', 'LaTeX')
saveas(gcf,'./figs/ex1-log','epsc')

figure(2)
clf(2)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot([t1,t2],[wf1,wf2])
ylim([-0.15,0.15])
xlim([1,3.75]*1e-3)
hold on
plot([0.002345, 0.002345-1/fitexp1.p1], [-0.09841,-0.09841], '--k')
plot([0.002345, 0.002345-1/fitexp1.p1], [0.09962, -0.09841], '--k')
plot([0.002345, 0.002345], [0.09962, -0.09841], '--k')
hold off
x = [0.002345-1/fitexp1.p1/2,0.002345-1/fitexp1.p1/2]
y = ([-0.12, -0.102])
[xaf yaf] = ds2nfu(x,y)
%annotation('textarrow', xaf,yaf, 'String', '$\tau$', 'Interpreter', 'LaTeX')
drawbrace([0.002345-1/fitexp1.p1, -0.09841], [0.002345, -0.09841], 10, 'color', 'k');
text(0.002345-1/fitexp1.p1/3,-0.11, '$\tau$', 'Interpreter', 'LaTeX') 
legend({'$V_{in}$', '$V_{out}$'}, 'Interpreter', 'LaTeX')
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
title('Square wave applied to RC circuit', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex1-step', 'epsc')

%% exp 2
figure(3)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
wfdiff = (wf2_1-mean(wf2_1))-(wf2_2-mean(wf2_2));
plot(t2_1,log(abs(wfdiff)))
xlim([0.25,1.45]*1e-4)
ylim([-7,-2])

%rise time
index = find(t2_1 <= 5.7e-5 & t2_1 >= 4.5e-5)
fitexp2 = fit(t2_1(index), log(wfdiff(index)), 'poly1')
hold on
plot(t2_1, fitexp2.p1*t2_1+fitexp2.p2,'r')
hold off

% fall time
index = find(t2_1 <= 11.2e-5 & t2_1 >= 9.88e-5)
fitexp3 = fit(t2_1(index), log(wfdiff(index)), 'poly1')
hold on
plot(t2_1, fitexp3.p1*t2_1+fitexp3.p2,'r')
hold off
text(6e-5, -4, 'rising flank')
text(11.5e-5, -4, 'falling flank')

%cosmetics
legend({'$\log\left(V_{target} - V_{out}(t)\right)$', '$\frac{-1}{\tau_r}$ slope fit $\tau_r=6.96\mu\mathrm{s}$', '$\frac{-1}{\tau_f}$ slope fit $\tau_f=7.45\mu\mathrm{s}$'}, 'Interpreter', 'LaTeX', 'Location', 'NorthOutSide', 'Orientation', 'Horizontal')
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$\log\left(\frac{V}{\mathrm{V}}\right)$', 'Interpreter', 'LateX')
title('Follower-integrator rising and falling flanks in log domain', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex2-log', 'epsc')

figure(4)
clf(4)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot([t2_1,t2_2], [wf2_1,wf2_2])
xlim([0.25,1.45]*1e-4)
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
title('Square wave applied to follower-integrator circuit', 'Interpreter', 'LaTeX')
legend({'$V_{in}$', '$V_{out}$'}, 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex2-step', 'epsc')
%% exp 3
figure(5)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
semilogx(freqs*1e3, 20*log10(PPs./95), 'xk')
% cutoff freq measured at 23.5kHz so
tau = 1/(2*pi*23.5e3)
hold on
semilogx(logspace(3,6,100),20*log10(abs(1./(1+i*tau*2*pi*logspace(3,6,100)))),'k')
hold off
ylim([-35,1])
legend({'Measurements', 'Ideal first-order low-pass with $F_0=23.5$ kHz'}, 'Interpreter', 'LaTeX', 'Location', 'southwest')
xlabel('Frequency / Hz', 'Interpreter', 'LaTeX')
ylabel('Magnitude / dB', 'Interpreter', 'LaTeX')
title('Follower-integrator frequency response', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex3-freqresp', 'epsc')

%% exp 4
figure(1)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot([t4_1,t4_2], [wf4_1, wf4_2])
xlim([0.75,4]*1e-4)
hold on
plot([0.75e-4, 4e-4], [0.22, 0.22], '--k')
plot([0.75e-4, 4e-4], [-0.2, -0.2], '--k')
hold off
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
legend({'$V_{in}$', '$V_{out}$'}, 'Interpreter', 'LaTeX', 'Location', 'northwest')
title('High amplitude square wave applied to follower-integrator circuit', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex4-slew', 'epsc')
%% exp 4 part 2
figure(2)
clf(2)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',8)
co = get(gca, 'ColorOrder')
set(gca, 'ColorOrder', [1 0 0; 0 0 0], 'NextPlot', 'ReplaceChildren');
plot([t6_1,t6_2], [wf6_1, wf6_2])
hold on
plot([t7_1,t7_2], [wf7_1, wf7_2])
plot([t8_1,t8_2], [wf8_1, wf8_2])
hold off
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
legend({'$V_{in}$', '$V_{out}$'}, 'Interpreter', 'LaTeX', 'Location', 'northwest')
title('High-amplitude square wave applied to follower-integrator with $V_b=0.75$ V', 'Interpreter', 'LaTeX')
text(2.2e-4, 2, '$V_{bin}=2$ V', 'Interpreter', 'LaTeX')
text(2.2e-4, 1.4, '$V_{bin}=1.5$ V', 'Interpreter', 'LaTeX')
text(2.2e-4, 0.9, '$V_{bin}=1$ V', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex4-1', 'epsc')

figure(3)
clf(3)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',8)
co = get(gca, 'ColorOrder')
set(gca, 'ColorOrder', [1 0 0; 0 0 0], 'NextPlot', 'ReplaceChildren');
plot([t9_1,t9_2], [wf9_1, wf9_2])
hold on
plot([t10_1,t10_2], [wf10_1, wf10_2])
hold off
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
legend({'$V_{in}$', '$V_{out}$'}, 'Interpreter', 'LaTeX', 'Location', 'northwest')
title('High-amplitude square wave applied to follower-integrator with $V_b=0.75$ V', 'Interpreter', 'LaTeX')
text(2.15e-4, 1, '$V_{bin}=0.75$V', 'Interpreter', 'LaTeX')
text(2.15e-4, 0.25, '$V_{bin}=0.5$ V', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex4-2', 'epsc')


figure(4)
clf(4)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',8)
co = get(gca, 'ColorOrder')
set(gca, 'ColorOrder', [1 0 0; 0 0 0], 'NextPlot', 'ReplaceChildren');
plot([t11_1,t11_2], [wf11_1, wf11_2])
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
legend({'$V_{in}$', '$V_{out}$'}, 'Interpreter', 'LaTeX', 'Location', 'west')
title('High-amplitude square wave applied to follower-integrator with $V_b=0.75$ V', 'Interpreter', 'LaTeX')
text(2.12e-4, 0.25, '$V_{bin}=0.25$V', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex4-3', 'epsc')



%% exp 5
figure(6)
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
h6 = plot([t12_1, t12_2], [wf12_1, wf12_2])
h6(1).Color(4) = 0.5
h6(2).Color(4) = 0.5
[B A] = butter(1, 0.01);
coeff = ones(1, 50)./50;
delay = (length(coeff)-1)/2;
xwf12_2 = filter(coeff, 1, wf12_2)
hold on
h6 = plot(t12_2-delay/100, xwf12_2, 'k')
h6.Color(4) = 1;
hold off
ylim([1.9, 2.0])
xlim([1,10])
legend({'$V_{in}$', '$V_{out}$', '$V_{out}$ smoothed'}, 'Interpreter', 'LaTeX', 'Location', 'southeast')
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$V$ / V', 'Interpreter', 'LateX')
title('Square wave applied to slow follower-integrator circuit', 'Interpreter', 'LaTeX')
saveas(gcf, './figs/ex5-step', 'epsc')


figure(5)
wfdiff = max(xwf12_2) - xwf12_2
set(gcf,'paperunits','centimeters','Paperposition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(t12_2,log(wfdiff))
xlim([1,10])
index = find(t12_2 <= 4 & t12_2 >= 2)
fitexp4 = fit(t12_2(index), log(wfdiff(index)), 'poly1')
hold on
plot(t12_2, t12_2*fitexp4.p1+fitexp4.p2, 'r')
hold off
xlabel('$t$ / s', 'Interpreter', 'LaTeX')
ylabel('$\log\left(\frac{V}{\mathrm{V}}\right)$', 'Interpreter', 'LateX')
title('Slow follower-integrator rise time in log domain', 'Interpreter', 'LaTeX')
legend({'$\log\left(\max(V_{out}) - V_{out}(t)\right)$', '$\frac{-1}{\tau}$ slope fit $\tau=1.71\mathrm{s}$'}, 'Interpreter', 'LaTeX')
saveas(gcf,'./figs/ex5-log','epsc')