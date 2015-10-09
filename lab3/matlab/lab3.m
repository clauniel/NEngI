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
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 12]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
ltitle('$I_{ds}$ vs $V_{g}$ for constant $V_{ds}$')
lylabel('$I_{ds}$/A')
lxlabel('$V_{g}$/ V')

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
fitp5 = fit(vp(fp)', sqrt(ioutp5(fp)), 'poly1')
hold on
plot(vp, vp*fitp5.p1 + fitp5.p2, 'k')
hold off

ylim([0,0.025])
legend({'pMOS','nMOS'},'location','northwest')

figure(3)
clf(3)
for row=iout3'
    hold on
    plot(vk236, row, '-xk')
    hold off
end

figure(4)
plot(vn(1:end-1), diff(ioutn)'./diff(vn))

%% calc mu
Cox = 1.1518e-15 % F/um^2
mobilityn = (fitn.p1/0.05 / Cox)/1e8
mobilityp = (fitp.p1/0.05 / Cox)/1e8
mobilityrel = mobilityn/mobilityp

mobilityn5 = (fitn5.p1^2*2 / Cox)/1e8
mobilityp5 = (fitp5.p1^2*2  / Cox)/1.e8
mobilityrel5 = mobilityn5/mobilityp5