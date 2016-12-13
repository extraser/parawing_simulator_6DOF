%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parafoil physical parameters                                            %
% Authors:  Stefano Farì (stefano.fari@mail.polimi.it)                    %
%           Davide Grande (davide.grande@mail.polimi.it)                  %  
%           Mattia Giurato (mattia.giurato@polimi.it)                     %
% Date: 13/12/2016                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all

%% General constants
gravity = 9.81;

%% Mass
mass_parachute = 13;                                                       %[kg]
mass_body = 135;                                                           %[kg]
mass = mass_parachute + mass_body;                                         %[kg]
inertia_tensor = [2.5  0   0 ;                                             %[kg*m^2]
                   0   2.5 0 ;
                   0   0   1];
  
inertia_tensor_inv = inertia_tensor\eye(3);                                %[kg*m^2]
  
surface_parachute = 21;                                                    %[m^2]
surface_body = 0.5;                                                        %[m^2]

%% Kinematic chain
Xgp = [0, 0, -7.5]';
Xgb = [0, 0, 0.5]';

%% Aerodynamics coefficients
CL0 = 0.4;
CD0 = 0.15;
CLa = 2;
CDa = 1;
CDpa = CDa;
Cdo = 0.15;
Clp = -0.1;
Clphi = -0.05;
Cmq = -2;
Cmo = 0.018;
Cnr =-0.07;
Cm_alpha = -0.2;

%% Apparent mass
rho = 1.225;
a = 0.5;
b = 7;
c = 3;
t = 0.3;
AR = b/c;

ka = 0.848 * pi/4;
kb = 0.339 * pi/4;
kc = ( AR / (AR + 1) ) * ( pi/4 );
A = ka * rho * t^2 * b * ( 1 + (8/3)*a^3 );
B = kb * rho * ( t^2 + 2 * a^2 * ( 1 - t^2 ) ) * c;
C = kc * rho * c^2 * b * sqrt( 1 + 2 * a^2 * ( 1 - t^2 ) );

Mf = [A 0 0;
      0 B 0;
      0 0 C];

%% Apparent moment
kaa = 0.055 * AR / ( 1 + AR );
kbb = 0.0308 * AR / ( 1 + AR );
kcc = 0.0555;

IA = kaa * rho * c^2 * b^3;
IB = kbb * rho * c^4 * b * ( 1 + pi/6 * ( 1 + AR ) * AR * a^2 * t^2 );
IC = kcc * rho * t^2 * b^3 * ( 1 + 8 * a^2 );

If = [IA  0   0  ;
      0   IB  0  ;
      0   0   IC];

%% END OF CODE
