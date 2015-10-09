%% lab 3 prelab
eps0 = 8.86e-12;
epsSi = 11.7*eps0;
epsOx = 3.9*eps0;
tOx = 300e-10;
COx = epsOx/tOx/(1e12)
%%
Vs = 0;
VT0 = 0.65;
Vd = 0:0.1:5;
Vg = 1.5:0.2:2.5;
vfd = Vd(find(Vd<=(Vg(1)-VT0)))
h1 = plot(vfd-Vs, (Vg(1)-VT0-Vs).^2-(Vg(1)-VT0-vfd).^2,'k')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 12]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
title('$I_{ds}$ vs $V_{ds}$ for constant $V_g$', 'Interpreter', 'LaTeX')
ylabel('$I_{ds}$/A', 'Interpreter', 'LaTeX')
xlabel('$V_{ds}$/ V', 'Interpreter', 'LaTeX')
set(gca, 'YTickMode', 'manual');
set(gca, 'YTick', [0]);
set(gca, 'XTick', [0]);
hold on
plot([vfd(end),Vd(find(Vd>=(Vg(1)-VT0)))]-Vs, repmat(((Vg(1)-VT0-Vs).^2),1,1+length(Vd(find(Vd>=(Vg(1)-VT0))))),'k')
hold off
for V = Vg
    vfd = Vd(find(Vd<=(V-VT0)))
    hold on
    plot(vfd-Vs, (V-VT0-Vs).^2-(V-VT0-vfd).^2,'k')
    plot([vfd(end),Vd(find(Vd>=(V-VT0)))]-Vs, repmat(((V-VT0-Vs).^2),1,1+length(Vd(find(Vd>=(V-VT0))))),'k')
    hold off
end
hold on
plot([0.2,1],[0,3.5], '-.k')
hold off
h1 = text(0.4,2, 'approx. ohmic')
set(h1, 'rotation', 90);
hold on
plot([0.5,1.9],[0,3.5],'-.k')
hold off
h1 = text(2,1.75, 'saturation')
saveas(gcf,'./figs/prelab2.eps','epsc')

%%
v = 0:0.1:5;
plot(v,v-0.65, 'k')

set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 12]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
title('$I_{ds}$ vs $V_{g}$ for constant $V_{ds}$', 'Interpreter', 'LaTeX')
ylabel('$I_{ds}$/A', 'Interpreter', 'LaTeX')
xlabel('$V_{g}$/ V', 'Interpreter', 'LaTeX')
set(gca, 'YTickMode', 'manual');
set(gca, 'YTick', [0]);
set(gca, 'XTick', [0]);
ylim([0,5])
text(0.62,0.12,'\downarrow')
text(0.60,0.25, '$V_{T0}$', 'Interpreter', 'LaTeX')
text(3,2.0, '$\frac{dI_{ds}}{dV_g}=\beta V_{ds}$', 'Interpreter', 'LaTeX')
saveas(gcf,'./figs/prelab3.eps','epsc')

%%