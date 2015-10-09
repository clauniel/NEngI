%% Experimento uno
v = 0:0.05:1.3;
iout = iv(v,0);
%% Experimento dos
v = 1:0.2:5;
vout = vv(v)
%%
vn = 0:0.05:1;
fn = find(vn>0.1&vn<0.6);

figure(1)
h1 = semilogy(vn,-niout, 'xk')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 15 4]);
set(h1, 'linewidth',0.5)
set(gca,'Fontsize',6)
Ion=exp(lnfit.p2)
kn=lnfit.p1

vp = 0:0.05:1.3;
fp=find(vp>0.61&vp<1);
hold on
h1 = semilogy(vp,-piout, '+k')
set(h1, 'linewidth',0.5)
set(gca,'Fontsize',6)


semilogy(vp(fp),-piout(fp), 'ok')
plnfit = fit(vp(fp)',log(-piout(fp)), 'poly1')
plot(vp,exp(plnfit.p2)*exp(plnfit.p1*vp), 'k')
semilogy(vn(fn),-niout(fn), 'ok')
lnfit = fit(vn(fn)',log(-niout(fn)), 'poly1')
plot(vn,exp(lnfit.p2)*exp(lnfit.p1*vn), 'k')
hold off

legend({'Native nMOS', 'Well pMOS', 'Fit region'}, 'location', 'southeast')
xlabel('$V_{g}$ / V', 'Interpreter', 'LaTeX')
ylabel('$I_{ds}$ / A', 'Interpreter', 'LaTeX')
title('Experiment 1: Gate voltage vs drain-source current', 'Interpreter', 'LaTeX')

d = find(exp(lnfit.p2)*exp(lnfit.p1*vn) > -niout'*2);
Vtn = vn(d(1))
hold on
plot([vn(d(1)), vn(d(1))], [exp(lnfit.p2)*exp(lnfit.p1*vn(d(1))),10^(-20)], 'k')
hold off
text(vn(d(1)), 10^-19, '$V_{tn} = 0.65 V$', 'Interpreter', 'LaTeX')
Itn = -niout(d(1))

d = find(exp(plnfit.p2)*exp(plnfit.p1*vp) > -piout'*2);
Ipn = -piout(d(1))
Vtp = vp(d(1))
hold on
plot([vp(d(1)), vp(d(1))], [exp(plnfit.p2)*exp(plnfit.p1*vp(d(1))),10^(-20)], 'k')
hold off
text(vp(d(1)), 10^-19, '$V_{tp}=1 V$', 'Interpreter', 'LaTeX')
saveas(gcf,'./figs/ex1.eps','epsc')

%%
figure(3)
vp = 1:0.2:5;
fp = find(vp>0 & vp <=4.2);
h1 = plot(vp,-pvout,'+k')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 15 7]);
set(h1, 'linewidth',0.5)
set(gca,'Fontsize',6)
linfitp = fit( vp(fp)', -pvout(fp)', 'poly1')
hold on
plot(vn,nvout,'xk')
plot(vp(fp),-pvout(fp),'ok')
hold off

legend({'Well pMOS','Native nMOS', 'Fit region'}, 'location', 'southeast')
hold on
plot(vp,linfitp.p1*vp + linfitp.p2, 'k')
vn = 1:0.2:5;
fn = find(vn>0 & vn <=4.2)
linfitn = fit( vn(fn)', nvout(fn)', 'poly1')
plot(vn(fn),nvout(fn),'ok')
plot(vn,linfitn.p1*vn + linfitn.p2, '-.k')
hold off
ltitle('Experiment 2: $V_s$ vs $V_g$')
lylabel('$V_s$ / V')
lxlabel('$V_g$ / V')
saveas(gcf,'./figs/ex2vsvg.eps','epsc')

figure(4)
h1 = plot(vp(fp(1:end-1)), diff(-pvout(fp))./diff(vp(fp)),'+k')
set(gcf,'paperunits','centimeters','Paperposition',[0 0 15 4]);
set(h1, 'linewidth',0.5)
set(gca,'Fontsize',6)
hold on
plot(vn(fn(1:end-1)), diff(nvout(fn))./diff(vn(fn)),'xk')
plot(vp(fp(1:end-1)),repmat(linfitp.p1,1,length(vp(fp(1:end-1)))),'k')
plot(vn(fn(1:end-1)),repmat(linfitn.p1,1,length(vn(fn(1:end-1)))),'-.k')
hold off
legend({'Well pMOS', 'Native nMOS'}, 'location', 'southeast')
xlabel('$V_g$ / V', 'Interpreter', 'LaTeX')
ylabel('$\kappa$', 'Interpreter', 'LaTeX')
title('Experiment 2: $\kappa$ vs $V_g$', 'Interpreter', 'LaTeX')
saveas(gcf,'./figs/ex2kappavg.eps','epsc')