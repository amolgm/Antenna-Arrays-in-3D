%% MATLAB code for Endfire Array in 3D
% Version 1.0

%% Pre-initialisation
clear;
clc;
close all;

%% Accepting inputs

N = input('\nEnter the number of Elements::(eg., 5,6,7,etc)->');
d = input('\nEnter the distance between the elements::(eg.,0.4,0.5,etc)->');

tic;

[theta phi] = meshgrid(linspace(0,2*pi,360));
k = 2*pi;
c = (k.*d)./2;

%% Calculating Array element(AE) and Array Factor(AF)

num = ((1./N).*sin(N.*c.*(cos(theta)+1)));
den = sin(c.*(cos(theta)+1));

AF  = num./den;
AF  = AF - min(min(AF));

AE = sqrt(1- ((sin(theta).^2).*(cos(phi).^2)));

%% Calculating Array Pattern(AP)

% Array Pattern is calculated as follows,
%
% Array Pattern = ArrayFactor * ArrayElement

AP = AF .* AE;

toc;

%% Plotting results

[x1,y1,z1] = sph2cart(phi,theta,AE);

surf(x1,y1,z1,'FaceLighting','phong',...
    'LineStyle','none',...
    'FaceColor',[1 0 0]);

legend('Array Element','Location','SouthEastOutside')

axis image

light('Style','local',...
    'Position',[-10.162701816704 -0.924193626363743 14.9951905283833]);

figure

[x2,y2,z2] = sph2cart(phi,theta,AF);

surf(x2,y2,z2,'FaceLighting','phong',...
    'LineStyle','none',...
    'FaceColor',[1 0 0]);

legend('Array Factor','Location','SouthEastOutside')

axis image

light('Style','local',...
    'Position',[-10.162701816704 -0.924193626363743 14.9951905283833]);

figure

[x3,y3,z3] = sph2cart(phi,theta,AP);

surf(x3,y3,z3,'FaceLighting','phong',...
    'LineStyle','none',...
    'FaceColor',[1 0 0]);

legend('Array Pattern of Endfire Array','Location','SouthEastOutside')

axis image

light('Style','local',...
    'Position',[-10.162701816704 -0.924193626363743 14.9951905283833]);
