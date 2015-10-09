%% Manual measurements in V/I mode
figure(1)
vii = [0.9e-6,9.9e-6,0.1003e-3,1.0037e-3,10.080e-3];
viv = [0.001,0.01,0.1,1.0,10.0];
%loglog(viv,vii, 'r')
h1 = loglog(viv,vii, 'sr')
hold on;
xlabel('V');
ylabel('I');

% Manual measurements in I/V mode
ivv = [0.0011, 0.010, 0.0998, 0.997, 9.94];
ivi = [1e-6, 10e-6, 100e-6, 1e-3, 10e-3];
%loglog(ivv,ivi, 'b')
loglog(ivv,ivi, 'ob')
fitvi = fit(viv',vii','a*x')
plot(viv,viv*fitvi.a,'r-')
fitiv = fit(ivv',ivi', 'a*x')
plot(ivv, ivv*fitiv.a, 'b-.')
hold off;
xlabel('V/V');
ylabel('I/Ä́');
legend({'V/I mode', 'I/V mode','V/I fit', 'I/V fit'}, 'position', [0.7, 0.40, 0.10, 0.1])
set(h1, 'linewidth',1)
set(gca,'Fontsize',6)
title('Experiment 1 resistor V/I characteristic')
xlabel('$V_R$ / V', 'Interpreter', 'LaTeX')
ylabel('$I_R$ / A', 'Interpreter', 'LaTeX')
xlim([0 10.1])
saveas(gcf,'./figs/manual-measure.eps','epsc')
