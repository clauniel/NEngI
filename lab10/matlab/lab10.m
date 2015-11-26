%synthr = 4.7V weight = 0.503 ref = 2.44 V Vtau = vdd-0.65 V
% experiment 1 Vtau = vdd-0.65
figure(1)
set(gcf,'units', 'centimeters', 'position', [0, 0, 8, 4], 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(t1,wf1)
hold on
plot(t3,wf3)
plot(t5+(0.0099-0.00198),wf5)
hold off
xlim([0, 0.06])
legend({'$V_\tau=V_{dd}-0.65$ V', '$V_\tau=V_{dd}-0.70$ V', '$V_\tau=V_{dd}-0.75$ V'},'Location', 'southeast', 'Interpreter', 'LaTeX')
title('Rising slopes of DPI synapse', 'Interpreter', 'LaTeX')
xlabel('t / s' , 'Interpreter', 'LaTeX');
ylabel('$V$ / V', 'Interpreter', 'LaTeX');
saveas(gcf,'./figs/ex1-1','epsc')

figure(2)
set(gcf,'units', 'centimeters', 'position', [0, 0, 8, 4], 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(t2,wf2)
hold on
plot(t4,wf4)
plot(t6+(0.0099-0.00198),wf6)
hold off
xlim([0, 0.06])
legend({'$V_\tau=V_{dd}-0.65$ V', '$V_\tau=V_{dd}-0.70$ V', '$V_\tau=V_{dd}-0.75$ V'},'Location', 'northeast', 'Interpreter', 'LaTeX')
title('Falling slopes of DPI synapse', 'Interpreter', 'LaTeX')
xlabel('t / s' , 'Interpreter', 'LaTeX');
ylabel('$V$ / V', 'Interpreter', 'LaTeX');
saveas(gcf,'./figs/ex1-2','epsc')


figure(3)
set(gcf,'units', 'centimeters', 'position', [0, 0, 8, 4], 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(t5,wf5)
hold on
plot(t7-(0.267-0.00194),wf7)
hold off
xlim([0, 0.01])
legend({'$V_{synthr}=4.7$ V','$V_{synthr}=4.0$ V'},'Location', 'northeast', 'Interpreter', 'LaTeX')
title('Rising slope for $V_{synthr}=4.7$ V vs $V_{synthr}=4.0$ V', 'Interpreter', 'LaTeX')
xlabel('t / s' , 'Interpreter', 'LaTeX');
ylabel('$V$ / V', 'Interpreter', 'LaTeX');
saveas(gcf,'./figs/ex1-3','epsc')


figure(4)
set(gcf,'units', 'centimeters', 'position', [0, 0, 8, 4], 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
plot(t6,wf6)
hold on
plot(t7-(0.1265-0.00194),wf7)
hold off
xlim([0, 0.1])
legend({'$V_{synthr}=4.7$ V','$V_{synthr}=4.0$ V'},'Location', 'northeast', 'Interpreter', 'LaTeX')
title('Falling slope for $V_{synthr}=4.7$ V vs $V_{synthr}=4.0$ V', 'Interpreter', 'LaTeX')
xlabel('t / s' , 'Interpreter', 'LaTeX');
ylabel('$V$ / V', 'Interpreter', 'LaTeX');
saveas(gcf,'./figs/ex1-4','epsc')

%% experiment 2
figure(5)
plot(freqs,means,'x')