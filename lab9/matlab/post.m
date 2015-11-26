tau_o = 1/(A*16);
tau_i = 1;
k = 0.7;
A = 100;
Ac = 10;
H = A*26e-3/(1e-8)*tf([tau_o 1],[tau_o*tau_i, tau_i+tau_o, 1+A*Ac*k])
figure(1)
step(H)
figure(2)
pzmap(H)