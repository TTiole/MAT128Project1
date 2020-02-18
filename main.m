%% Part i
phi = @(z) z^2 - 1.25;

figure;
FilledJulia(phi, [(1+sqrt(6))/2, (1-sqrt(6))/2], -1.8, 1.8, -0.7, 0.7, 0.01);

phi = @(z) z^2;

figure
FilledJulia(phi, [(1+sqrt(6))/2, (1-sqrt(6))/2], -1, 1, -1, 1, 0.01);
pbaspect([1 1 1])

%% Part ii
c = 0.36 + 0.1*1i;
phi = @(z) z^2 + c;
fxdpnts = roots([1, -1, c])';

figure;
FilledJulia(phi, fxdpnts, -1.8, 1.8, -0.7, 0.7, 0.01);

figure;
FilledJulia(phi, fxdpnts, 0, 2, -2, 0, 0.01);


c = -0.123 - 0.745*1i;
phi = @(z) z^2 + c;
fxdpnts = roots([1, -1, c])';

figure;
FilledJulia(phi, fxdpnts, -1.8, 1.8, -0.7, 0.7, 0.01);

figure;
hold on
FilledJulia(phi, fxdpnts, -2, 2, -2, 2, 0.01);
syms x y
fimplicit((x).^2 + (y).^2 -4, '--')
fimplicit((x).^2 + (y).^2 -1, '--')
axis equal
hold off


%% Part iii
ar = -1.8; br = 1.8; ai = -0.7; bi = 0.7; step = 0.01;
c = 0.36 + 0.1*1i;
figure;
Julia(c, ar, br, ai, bi, step);

c = -0.123 - 0.745*1i;
figure;
Julia(c, ar, br, ai, bi, step);