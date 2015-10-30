hFig = figure(1)
dVx=[-0.3:0.02:0.3];
plot(dVx, i18x, '*')
set(gca, 'DefaultLineLineWidth', 1)
hold on
plot(dVx, i16x, '+')
xlim([-0.3,0.3])
ylim([-0.4e-7, 0.4e-7])
plot(dVx, i16x+i18x, '.k')
plot(dVx, i18x-i16x, 'ok')
legend('I_1', 'I_2', 'I_1 + I_2', 'I_1 - I_2', 'Location', 'southeast')
title('Currents in the differential pair', 'FontSize', 12)
xlabel('Differential voltage V_1 - V_2 (V)')
ylabel('Current (A)')
set(gca,'fontsize',10)

ind=find(dVx > -0.06 & dVx < 0.06);
p16=polyfit(dVx(ind), (i16x(ind))', 1);
i16fit=polyval(p16, dVx);
plot(dVx, i16fit)
p18=polyfit(dVx(ind), (i18x(ind))',1);
i18fit=polyval(p18, dVx);
plot(dVx, i18fit)
p=polyfit(dVx(ind), (i18x(ind)-i16x(ind))', 1)
fit=polyval(p, dVx);
plot(dVx, fit, 'k')
psum=polyfit(dVx, (i16x+i18x)',1);
sumfit=polyval(psum, dVx);
plot(dVx, sumfit, 'k')
hold off



%% experiment 2
figure(2)
set(gca, 'DefaultLineLineWidth', 1)
dV=[-0.3:0.02:0.3]
plot(dV, i18b, '+k')
hold on
plot(dV, i16b, 'xk')
plot(dV, i17b, '^')
xlim([-0.3,0.3])
ylim([0, 3e-8])
plot(dVx, i16b+i18b, '*')
plot(dVx, i16b+i17b+i18b, '.k')
legend('I_1', 'I_2', 'I_{out}', 'I_1 + I_2', 'I_1 + I_2 + I_{out}', 'Orientation', 'horizontal', 'Location', 'north')
title('Currents in the bump-antibump circuit', 'FontSize', 12)
xlabel('Differential voltage V_1 - V_2 (V)')
ylabel('Current (A)')
set(gca,'fontsize',10)

modelfun = @(b, x) b(1)-b(1)./(1+4/b(2).*(cosh(b(3)/b(4).*x)).^2);
beta0 = [2.41e-8, 10, 0.7, 0.025];
mdl = fitnlm(dV, i16b+i18b, modelfun, beta0)
pred=predict(mdl, dV');
plot(dV, pred)

%% experiment 3
figure(3)
set(gca, 'DefaultLineLineWidth', 1)
set(gca,'fontsize',10)

plot(v230_ex3a, i236_ex3a, '.')
hold on
plot(v230_ex3b, i236_ex3b, 'ok')

legend('V_b = 0.5', 'V_b = 0.6', 'Location', 'southeast')
title(char('I_{out }in the transconductance', '   amplifier below threshold'), 'FontSize', 12)
xlabel('Differential voltage V_1 - V_2 (V)')
ylabel('Output current (A)')
xlim([-0.3,0.3])
ylim([-1.1e-7, 1.1e-7])

ind=find(v230_ex3a > -0.06 & v230_ex3a < 0.06);
p1=polyfit(v230_ex3a(ind), (i236_ex3a(ind))', 1);
fit1=polyval(p1, v230_ex3a);
plot(v230_ex3a, fit1)

p2=polyfit(v230_ex3b(ind), (i236_ex3b(ind))', 1);
fit2=polyval(p2, v230_ex3b);
plot(v230_ex3b, fit2, 'k')


figure(4)
set(gca, 'DefaultLineLineWidth', 1)
set(gca,'fontsize',10)

plot(v230_ex3c_3, i236_ex3c, '.')
hold on

title(char('I_{out} in the transconductance', '   amplifier above threshold'), 'FontSize', 12)
xlabel('Differential voltage V_1 - V_2 (V)')
ylabel('Output current (A)')

ind=find(v230_ex3c_3 > -0.2 & v230_ex3c_3 < 0.2);
p3=polyfit(v230_ex3c_3(ind), (i236_ex3c(ind))', 1);
fit1=polyval(p3, v230_ex3c_3);
plot(v230_ex3c_3, fit1)

ylim([-0.5e-5, 0.5e-5])
legend('V_b = 1', 'Location', 'southeast')

%% experiment 4
% voltage gain
figure (5)
set(gca, 'DefaultLineLineWidth', 1)
set(gca,'fontsize',10)

plot(-v230_ex4a, i236_ex4a, '.')
title('Voltage gain in the transconductance amplifier', 'FontSize', 12)
xlabel('Differential voltage V_1 - V_2 (V)')
ylabel('Output voltage (V)')
hold on

ind=find(v230_ex4a > -4e-3 & v230_ex4a < -1.5e-3);
p4=polyfit(v230_ex4a(ind), (i236_ex4a(ind)), 1);
fit4=polyval(p4, v230_ex4a);
plot(-v230_ex4a, fit4)

ylim([0.5, 5.5])

% output conductance
figure(6)
set(gca, 'DefaultLineLineWidth', 1)
set(gca,'fontsize',10)
plot(v236_ex4b, i236_ex4b,'.')
title(char('        Output conductance', 'in the transconductance amplifier'), 'FontSize', 12)
xlabel('Output voltage (V)')
ylabel('Output corrent (A)')
hold on

ind2=find(v236_ex4b > 0.8 & v236_ex4b < 4);
p5=polyfit(v236_ex4b(ind2), (i236_ex4b(ind2)), 1);
fit5=polyval(p5, v236_ex4b);
plot(v236_ex4b, fit5)
ylim([-0.5e-7, 0.3e-7])

%% wide range

figure(7)
set(gca, 'DefaultLineLineWidth', 1)
set(gca,'fontsize',10)

plot(v230_ex4wr, i236_ex4wr, '.')
hold on

title(char('Voltage gain in the wide-range', '  transconductance amplifier'), 'FontSize', 12)
xlabel('Differential voltage V_1 - V_2 (V)')
ylabel('Output voltage (V)')

ind=find(v230_ex4wr > 0.0073 & v230_ex4wr < 0.0083);
p5=polyfit(v230_ex4wr(ind), (i236_ex4wr(ind)), 1);
fit5=polyval(p5, v230_ex4wr);
plot(v230_ex4wr, fit5)
ylim([0, 5])





