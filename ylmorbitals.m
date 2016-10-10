clear all; close all; clc;
ylms=0;
orbitals=0;
both=0;
q=input('type ylms or orbitals or both:  ');
if q==ylms || q==both
    ylms=1;
end
if q==orbitals 
    orbitals=1;
end
delta=pi/40;
theta=0:delta:pi;
phi=0:delta:2*pi;
[phi,theta]=meshgrid(phi,theta);
%I seem to recall that converting the Ylm's to cartesian coordinates and
%doing a meshgrid in cartesian space did not work...but I should
%double check

%x, y & z are the simply the conversion from r, theta and phi in spherical
%coordinates

%r is the spherical harmonic since it is an isosurface of the spherical
%harmonic that we are wanting to plot

%Orbitals are graphs of some isosurface of the probability function =
%conj(psi).*psi

%% l=0 orbital
% Y00=sqrt(1/(4*pi))
r00=1;
R00=conj(r00).*r00;
x00=R00.*sin(theta).*cos(phi);
y00=R00.*sin(theta).*sin(phi);
z00=R00.*cos(theta);

%% l=1 (3)
%Y1_1=sqrt(3/(8*pi))*(x-i*y);  
r1_1=sin(theta).*(cos(phi)-i*sin(phi));
R1_1=conj(r1_1).*r1_1;
x1_1=R1_1.*sin(theta).*cos(phi);
y1_1=R1_1.*sin(theta).*sin(phi);
z1_1=R1_1.*cos(theta);

%Y10=sqrt(3/(4*pi))*z; 
r10=cos(theta);
R10=conj(r10).*r10;
x10=R10.*sin(theta).*cos(phi);
y10=R10.*sin(theta).*sin(phi);
z10=R10.*cos(theta);

%Y11=-sqrt(3/(8*pi))*(x+i*y); 
r11=-sin(theta).*(cos(phi)+i*sin(phi));
R11=conj(r11).*r11;
x11=R11.*sin(theta).*cos(phi);
y11=R11.*sin(theta).*sin(phi);
z11=R11.*cos(theta);

%% l=2 (5)
%Y2_2=sqrt(5/(96*pi))*3*(x+i*y).^2; 
r2_2=(sin(theta).^2).*(cos(2*theta)-i*sin(2*theta));
R2_2=conj(r2_2).*r2_2;
x2_2=R2_2.*sin(theta).*cos(phi);
y2_2=R2_2.*sin(theta).*sin(phi);
z2_2=R2_2.*cos(theta);

%Y2_1=sqrt(5/(24*pi))*3*z.*(x-i*y);
r2_1=sin(theta).*cos(theta).*(cos(phi)-i*sin(phi));
R2_1=conj(r2_1).*r2_1;
x2_1=R2_1.*sin(theta).*cos(phi);
y2_1=R2_1.*sin(theta).*sin(phi);
z2_1=R2_1.*cos(theta);

%Y20=sqrt(5/(4*pi))*(1.5*z.^2-.5);
r20=(3*cos(theta).^2-1);
R20=conj(r20).*r20;
x20=R20.*sin(theta).*cos(phi);
y20=R20.*sin(theta).*sin(phi);
z20=R20.*cos(theta);

%Y21=-sqrt(5/(24*pi))*3*z.*(x+i*y);
r21=-sin(theta).*cos(theta).*(cos(phi)+i*sin(phi));
R21=conj(r21).*r21;
x21=R21.*sin(theta).*cos(phi);
y21=R21.*sin(theta).*sin(phi);
z21=R21.*cos(theta);

%Y22=sqrt(5/(96*pi))*3*(x+i*y).^2;
r22=(sin(theta).^2).*(cos(2*phi)+i*sin(2*phi));
R22=conj(r22).*r22;
x22=R22.*sin(theta).*cos(phi);
y22=R22.*sin(theta).*sin(phi);
z22=R22.*cos(theta);

