%% Vi13 = 4.1 V Vi14 = 4.1
[t1, wf1] = get_scope('tds1', 1)
%%
plot(t1,wf1)

%% Vi14=4.1V Vi13=4.2V
[t2, wf2] = get_scope('tds1', 1)
%%
plot(t2,wf2)

%% ejercicio dos
%% Vb = 0.85 Vgain = 5
V1 = -0.1:0.01:0.1;
V2 = 0.1:-0.01:-0.1;
I1 = iv(V1, 0);
I2 = iv(V2, 0);

%%
plot(V1,I1, '-x')
hold on
plot(V2,I2, '-o')
hold off

%% Vb = 0.85 Vgain = 4
V11 = -0.1:0.01:0.1;
V21 = 0.1:-0.01:-0.1;
I11 = iv(V11, 0);
I21 = iv(V21, 0);
%%
Vx = -0.01:0.001:0.01;
Ix = iv(Vx, 0)

%%
plot(V11,I11, '-x')
hold on
plot(V21,I21, '-o')
plot(Vx, Ix, '+')
hold off

%% Vb = 0.85 Vgain = 4.5
V12 = -0.5:0.05:0.5;
V22 = 0.5:-0.05:-0.5;
I12 = iv(V12, 0);
I22 = iv(V22, 0);

%%
plot(V12,I12, '-x')
hold on
plot(V22,I22, '-o')
hold off