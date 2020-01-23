clear all;close all
global k m1 m2 l l0 d A omega
k=5;l=100;l0=15;d=20;m1=5;m2=5;A=2;omega=50;
options = odeset('RelTol',1e-10);
fig1 = figure('Name','Poincaré','visible','off');

for i = 0:0.001:0.002
    [t,theta] = ode45('pendulum_double_ressort',[0:1:10000],[pi/4-i 0 0 0], options);
    if i == 0
        plot(theta(1:size(theta),1), theta(1:size(theta),2), 'r.', 'Markersize', 3);
        hold on;
    elseif i == 0.001
        plot(theta(1:size(theta),1), theta(1:size(theta),2), 'b.', 'Markersize', 3);
        hold on;
    else
        plot(theta(1:size(theta),1), theta(1:size(theta),2), 'g.', 'Markersize', 3);
    end
end

set(fig1,'visible','on');
figure(fig1);
title('Poincaré');
xlabel('theta');
ylabel('d\theta/dt (rad/s)');
