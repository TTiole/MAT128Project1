%% Part i
phi = @(z) z^2 - 1.25;

figure;
FilledJulia(phi, [(1+sqrt(6))/2, (1-sqrt(6))/2], -1.8, 1.8, -0.7, 0.7, 0.01);

%% Part ii
c = 0.36 + 0.1*1i;
phi = @(z) z^2 + c;
fxdpnts = roots([1, -1, c])';

figure;
FilledJulia(phi, fxdpnts, -1.8, 1.8, -0.7, 0.7, 0.01);



c = -0.123 - 0.745*1i;
phi = @(z) z^2 + c;
fxdpnts = roots([1, -1, c])';

figure;
FilledJulia(phi, fxdpnts, -1.8, 1.8, -0.7, 0.7, 0.01);

%% Part iii
ar = -1.8; br = 1.8; ai = -0.7; bi = 0.7; step = 0.01;
c = 0.36 + 0.1*1i;
figure;
Julia(c, ar, br, ai, bi, step);

c = -0.123 - 0.745*1i;
figure;
Julia(c, ar, br, ai, bi, step);