%% Experiment 2
vinj = linspace(10, 10.5, 5); %  10.0000   10.1250   10.2500   10.3750   10.5000
iout = [0.110, 0.116, 0.122, 0.128, 0.135]; % mA

%%
time = zeros(5, 1000);
vout = zeros(5, 1000);

%%
idx = 5;
[time(idx,:), vout(idx,:)] = get_scope('tds1', 1);
%%
idx=5;
plot(time(idx,:), vout(idx,:))
hold on
ind=find(time(idx,:) > 38.4 & time(idx,:) < 49.85);
p=polyfit(time(idx,ind), vout(idx,ind), 1)
fit=polyval(p, time(idx,:));
plot(time(idx,:), fit, 'k')
hold off


%%
iinj = [0.0670, 0.0778, 0.0913, 0.1079, 0.1268]
iinj = iinj*2*10^(-12)
iout = [0.110, 0.116, 0.122, 0.128, 0.135];
iout = iout*10^(-3)

eff = iinj./iout

set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)
plot(iout, eff,'o')
xlim([1.05 1.4]*10^(-4))
ylim([1.1 2]*10^(-9))

hold on

p=polyfit(iout, eff, 1)
fit=polyval(p, iout);
plot(iout, fit, 'k')

title('Injection Efficiency', 'Interpreter', 'LaTeX')
xlabel('$I_{transistor}$ (A)', 'Interpreter', 'LaTeX')
ylabel('$I_{injection}/I_{transistor}$', 'Interpreter', 'LaTeX')

saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab12/report/exp2','epsc')
%%
tunv(32);
%%
tunv(20);