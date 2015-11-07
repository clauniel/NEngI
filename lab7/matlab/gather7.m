%% exp 1
[t1, wf1] = get_scope('tds1', 1);
[t2, wf2] = get_scope('tds1', 2);
figure(1);
plot(t1,wf1);
hold on
plot(t2,wf2);
hold off

%% exp 2
[t2_1, wf2_1] = get_scope('tds1', 1);
[t2_2, wf2_2] = get_scope('tds1', 2);
figure(2);
plot(t2_1,wf2_1);
hold on
plot(t2_2,wf2_2);
hold off
%% exp 3
[t3_1, wf3_1] = get_scope('tds1', 1);
[t3_2, wf3_2] = get_scope('tds1', 2);
figure(3);
plot(t3_1,wf3_1);
hold on
plot(t3_2,wf3_2);
hold off
%% exp3 input M = 94.5mV cutoff = 23.5 kHz
freqs = [2.35, 4.7, 9.4, 18.8, 23.5, 47.0, 94, 188, 235]
PPs = [92.37, 91.3, 87.1, 74.1, 67.2, 41.2, 22.1, 10.8, 8.3]
figure(4)
semilogx(freqs, 20*log10(PPs./94.5), '-x')

%% exp 4 input PP = 600mV at device
[t4_1, wf4_1] = get_scope('tds1', 1);
[t4_2, wf4_2] = get_scope('tds1', 2);
figure(5);
plot(t4_1,wf4_1);
hold on
plot(t4_2,wf4_2);
hold off

%% 0.7 volt at Vb
[t5_1, wf5_1] = get_scope('tds1', 1);
[t5_2, wf5_2] = get_scope('tds1', 2);
figure(5);
plot(t5_1,wf5_1);
hold on
plot(t5_2,wf5_2);
hold off

%% exp4 part 2
% pot3 = 2 V
[t6_1, wf6_1] = get_scope('tds1', 1);
[t6_2, wf6_2] = get_scope('tds1', 2);
figure(5);
plot(t6_1,wf6_1);
hold on
plot(t6_2,wf6_2);
hold off
%% pot 3 = 1.50 V
[t7_1, wf7_1] = get_scope('tds1', 1);
[t7_2, wf7_2] = get_scope('tds1', 2);
hold on
plot(t7_1,wf7_1, 'r');
plot(t7_2,wf7_2, 'r');
hold off
%% pot 3 = 1.0 V
[t8_1, wf8_1] = get_scope('tds1', 1);
[t8_2, wf8_2] = get_scope('tds1', 2);
hold on
plot(t8_1,wf8_1, 'k');
plot(t8_2,wf8_2, 'k');
hold off
%% pot 3 = 0.75 V
[t9_1, wf9_1] = get_scope('tds1', 1);
[t9_2, wf9_2] = get_scope('tds1', 2);
hold on
plot(t9_1,wf9_1, 'b');
plot(t9_2,wf9_2, 'b');
hold off
%% pot 3 = 0.5 V
[t10_1, wf10_1] = get_scope('tds1', 1);
[t10_2, wf10_2] = get_scope('tds1', 2);
hold on
plot(t10_1,wf10_1, 'r');
plot(t10_2,wf10_2, 'r');
hold off
%% pot 3 = 0.25 V
[t11_1, wf11_1] = get_scope('tds1', 1);
[t11_2, wf11_2] = get_scope('tds1', 2);
hold on
plot(t11_1,wf11_1, 'k');
plot(t11_2,wf11_2, 'k');
hold off

%% exp 5 Vb = "0", input bias 2V, 50mHz
[t12_1, wf12_1] = get_scope('tds1', 1);
[t12_2, wf12_2] = get_scope('tds1', 2);
figure(5);
plot(t12_1,wf12_1);
hold on
plot(t12_2,wf12_2);
hold off