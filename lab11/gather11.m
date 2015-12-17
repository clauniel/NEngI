%% experiment 1
% opamp vref = 0.2 to capture large spikes without clipping
% V_in = 4.150 Vthr = 0.706, Vref = 0.401, Vtau = 0.282
[t1, wf1] = get_scope('tds1', 1)
plot(t1,wf1)

%% Vref = 0.330
[t2, wf2] = get_scope('tds1', 1)
plot(t2,wf2)

%% Vref = 0.254
[t3, wf3] = get_scope('tds1', 1)
plot(t3,wf3)

%% graphs
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)

plot(t1,wf1)
hold all
plot(t2,wf2)
plot(t3,wf3)
hold off

title('Spiking Neuron', 'Interpreter', 'LaTeX')
xlabel('Time (s)', 'Interpreter', 'LaTeX')
ylabel('$\sim$ Membrane Potential (V)', 'Interpreter', 'LaTeX')
legend({'$V_{ref} = 0.401$','$V_{ref} = 0.330$', '$V_{ref} = 0.254$'}, 'Interpreter', 'Latex')

saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab11/report/exp1a','epsc')



%%
set(gcf, 'paperunits','centimeters','PaperPosition',[0 0 16 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',11)

semilogy(Vv,Vm3,'k*')
hold on
semilogy(Vv,Vm1,'kx')
semilogy(Vv,Vm2, '+k')
hold off
title('Spike Frequency', 'Interpreter', 'LaTeX')
legend({'$V_{ref} = 0.220$ V', '$V_{ref} = 0.200$ V', '$V_{ref}=0.180$ V'}, 'Location', 'Southwest','Interpreter', 'LaTeX')
xlabel('$V_{in}$ (V)' , 'Interpreter', 'LaTeX')
ylabel('$F$ (Hz)', 'Interpreter', 'LaTeX') 

saveas(gcf,'C:/Users/Eloy/SkyDrive/NSC/Neuromorphic engineering I/Lab/lab11/report/exp1b','epsc')