%synthr = 4.7V weight = 0.503 ref = 2.44 V Vtau = vdd-0.65 V
% experiment 1 Vtau = vdd-0.65
[t1, wf1] = get_scope('tds1', 1) % up slope
%%
[t2, wf2]  = get_scope('tds1', 1) % down slope
%% Vtau = vdd - 0.7
[t3, wf3] = get_scope('tds1', 1) % up slope
plot(t3,wf3)
%%
[t4, wf4]  = get_scope('tds1', 1) % down slope
plot(t4,wf4)
%% Vtau = vdd - 0.75
[t5, wf5] = get_scope('tds1', 1) % up slope
plot(t5,wf5)
%%
[t6, wf6]  = get_scope('tds1', 1) % down slope
plot(t6,wf6)

%% experiment 1 part 2
[t7, wf7]  = get_scope('tds1', 1) % down slope
plot(t7,wf7)

%% experiment 2
% synthr = 4.49 V weight = .682 V ref 2.44V Vtau = Vdd - 0.65
freqs = [10, 15, 20, 25, 30, 40, 50, 60, 70, 80]
means = [1.035, 0.991, 0.918, 0.866, 0.862, 0.837, 0.825, 0.814, 0.809, 0.804]