%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parafoil physical parameters                                            %
% Authors:  Stefano Fari' (stefano.fari@mail.polimi.it)                   %
%           Davide Grande (davide1.grande@mail.polimi.it)                 %
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

b = 6.94;                                                                     %[m]
c = 4.3;                                                                     %[m]
t = 0.3;                                                                   %[m]

S_parachute = 16.7;                                                          %[m^2]
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
% Parameters of Rogallo as found by AVL (Ahmed)
CL_0_parachute = 2.68; % AVL
CL_alpha_parachute = 2.12; % AVL

CD_0_parachute = 0.75; % AVL
CD_alpha_parachute = 1.69; % AVL

CD_0_payload = 0.4;
CD_alpha_payload = 2;

Cl_p = -0.13; % AVL
Cm_q = -0.42; % AVL
Cn_r = -0.02; % AVL
Cl_r = 0.433; % AVL
Cn_p = -0.283; % AVL
Cy_p = 0.672; % AVL
Cy_r = -0.221; % AVL

Cl_beta = -0.176; % AVL
Cy_beta = -0.166; % AVL
Cn_beta = 0.0016; % AVL (Directional instability)

Cm_0 = -0.86; % AVL
Cm_alpha = -0.37; % AVL

CL_dalpha = 0.0001;
CD_dalpha = 0.0001;
CL_ds = 0.21;
CD_ds = 0.3;
Cl_dalpha = 0.0021;
Cn_dalpha = 0.004;

%% END OF CODE