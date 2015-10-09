%% IV characteristics using 236 programmable mode for ic
vc = [0:0.01:0.2, 0.25:0.05:0.45, 0.50:0.01:0.85];
ic = iv(0,vc);

%% IV characteristics for ie
ve = [0:0.01:0.2, 0.25:0.05:0.45, 0.50:0.01:0.85];
ie = iv(0,ve);

%% plots
%plots of ic
%log10 plot
figure(1)
% define papersize for export
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 4]);

semilogy(vc,ic,'ko')
hold on
semilogy(vc,ic, 'k')
vcindex = find(vc >= 0.2 & vc <=0.8);
vcnindex = find(vc < 0.2 | vc > 0.8);
vcl=vc(vcindex);
icl=ic(vcindex);
semilogy(vcl,icl,'b');
semilogy(vcl,icl,'ob');
hold off;

%ln plot
figure(2)
% define papersize for export
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 4]);
lnic = log(ic)
h2 = plot(vc(vcnindex),lnic(vcnindex), 'ko')
fitvcln = fit(vc(vcindex)',lnic(vcindex)', 'poly1')
hold on
%plot(vc,lnic,'ko')
%plot(vc(vcindex),lnic(vcindex),'b')
plot(vc(vcindex),lnic(vcindex),'bs')
plot(vc,vc*fitvcln.p1+fitvcln.p2, 'r')
legend({'outside fit region', 'fit region', 'linear fit'}, 'Location', 'southEast')
hold off
set(h2, 'linewidth',0.5)
set(gca,'Fontsize',6)
title('Experiment 2 base-collector I-V characteristic')
xlabel('$V_{BC}$ / V', 'Interpreter', 'LaTeX')
ylabel('current $ln(\frac{I}{A})$', 'Interpreter', 'LaTeX')
xlim([0 0.9])
saveas(gcf,'./figs/lnivc.eps','epsc')

% plots of ie
%log10 plot
figure(3)
% define papersize for export
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 4]);
semilogy(ve,ie,'o')
hold on 
semilogy(ve,ie)
hold off

%ln plot
figure(4)
% define papersize for export
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 4]);
lnie = log(ie);
veindex = find(ve >= 0.2 & ve <=0.8);
venindex = find(ve < 0.2 | ve > 0.8);
h4 = plot(ve(venindex),lnie(venindex),'ko')
fitveln = fit(ve(veindex)', lnie(veindex)', 'poly1')
hold on
%plot(ve,lnie,'ko')
%plot(ve(veindex),lnie(veindex),'b')
plot(ve(veindex),lnie(veindex),'bs')
plot(ve, ve*fitveln.p1+fitveln.p2,'r')
legend({'outside fit region', 'fit region', 'linear fit'}, 'Location', 'southEast')
hold off
set(h4, 'linewidth',0.5)
set(gca,'Fontsize',6)
title('Experiment 2 base-emitter I-V characteristic')
xlabel('$V_{BE}$ / V', 'Interpreter', 'LaTeX')
ylabel('current $ln(\frac{I}{A})$', 'Interpreter', 'LaTeX')
xlim([0 0.9])
saveas(gcf,'./figs/lnive.eps','epsc')

figure(3)
logie = log10(ie)
veindex = find(ve >= 0.2 & ve <=0.8);
venindex = find(ve < 0.2 | ve > 0.8);
h3 = plot(ve(venindex),logie(venindex),'ok')
fitvelog = fit(ve(veindex)', logie(veindex)', 'poly1')
hold on
%plot(ve,logie,'ko')
%plot(ve(veindex),logie(veindex),'b')
plot(ve(veindex),logie(veindex),'bs')
plot(ve, ve*fitvelog.p1+fitvelog.p2, 'r')
legend({'outside fit region', 'fit region', 'linear fit'}, 'Location', 'southEast')
hold off
set(h3, 'linewidth',0.5)
set(gca,'Fontsize',6)
title('Experiment 2 base-emitter I-V characteristic')
xlabel('$V_{BE}$ / V', 'Interpreter', 'LaTeX')
ylabel('current $log_{10}(\frac{I}{A})$', 'Interpreter', 'LaTeX')
xlim([0 0.9])
saveas(gcf,'./figs/log10ive.eps','epsc')

figure(1)
logic = log10(ic)
vcindex = find(vc >= 0.2 & vc <=0.8);
vcnindex = find(vc < 0.2 | vc > 0.8);
h1 = plot(vc(vcnindex),logic(vcnindex),'ko')
fitvclog = fit(vc(vcindex)',logic(vcindex)', 'poly1')
hold on
%plot(vc,logic,'ko')
%plot(vc(vcindex),logic(vcindex),'b')
plot(vc(vcindex),logic(vcindex),'bs')
plot(vc,vc*fitvclog.p1 + fitvclog.p2, 'r')
legend({'outside fit region', 'fit region', 'linear fit'}, 'Location', 'southEast')
hold off

%cosmetics
set(h1, 'linewidth',0.5)
set(gca,'Fontsize',6)
title('Experiment 2 base-collector I-V characteristic')
xlabel('$V_{BC}$ / V', 'Interpreter', 'LaTeX')
ylabel('current $log_{10}(\frac{I}{A})$', 'Interpreter', 'LaTeX')
xlim([0 0.9])
saveas(gcf,'./figs/log10ivc.eps','epsc')

figure(5)
h5 = plot(vc,ic,'o')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 10 8]);
set(h5, 'linewidth',0.5)
set(gca,'Fontsize',6)
title('base-collector I-V characteristic')
xlabel('$V_{BC}$ / V', 'Interpreter', 'LaTeX')
ylabel('$I_{BC}$ / A', 'Interpreter', 'LaTeX')
xlim([0 0.9])
saveas(gcf,'./figs/ivc.eps','epsc')

