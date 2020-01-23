clear all;close all
global k m1 m2 l l0 d A omega
k=5;l=32;l0=15;d=20;m1=1;m2=5;A=2;omega=50;
options = odeset('RelTol',1e-10);
fig1 = figure('Name','Diagramme de bifurcation','visible','off');
    
for m1=0:0.001:2
    variable = k;
    for i=0:0.001:0.002
        [t,theta] = ode45(@pendulum_double_ressort,[0:1:100],[pi/4-i 0 0 0], options);
        if i== 0
            plot(variable,theta(1:2:size(theta),4),'gs','MarkerSize',1);
            hold on;
        elseif i == 0.001
            plot(variable,theta(1:2:size(theta),4),'rs','MarkerSize',1);
            hold on;
        else
            plot(variable,theta(1:2:size(theta),2),'bs','MarkerSize',1);
        end
    end 
end

set(fig1,'visible','on');
figure(fig1);
axis([0 20 -2 2]);
title('Diagramme de bifurcation');
xlabel('omega');
ylabel('d\theta/dt (rad/s)');

