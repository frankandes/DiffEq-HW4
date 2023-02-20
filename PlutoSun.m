%% Sun-Pluto System %%
clear; clc; clf
colordef black
% parameters (in metric) %
G=6.673e-11; % universal graviational constant
m=1989100e24; % mass of the sun

dt=10*24*60*60; %time-step in seconds
T=100*365*24*60*60; %duration in seconds
t=0:dt:T; x=t; y=t; Vx=t; Vy=t; %preallocate

%Initial conditions (in m and m/s)
x(1)=-3.1880e+12;
y(1)=-3.0858e+12;
Vx(1)=2.5803e3;
Vy(1)=-2.6657e3; % minimum orbital velocity
xmax=5e12;
ymax=5e12;

for n=1:length(t)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%  Write your formula's below, end each with a semicolon %%%%
    Vx(n+1) = Vx(n) + dt*(-1*x(n)*m*G)/(((x(n)^(2))+(y(n)^(2)))^(1.5));
    Vy(n+1) = Vy(n) + dt*(-1*y(n)*m*G)/(((x(n)^2)+(y(n)^2))^(1.5));
    
    x(n+1) = x(n) + dt*(Vx(n));
    y(n+1) = y(n) + dt*(Vy(n));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if abs(x(n))>=xmax
        xmax=abs(x(n));
    end
    if abs(y(n))>=ymax
        ymax=abs(y(n));
    end
    if rem(n, 100) == 0 % The condition added (Szymon Bartnik)
        plot(x(n),y(n),'.','markersize',30)
        hold on
        plot(0,0,'g.','markersize',60)
        plot(x(1:n),y(1:n),'w--','linewidth',3)
        xlabel('x','fontname','Times','fontsize',20,'fontweight','normal');
        ylabel('y','fontname','Times','fontsize',20,'fontweight','normal');
        axis([-xmax xmax -ymax ymax])
        hold off
        drawnow
    end
end
