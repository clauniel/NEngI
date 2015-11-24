%% experiment 1 500 mV PP on function gen 1VDC
%% lightest strip
[t1, wf1] = get_scope('tds1', 1)
plot(t1,wf1)
[t2, wf2] = get_scope('tds1', 2)
hold on
plot(t2,wf2)
hold off
%% strip nr 3 from lightest side
[t3, wf3] = get_scope('tds1', 1)
plot(t3,wf3)
[t4, wf4] = get_scope('tds1', 2)
hold on
plot(t4,wf4)
hold off

%% extra credit loop gain no strips with lid 50 Hz 500mV PP on function gen 1VDC
[t5, wf5] = get_scope('tds1', 1) % Vin
plot(t5,wf5)
%%
[t6, wf6] = get_scope('tds1', 2) % Vout
plot(t6,wf6)

%%
[t7, wf7] = get_scope('tds1', 1) % Vfb
plot(t7,wf7)

%% experiment 2.1 2 VPP 2 VDC 
[t8, wf8] = get_scope('tds1', 1)
plot(t8,wf8)
[t9, wf9] = get_scope('tds1', 2)
hold on
plot(t9,wf9)
hold off

%% experiment 2.2 20 Hz 500 mVPP on function gen 1 VCD
%[t10, wf10] = get_scope('tds1', 1)
%plot(t10,wf10)
% no strip
[t10, wf10] = get_scope('tds1', 2)
plot(t10,wf10)
%% lightest strip
[t11, wf11] = get_scope('tds1', 2)
plot(t11,wf11)

%% strip 2
[t12, wf12] = get_scope('tds1', 2)
plot(t12,wf12)
%% strip 3
[t13, wf13] = get_scope('tds1', 2)
plot(t13,wf13)
%% strip 4
[t14, wf14] = get_scope('tds1', 2)
plot(t14,wf14)

%% enable cascode at 2V
% no strip
[t15, wf15] = get_scope('tds1', 2)
plot(t15,wf15)
%% strip 1
[t16, wf16] = get_scope('tds1', 2)
plot(t16,wf16)
%% strip 2
[t17, wf17] = get_scope('tds1', 2)
plot(t17,wf17)
%% strip 3
[t18, wf18] = get_scope('tds1', 2)
plot(t18,wf18)
%% strip 4
[t19, wf19] = get_scope('tds1', 2)
plot(t19,wf19)

%% extra credit tobi element
vsweep = 5:-0.1:0;
% Vw bigger than Vg
iVg = iv(0, vsweep)
%% Vg bigger than Vw
iVw = iv(0, vsweep)