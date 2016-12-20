%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parafoil physical parameters                                            %
% Authors:  Stefano Farì (stefano.fari@mail.polimi.it)                    %
%           Davide Grande (davide.grande@mail.polimi.it)                  %  
%           Mattia Giurato (mattia.giurato@polimi.it)                     %
% Date: 13/12/2016                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% General constants
gravity = 9.81;                                                            %[m*s^-2]
air_density = 1.225;                                                       %[kg*m^-3]
rad2deg = 180/pi;

%% Mass
mass_parachute = 13;                                                       %[kg]
mass_body = 135;                                                           %[kg]
mass = mass_parachute + mass_body;                                         %[kg]
mass_matrix = diag([mass mass mass]);
mass_matrix_inv = mass_matrix\eye(3);
inertia_tensor = [2.5  0   0 ;                                             %[kg*m^2]
                   0   2.5 0 ;
                   0   0   1];
  
inertia_tensor_inv = inertia_tensor\eye(3);
  
S_parachute = 21;                                                          %[m^2]
S_payload = 0.5;                                                           %[m^2]

%% Kinematic chain
X_gp = [0, 0, -7.5]';
X_gb = [0, 0, 0.5]';

%% Aerodynamics coefficients
CD_0_parachute = 0.15;
CD_alpha_parachute = 1;
CL_0_parachute = 0.4;
CL_alpha_parachute = 2;
CD_0_payload = 0.4;
CD_alpha_payload = 2;

Clp = -0.1;
Cmq = -2;
Cnr = -0.07;
Clphi = -0.05; 
Cm0 = 0.018; 
Cmalpha = -0.2;
b = 7; 
c = 3; 

%% END OF CODE