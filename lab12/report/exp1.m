%% Experiment 1
[time, vout] = get_scope('tds1', 1);


%%
load exp1.1.mat
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)
plot(time,vout,'.')
hold on
title('Injection into the Floating Gate', 'Interpreter', 'LaTeX')
xlabel('Time (s)', 'Interpreter', 'LaTeX')
ylabel('Output Voltage (V)', 'Interpreter', 'LaTeX')
xlim([40 50])
ylim([1 1.3])

ind=find(time > 44.35 & time < 47.2);
p=polyfit(time(ind), vout(ind), 1);
fit=polyval(p, time);
plot(time, fit, 'k')
text(42.2,1.2,'$ V_{out} = 0.0714 \cdot t - 2.1304$','Interpreter', 'LaTeX')
hold off

saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab12/report/exp1a','epsc')

%%
load exp1.2.mat
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)
plot(time,vout,'.')
hold on
title('Tunneling out of the Floating Gate', 'Interpreter', 'LaTeX')
xlabel('Time (s)', 'Interpreter', 'LaTeX')
ylabel('Output Voltage (V)', 'Interpreter', 'LaTeX')
xlim([38 50])
ylim([0.5 1.3])

ind=find(time > 42.65 & time < 46);
p=polyfit(time(ind), vout(ind), 1);
fit=polyval(p, time);
plot(time, fit, 'k')
text(44.5,1,'$ V_{out} = -0.1682 \cdot t + 8.3703$','Interpreter', 'LaTeX')
hold off

saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab12/report/exp1b','epsc')