clear; clc; clf
colordef white

% constant coefficients
g=9.8; %acceleration of gravity m/s^2
L=3; %length of string in m

dt=0.15; % timestep
T=5; % total time
t=0:dt:T; theta=t; omega=t;

% initial conditions
theta(1)=pi/4;
omega(1)=0;

xmax=4;
ymax=4;
n=0;
for n=1:length(t)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%  Write your formula's below, end each with a semicolon %%%%
    theta(n+1) = theta(n) + dt*(omega(n));
    omega(n+1) = omega(n) + dt*((-g/L)*sin(theta(n)));

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x(n)=L*cos(pi/2-theta(n));
    y(n)=-L*sin(pi/2-theta(n));
    if abs(x(n))>=xmax
        xmax=abs(x(n));
    end
    if abs(y(n))>=ymax
        ymax=abs(y(n));
    end
    subplot(1,2,1)
    plot(x(n),y(n),'.','markersize',30)
    hold on
    plot([0 x(n)],[0 y(n)],'k--','linewidth',3)
    xlabel('x','fontname','Times','fontsize',20,'fontweight','normal');
    ylabel('y','fontname','Times','fontsize',20,'fontweight','normal');
    axis([-xmax xmax -ymax ymax])
    axis square
    hold off
    subplot(1,2,2)
    plot(t(1:n),theta(1:n),'k')
    hold on
    xlabel('t','fontname','Times','fontsize',20,'fontweight','normal');
    ylabel('\theta','fontname','Times','fontsize',20,'fontweight','normal');
    axis([0 T -2*pi 2*pi])
    title(['\Delta t=' num2str(dt)],'FontWeight','bold','FontSize',16,'FontName','Times');
    axis square
    drawnow
end

