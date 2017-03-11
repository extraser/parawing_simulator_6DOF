%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parafoil physical parameters                                            %
% Authors:  Stefano Fari' (stefano.fari@mail.polimi.it)                    %
%           Davide Grande (davide.grande@mail.polimi.it)                  %
%           Mattia Giurato (mattia.giurato@polimi.it)                     %
% Date: 13/12/2016                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% General constants
gravity = 9.81;                                                            %[m*s^-2]
air_density = 1.225;                                                       %[kg*m^-3]
radTodeg = 180/pi;
degToRad = pi/180;

%% Geometry
X_gp = [0, 0, -7.5]';                                                      %[m]
X_gb = [0, 0, 0.5]';                                                       %[m]

b = 7;                                                                     %[m]
c = 3;                                                                     %[m]
t = 0.3;                                                                   %[m]

S_parachute = 21;                                                          %[m^2]
S_payload = 0.5;                                                           %[m^2]

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

%% Aerodynamics coefficients
CL_0_parachute = 0.4;
CL_alpha_parachute = 2;

CD_0_parachute = 0.15;
CD_alpha_parachute = 1;

CD_0_payload = 0.4;
CD_alpha_payload = 2;

Cl_p = -0.1;
Cm_q = -2;
Cn_r = -0.07;

Cl_beta = -0.05; 

Cm_0 = 0.018; 
Cm_alpha = -0.2;

CL_dalpha = 0.0001;
CD_dalpha = 0.0001;
CL_ds = 0.21;
CD_ds = 0.3;
Cl_dalpha = 0.0021;
Cn_dalpha = 0.004;

%% END OF CODE