figure(1)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',10)

plot(t1,wf1)
hold all
plot(t2,wf2)
plot(t3,wf3)
plot(t4,wf4)

title('Adaptive and Non-adapting Photoreceptor Responses', 'Interpreter', 'LaTeX')
xlabel('Time (s)', 'Interpreter', 'LaTeX')
ylabel('Output Voltage (V)', 'Interpreter', 'LaTeX')
legend({'non-adapting + filter 1','adapting + filter 1', 'non-adapting + filter 3', 'adapting + filter 3'}, 'Interpreter', 'Latex')

saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab9/report/exp1','epsc')

figure(2)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',10)
plot(t9,wf9)
hold all
plot(t8,wf8)
ylim([1.1 1.9])
title('Adaptation of the Photoreceptor', 'Interpreter', 'LaTeX')
xlabel('Time (s)', 'Interpreter', 'LaTeX')
ylabel('Voltage (V)', 'Interpreter', 'LaTeX')
legend({'output voltage','feedback node voltage'}, 'Interpreter', 'Latex')
saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab9/report/exp2_1','epsc')

%%
figure(1)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',10)

tr=[0.000035, 0.000077, 0.00017, 0.0017, 0.06]
trc=[0.000026, 0.000048, 0.000088, 0.00067, 0.0064]

x=[1 0.1 0.01 0.001 0.0001]

loglog(x, tr,'o')
hold all
loglog(x, trc,'*')
legend({'no cascode', 'with cascode'}, 'Interpreter', 'Latex')
title('Time constant of the photoreceptor', 'Interpreter', 'Latex')
xlabel('Filter attenuation', 'Interpreter', 'Latex')
ylabel('Fall time (s)', 'Interpreter', 'Latex')
saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab9/report/exp2_2c','epsc')

%%
figure(2)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 1)
set(gca,'Fontsize',10)

plot(t10+0.001-0.00025, wf10)
hold all
plot(t11,wf11)
plot(t12-0.004,wf12)

plot(t15,wf15, '--')
plot(t16,wf16, '--')
plot(t17,wf17, '--')
legend({'no filter','filter 1', 'filter 2','no filter + cascode','filter 1 + cascode', 'filter 2 + cascode'}, 'Interpreter', 'Latex')
xlim([0.9e-3, 1.8e-3])
title(char('Effect of illumination and cascoding', 'on the response time of the photoreceptor'), 'Interpreter', 'Latex')
xlabel('Time (s)', 'Interpreter', 'Latex')
ylabel('Voltage AC (V)', 'Interpreter', 'Latex')
saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab9/report/exp2_2a','epsc')
hold off

%%
figure(3)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',10)

plot(t12+0.02507-0.005,wf12)
hold all
plot(t13,wf13)
plot(t14-0.05+0.02507,wf14)

plot(t17+0.02505-0.001002,wf17, '--')
plot(t18+0.02505-0.01004,wf18, '--')
plot(t19,wf19, '--')
hold off

xlim([0.02, 0.05])
legend({'filter 2','filter 3', 'filter 4', 'filter 2 + cascode','filter 3 + cascode', 'filter 4 + cascode'}, 'Interpreter', 'Latex')
title(char('Effect of illumination and cascoding', 'on the response time of the photoreceptor'), 'Interpreter', 'Latex')
xlabel('Time (s)', 'Interpreter', 'Latex')
ylabel('Voltage AC (V)', 'Interpreter', 'Latex')
saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab9/report/exp2_2b','epsc')

%% tobi element

figure(4)
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',10)
plot(5-vsweep, -iVg, '.-')
hold all
plot(5-vsweep, -iVw, '.-')
hold off

legend({'$V_{w} > V_{g}$', '$V_{g} > V_{w}$'}, 'Interpreter', 'Latex', 'Location', 'Northwest')
title(char('I-V Characteristic of the Tobi Element'), 'Interpreter', 'Latex')
xlabel('$|V_w - V_g|$ (V)', 'Interpreter', 'Latex')
ylabel('$|$Current$|$ (A)', 'Interpreter', 'Latex')
saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab9/report/tobi','epsc')





