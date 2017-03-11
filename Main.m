%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parafoil simulator                                                      %
% Authors:  Stefano Fari' (stefano.fari@mail.polimi.it)                   %
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
f1 = figure('units','normalized','outerposition',[0 0 1 1]);

subplot(2,2,1)
plot(time, [pos_ned(:,1), pos_ned(:,2), -pos_ned(:,3)]);
grid minor
xlabel('[s]')
ylabel('[m]')
legend('N', 'E', 'D')

subplot(2,2,2)
plot(time, vel_body);
grid minor
xlabel('[s]')
ylabel('[m/s]')
legend('u', 'v', 'w')

subplot(2,2,3)
plot(time, ang_rates_body * radTodeg);
grid minor
xlabel('[s]')
ylabel('[deg/s]')
legend('p', 'q', 'r')

subplot(2,2,4)
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