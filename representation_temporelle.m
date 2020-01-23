clear all;close all
global k m1 m2 l l0 d A omega
k=5;l=32;l0=12;d=20;m1=0.01;m2=1;A=1;omega=10;    
options = odeset('RelTol',1e-10);
fig1 = figure('Name','Le pendule à double ressort','visible', 'off');
 
for j=0:0.001:0.002
    [t,theta] = ode45(@pendulum_double_ressort,[0:10:1000],[pi/4-j 0 0 0], options);
    for i = 2:max(size(theta))
        if j == 0
            plot(t(i-1:i),theta(i-1:i,1),'Color','b','LineWidth',0.2); 
            hold on;
        elseif j == 0.001
            plot(t(i-1:i),theta(i-1:i,1),'Color','r','LineWidth',0.2); 
            hold on;
        else
            plot(t(i-1:i),theta(i-1:i,1),'Color','g','LineWidth',0.2); 
        end
    end
end
set(fig1,'visible','on');
figure(fig1);
title(' Représentation du mouvement');
xlabel('t(s)')
ylabel('dq1/dt')
  

 
 
