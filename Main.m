%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parafoil simulator                                                      %
% Authors:  Stefano Fari' (stefano.fari@mail.polimi.it)                    %
%           Davide Grande (davide.grande@mail.polimi.it)                  %  
%           Mattia Giurato (mattia.giurato@polimi.it)                     %
% Date: 19/12/2016                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars
close all
clc
    
%% Launch SIMULATOR
simulation_time = 150;
initial_position = [0 0 -1000]';

sim Simulator_6DOF

pos_ned = state.Data(:, 1:3);
vel_body = state.Data(:, 4:6);
ang_rates_body = state.Data(:, 7:9);
attitude = state.Data(:, 10:12);
time = state.Time;

%% Plot OUTPUT
figure('name','POSITION_EARTH')
plot(time, [pos_ned(:,1), pos_ned(:,2), -pos_ned(:,3)]);
grid minor
xlabel('[s]')
ylabel('[m]')
legend('N', 'E', 'Altitude')

figure('name','VELOCITY_BODY')
plot(time, vel_body);
grid minor
xlabel('[s]')
ylabel('[m/s]')
legend('u', 'v', 'w')

figure('name','ANGULAR SPEED_BODY')
plot(time, ang_rates_body * radTodeg);
grid minor
xlabel('[s]')
ylabel('[deg/s]')
legend('p', 'q', 'r')

figure('name','ATTITUDE_EARTH')
hold on;
plot(time, attitude * radTodeg);
grid minor
xlabel('[s]')
ylabel('[deg]')
legend('R', 'P', 'Y')

figure('name','TRAJECTORY')
plot3(pos_ned(:,1), pos_ned(:,2), -pos_ned(:,3));
grid minor
xlabel('[m]')
ylabel('[m]')
zlabel('[m]')
title('Parachute descent')

%% END OF CODE