%%I need to make a linear combination of the orbitals to get px, py pz,
%%d...:
%%px=-1/sqrt(2)*(Y11-Y1_1)=C*x
px=-1/sqrt(2)*(r11-r1_1);
Rpx=conj(px).*px;
xpx=Rpx.*sin(theta).*cos(phi);
ypx=Rpx.*sin(theta).*sin(phi);
zpx=Rpx.*cos(theta);
%%py=i/sqrt(2)*(Y11+Y1_1)=C*y;
py=i/sqrt(2)*(r11+r1_1);
Rpy=conj(py).*py;
xpy=Rpy.*sin(theta).*cos(phi);
ypy=Rpy.*sin(theta).*sin(phi);
zpy=Rpy.*cos(theta);
%%pz=Y10=C*z;
pz=r10;
%%dxy=C*xy;
dxy=-i/(2*sqrt(2))*(r22-r2_2);
Rdxy=conj(dxy).*dxy;
xdxy=Rdxy.*sin(theta).*cos(phi);
ydxy=Rdxy.*sin(theta).*sin(phi);
zdxy=Rdxy.*cos(theta);
%%dyz=C*yz;
dyz=i/sqrt(2)*(r21+r2_1);
Rdyz=conj(dyz).*dyz;
xdyz=Rdyz.*sin(theta).*cos(phi);
ydyz=Rdyz.*sin(theta).*sin(phi);
zdyz=Rdyz.*cos(theta);
%%dzx=C*zx;
dzx=-1/sqrt(2)*(r21-r2_1);
Rdzx=conj(dzx).*dzx;
xdzx=Rdzx.*sin(theta).*cos(phi);
ydzx=Rdzx.*sin(theta).*sin(phi);
zdzx=Rdzx.*cos(theta);
%%dx2_y2=C*.5*(x^2-y*2);
dx2y2=1/sqrt(2)*(r22+r2_2);
Rdx2y2=conj(dx2y2).*dx2y2;
xdx2y2=Rdx2y2.*sin(theta).*cos(phi);
ydx2y2=Rdx2y2.*sin(theta).*sin(phi);
zdx2y2=Rdx2y2.*cos(theta);
%%d_z^2=C*(1/(2*sqrt(3)))*(3*z^2-r^2);
dz2=r20;


if ylms==1
    figure(1)
    surf(x00,y00,z00)
    title('s-orbital: Y_0^0')
    axis square
    figure(2)
    surf(x1_1,y1_1,z1_1)
    axis square
    title('Y_1^-^1')
    figure(3)
    surf(x10,y10,z10)
    axis square
    title('p-orbital: Y_1^0')
    figure(4)
    surf(x11,y11,z11)
    axis square
    title('Y_1^1')
    figure(5)
    surf(x2_2,y2_2,z2_2)
    axis square
    title('Y_2^-^2')
    figure(6)
    surf(x2_1,y2_1,z2_1)
    axis square
    title('Y_2^-^1')
    figure(7)
    surf(x20,y20,z20)
    axis square
    title('d-orbital: Y_2^0')
    figure(8)
    surf(x21,y21,z21)
    axis square
    title('Y_2^1')
    figure(9)
    surf(x22,y22,z22)
    axis square
    title('d-orbital: Y_2^2')
end    
if orbitals==1
    figure(1)
    surf(x00,y00,z00)
    title('s-orbital: Y_0^0')
    axis square
    figure(2)
    surf(xpx,ypx,zpx)
    axis square
    title('p_x: (1/sqrt(2))*Y_1^-^1-Y_1^1')
    figure(3)
    surf(xpy,ypy,zpy)
    axis square
    title('p_y: (i/sqrt(2))*Y_1^-^1+Y_1^1')
    figure(4)
    surf(x10,y10,z10)
    axis square
    title('p_z: Y_1^0')
    figure(5)
    surf(xdxy,ydxy,zdxy)
    axis square
    title('d_x_y: Y_2^-^2-Y_2^2')
    figure(6)
    surf(xdyz,ydyz,zdyz)
    axis square
    title('d_y_z: i*(Y_2^1+Y_2^-^1)')
    figure(7)
    surf(xdzx,ydzx,zdzx)
    axis square
    title('d_z_x: Y_2^1-Y_2^-^1')
    figure(8)
    surf(xdx2y2,ydx2y2,zdx2y2)
    axis square
    title('dx^2y^2: Y_2^2+Y_2^-^2')
    figure(9)
    surf(x22,y22,z22)
    axis square
    title('dz^2: Y_2^2')
end
    