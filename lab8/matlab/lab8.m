%% experiment 1
dark_current = 0.0049e-9;
%calculate w/m^2 for red and green diode
irra_green = 9.82e-3*226
n_type_area = 98e-12
incident_power = irra_green*n_type_area
h = 6.62607004e-34;
c= 299792458;
green_energy = h*c/565e-9;
q= 1.60217662e-19
incident_flux = incident_power/green_energy
electron_flux = (imeangreen-dark_current)/q
QE = electron_flux/incident_flux

(imeangreen-dark_current)*h*c/565e-9/(q*incident_power)
%%
irra_red = 11.16e-3*226
n_type_area = 98e-12
incident_power = irra_red*n_type_area
h = 6.62607004e-34;
c= 299792458;
red_energy = h*c/635e-9;
q= 1.60217662e-19
incident_flux = incident_power/red_energy
electron_flux = (ired-dark_current)/q
QE = electron_flux/incident_flux

(ired-dark_current)*h*c/635e-9/(q*incident_power)


%% experiment 2
% full power led 0.0121 Vout
% strip 1 0.3984 Vout
% strip 2 0.4444 Vout
% strip 3 0.5034 Vout
% strip 4 0.5615 Vout
% strip 4 + no LED 0.6824
figure(1)
semilogx([1, 1e-6, 1e-7, 1e-8, 1e-9, 1e-13],[0.0121,0.3984, 0.4444, 0.5034, 0.5615,0.6824], 'k*')
hold on
semilogx([1e-15,1e-0], [0.6824, 0.6824], 'k')
hold off
ylim([0,0.8])
text(1e-7, 0.7, 'dark current dominates', 'Interpreter', 'LaTeX')
text(1e-5,0.4, 'strip 1 + led', 'Interpreter', 'LaTeX') 
text(1*10^(-6.5),0.45, 'strip 2 + led', 'Interpreter', 'LaTeX')
text(1*10^(-7.5),0.51, 'strip 3 + led', 'Interpreter', 'LaTeX')
text(1*10^(-8.5),0.56, 'strip 4 + led', 'Interpreter', 'LaTeX')
text(1*10^(-12.5), 0.65, 'strip 4 + no light', 'Interpreter', 'LaTeX')
text(1*10^(-3.7), 0.02, 'no strip + led', 'Interpreter', 'LaTeX')
xlabel('relative light intensity', 'Interpreter', 'LaTeX', 'Interpreter', 'LaTeX')
ylabel('$V_{out}$ / V', 'Interpreter', 'LaTeX')
title('Source-follower receptor output vs. light intensity', 'Interpreter', 'LaTeX')
set(gcf,'units', 'centimeters', 'position', [0, 0, 8, 4], 'paperunits','centimeters','PaperSize',[8 4]);
set(gca,'DefaultLineLineWidth', 0.5)
set(gca,'Fontsize',6)
saveas(gcf,'./figs/srcfoll','epsc')