clear all; close all;
global k m1 m2 l l0 d A omega 
k=5;l=32;l0=15;d=20;m1=1;m2=1;A=2;omega=50;
figure('NumberTitle','off','Name','Projetmeca','Renderer','OpenGL','Color','w','Position',[100 100 500 500])
options = odeset('RelTol',1e-10);

[t,theta] = ode45('pendulum_double_ressort',[0:0.01:40],[pi/4 0 0 0],options);
[t,theta2] = ode45 ('pendulum_double_ressort', [0:0.01:40],[pi/4-0.001 0 0 0], options);
[t,theta3] = ode45 ('pendulum_double_ressort', [0:0.01:40],[pi/4-0.002 0 0 0], options);
   for i=2:max(size(t))
   box on; grid on;
   line([theta(i-1,1) theta(i,1)],[theta(i-1,2) theta(i,2)],'Color','b','LineWidth',0.2);
   line([theta2(i-1,1) theta2(i,1)],[theta2(i-1,2) theta2(i,2)],'Color','r','LineWidth',0.2);
   line([theta3(i-1,1) theta3(i,1)],[theta3(i-1,2) theta3(i,2)],'Color','m','LineWidth',0.2);
   xlabel('Position (rad)'); ylabel('d\theta/dt (rad/s)')
   drawnow;
   end