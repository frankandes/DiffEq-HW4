%this makes a plot of the Lorenz attractor for
%red/cyan 3D glasses! N.S.B 02.02.2020
colordef white

clear;clc;clf;

theta=0.05; %3D rotation angle to play with

dt=0.0002; %numerical timestep

T=9; N=T/dt; %duration and # of points
x=zeros(1,N); y=x; z=x; xr=x; yr=y; zr=z;
x(1)=5; y(1)=5; z(1)=5; %initial conditions
%Forward Euler
for n=1:N
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%  Write your formula's below, end each with a semicolon %%%%
    x(n+1)=x(n) + dt*(40*(y(n)-x(n))) + (dt*0.16*x(n)*z(n));
    y(n+1)=y(n) + dt*(55*x(n)) + dt*(20*y(n)) - dt*(x(n)*(z(n)));
    z(n+1)=z(n) + dt*(-0.65*((x(n))^2)) + dt*(y(n)*x(n)) + dt*((11/6)*z(n));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%rotation matrix
A=[cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1];

%rotation
for n=1:N
    r=A*[x(n);y(n);z(n)];
    xr(n)=r(1);yr(n)=r(2);zr(n)=r(3);
end

plot3(x,y,z,'r','linewidth',0.5)%original in red
hold on
plot3(xr,yr,zr,'c','linewidth',0.5)%rotated in cyan
view(61.4588,15.5955)% for three-scroll Lorenz
% view(119.6275,9.6426) % for normal Lorenz