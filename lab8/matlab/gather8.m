%% experiment 1
%led intensity 11.16 mW/m^2 * 226

% dark current at 5 V reverse bias 0.0049 nA
% photocurrent at red LED 5 V
i1 = iv(0,repmat(5,1,100))
%%
ired = mean(i1(30:70))

%% photocurrent at green LED 5 V 9.82mW/m^2 * 226
igreen = iv(0,repmat(5,1,100))
%%
imeangreen = mean(igreen)

%% experiment 2 with green LED
% dark voltage
voutdark = vv(repmat(0,1,20))
%%
voutdarku = mean(voutdark)
% full power led 0.0121 Vout
% strip 1 0.3984 Vout
% strip 2 0.4444 Vout
% strip 3 0.5034 Vout
% strip 4 0.5615 Vout
% strip 4 + no LED 0.6824
semilogx([1, 10, 100, 1000],[0.3984, 0.4444, 0.5034, 0.5615], '*')
