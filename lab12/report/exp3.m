%% Experiment 2
vtun = linspace(27, 32, 5); % 27.0000   28.2500   29.5000   30.7500   32.0000

%%
time = zeros(5, 1000);
vout = zeros(5, 1000);

%%
idx = 5;
vtun(idx)
tunv(vtun(idx));

%%
[time(idx,:), vout(idx,:)] = get_scope('tds1', 1);

%%
idx=5;
plot(time(idx,:), vout(idx,:))
hold on
ind=find(time(idx,:) > 28 & time(idx,:) < 49.9);
p=polyfit(time(idx,ind), vout(idx,ind), 1)
fit=polyval(p, time(idx,:));
plot(time(idx,:), fit, 'k')
hold off

%%
itun = [-0.0004, -0.0037, -0.0251, -0.0858]
itun = -itun*2*10^(-12)
vox = vtun(2:5)-5;

figure(1)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)

plot(vox, itun,'o')
hold on

modelfun = @(b, x) b(1).*exp(-b(2)./x);
beta0 = [85, 900];
mdl = fitnlm(vox', itun, modelfun, beta0)
pred=predict(mdl, (vox(1):0.05:vox(end))');
plot((vox(1):0.05:vox(end)), pred, 'k')

title('Tunneling Current', 'Interpreter', 'LaTeX')
xlabel('$V_{ox}$ (V)', 'Interpreter', 'LaTeX')
ylabel('Tunneling Current (A)', 'Interpreter', 'LaTeX')

text(25.5, 0.2*10^(-13), '$I_{tun}=0.22235 e^{-\frac{752.83}{V_{ox}}}$','Interpreter', 'Latex')

saveas(gcf,'C:/Users/Eloy/Desktop/exp3a','epsc')

hold off


%%
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)

p=polyfit(-1./vox, log(itun), 1)
fit=polyval(p, -1./vox);
semilogy(-1./vox, exp(fit), 'k')
hold on

plot(-1./(vox(1):0.05:vox(end)), pred, '-.k')

semilogy(-1./vox, itun,'o')


p=polyfit(-1./vox, log(itun), 1)
fit=polyval(p, -1./vox);
semilogy(-1./vox, exp(fit), 'k')

xlim([-0.044 -0.036])

title('Tunneling Current', 'Interpreter', 'LaTeX')
xlabel('$-\frac{1}{V_{ox}} (\frac{1}{V})$', 'Interpreter', 'LaTeX')
ylabel('Tunneling Current (A)', 'Interpreter', 'LaTeX')
legend({'Linear fit in log domain','Exponential fit'}, 'Interpreter', 'Latex', 'Location', 'Northwest')

text(-0.042, 1.4*10^(-15), '$I_{tun}=85.129 e^{-\frac{908.54}{V_{ox}}}$','Interpreter', 'Latex')
hold off

saveas(gcf,'C:/Users/Eloy/Desktop/exp3b','epsc')

%%
x = 0:1:10000;
y = -0.0054516.*exp(-653.15./x)
plot(x,y)
