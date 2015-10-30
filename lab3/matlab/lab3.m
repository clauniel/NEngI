%% nMOS Vds 50mV
vn = 0:0.1:5;
ioutn = iv(vn,0.05)
%% nMOS Vds 5V
vn = 0:0.1:5;
ioutn5 = iv(vn, 5)

%% pMOS Vds 50mV
vp = 0:0.1:5;
ioutp = iv(vp,0.05)

%% pMOS Vds 5V
vp = 0:0.1:5;
ioutp5 = iv(vp, 5)

%% pMOS Vds 50mV config ground
vpg = 0:0.1:5;
ioutpg = iv(vpg, 4.95)

%% pMOS Vds 5V
vpg = 0:0.1:5;
ioutpg5 = iv(vpg, 0)

%% drain characteristics of a single transistor at different saturatin currents
vk230 = 0.2:0.2:2.2;
vk236 = 0:0.2:5;
iout3 = iv(vk230, vk236)
%% stuff and things

%50mV Vds plots
figure(1)
plot(vp,ioutp, '+k')
hold on
plot(vn,ioutn, 'xk')
hold off
fn = find(vn>=0.7);
fp = find(vp>=1.1);
fitn = fit(vn(fn)',ioutn(fn),'poly1')
hold on
plot(vn,vn*fitn.p1+fitn.p2,'k')
hold off
fitp = fit(vp(fp)', ioutp(fp), 'poly1')
hold on
plot(vp, vp*fitp.p1 + fitp.p2, 'k')
hold off
%cosmetics
ylim([0,12e-6])
legend({'pMOS','nMOS'},'location','northwest')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 6]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
ltitle('$I_{ds}$ vs $V_{g}$ for constant $V_{ds}=50$ mV')
lylabel('$I_{ds}$/A')
lxlabel('$V_{g}$/ V')
saveas(gcf,'./figs/ex1.eps','epsc')

%5 V Vds plots
figure(2)
plot(vp,sqrt(ioutp5), '+k')
hold on
plot(vn,sqrt(ioutn5), 'xk')
hold off
fn = find(vn>=0.7);
fp = find(vp>=1.1);
fitn5 = fit(vn(fn)',sqrt(ioutn5(fn)),'poly1')
hold on
plot(vn,vn*fitn5.p1+fitn5.p2,'k')
hold off
[fitp5 pgood] = fit(vp(fp)', sqrt(ioutp5(fp)), 'poly1')
hold on
plot(vp, vp*fitp5.p1 + fitp5.p2, 'k')
hold off

%cosmetics
ylim([0,0.025])
legend({'pMOS','nMOS'},'location','northwest')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 6]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
ltitle('$I_{ds}$ vs $V_{g}$ for constant $V_{ds}=5$ V')
lylabel('$\sqrt{I_{ds}}$/$\sqrt{A}$')
lxlabel('$V_{g}$/ V')
saveas(gcf,'./figs/ex2.eps','epsc')

% Ids vs Vds for 11 values of Vg
figure(3)
clf(3)
for row=iout3'
    hold on
    semilogy(vk236, row, '-xk')
    hold off
end
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 6]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
ltitle('$I_{ds}$ vs $V_{ds}$ for different \(V_g\)')
lylabel('$I_{ds}$/A')
lxlabel('$V_{ds}$/ V')
saveas(gcf,'./figs/ex3.eps','epsc')

%cosmetics

figure(4)
Cox = 1.1518e-15 % F/um^2
plot(vp(1:end-1), diff(ioutp)'./diff(vp)/0.05/Cox /1e8, '+k')
hold on
plot(vn(1:end-1), diff(ioutn)'./diff(vn)/0.05/Cox /1e8, 'xk')
hold off
legend({'pMOS','nMOS'},'location','northeast')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 6]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
ltitle('Mobility versus $V_g$ for $V_{ds} = 50$ mV')
lylabel('$\mu$ / ($cm^2$ / V s)')
lxlabel('$V_{g}$/ V')
saveas(gcf,'./figs/extra.eps','epsc')

%% poly2 fit
figure(5)
plot(vp,ioutp5, '+k')
hold on
plot(vn,ioutn5, 'xk')
hold off
fn = find(vn>=0.7);
fp = find(vp>=1.1);
fitn5q = fit(vn(fn)',ioutn5(fn),'poly2')
hold on
plot(vn,vn.^2*fitn5q.p1+vn*fitn5q.p2+fitn5q.p3,'k')
hold off
[fitp5q qpgood] = fit(vp(fp)', ioutp5(fp), 'poly2')
hold on
plot(vp, vp.^2*fitp5q.p1 + vp*fitp5q.p2+fitp5q.p3, 'k')
hold off

%% calc mu
Cox = 1.1518e-15 % F/um^2
mobilityn = (fitn.p1/0.05 / Cox)/1e8
mobilityp = (fitp.p1/0.05 / Cox)/1e8
mobilityrel = mobilityn/mobilityp

mobilityn5 = (fitn5.p1^2*2 / Cox)/1e8
mobilityp5 = (fitp5.p1^2*2  / Cox)/1.e8
mobilityrel5 = mobilityn5/mobilityp5

%% experiment 3 fit early voltage
figure(5)
clf(5)
vearlygate=[];
idsatgate=[];
slopes=[];
ind = find(vk236 > 2.5 & vk236 <5);
for row=iout3'
    p = fit(vk236(ind)',row(ind),'poly1');
    vearlygate = [vearlygate, p.p2/p.p1];
    idsatgate = [idsatgate, p.p2];
    slopes = [slopes, p.p1];
    idsnorm = row/max(iout3(:));
    p = [p.p1,p.p2];
    hold on
    plot(vk236,idsnorm, 'kx');
    plot(vk236,polyval(p,vk236')/max(iout3(:)), 'k-')
    hold off
end
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
lxlabel('$V_{ds}$ / V')
lylabel('$I_{ds} / max(I_{ds})$')
ltitle('nMOS 32/8 $I_{ds}$ vs $V_{ds}$ characteristics')
saveas(gcf,'./figs/ex3-2.eps','epsc')
%%
semilogx(idsatgate,vearlygate,'kx')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 8]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
lxlabel('$I_{dsat}$ / A')
lylabel('$V_e$ / V')
ltitle('nMOS 32/8 $V_e$ vs $I_{dsat}$')
saveas(gcf,'./figs/ex3-3.eps','epsc')