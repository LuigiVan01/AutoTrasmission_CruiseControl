clear all
close all
clc

%% Parametrs

m       =   1200;    % Kg
Tm      =   200;     % Nm
wm      =   450;     % rad/s
beta    =   0.35;
alfa1   =   40;      % rad/m
alfa2   =   35;      % rad/m
alfa3   =   16;      % rad/m
alfa4   =   12;      % rad/m
alfa5   =   10;      % rad/m
g       =   9.81;    % m/s^2
Cr      =   0.01;
rho     =   1.3;     % kg/m^2
Cd      =   0.36;
A       =   2.2;     % m^2   


vel=0:0.1:130;
w=0:0.1:1300;

%% Full throttle

lambda=1;

Torque = lambda*Tm*(1-beta*((w)/wm-1).^2);


Torque1 = lambda*Tm*(1-beta*((vel*alfa1)/wm-1).^2);
Torque2 = lambda*Tm*(1-beta*((vel*alfa2)/wm-1).^2);
Torque3 = lambda*Tm*(1-beta*((vel*alfa3)/wm-1).^2);
Torque4 = lambda*Tm*(1-beta*((vel*alfa4)/wm-1).^2);
Torque5 = lambda*Tm*(1-beta*((vel*alfa5)/wm-1).^2);


Force1=alfa1*Torque1;
Force2=alfa2*Torque2;
Force3=alfa3*Torque3;
Force4=alfa4*Torque4;
Force5=alfa5*Torque5;



Power1=alfa1*Torque1.*vel;
Power2=alfa2*Torque2.*vel;
Power3=alfa3*Torque3.*vel;
Power4=alfa4*Torque4.*vel;
Power5=alfa5*Torque5.*vel;



%% Plot Force

% Plotting all torques on the same graph
figure(1); % Opens a new figure window
plot(vel, Force1, 'b-', 'LineWidth', 2); hold on;
plot(vel, Force2, 'r-', 'LineWidth', 2);
plot(vel, Force3, 'g-', 'LineWidth', 2);
plot(vel, Force4, 'k-', 'LineWidth', 2);
plot(vel, Force5, 'm-', 'LineWidth', 2);
xlabel('Vehicle Speed [m/s]');
ylabel('Force [N]');
title('Force vs. Vehicle Speed for Different Alfa Values');
legend({'gear 1', 'gear 2', 'gear 3', 'gear 4', 'gear 5'}, 'Location', 'northeast');
grid on; % Adds a grid to the plot for better readability

% Set axis limits
xlim([0 130]); % Set x-axis limits from 0 to 100
ylim([0 8100]); % Set y-axis limits from 0 to 250, adjust as necessary based on expected torque values

%% Plot Power

% Plotting all torques on the same graph
figure(2); % Opens a new figure window
plot(vel, Power1, 'b-', 'LineWidth', 2); hold on;
plot(vel, Power2, 'r-', 'LineWidth', 2);
plot(vel, Power3, 'g-', 'LineWidth', 2);
plot(vel, Power4, 'k-', 'LineWidth', 2);
plot(vel, Power5, 'm-', 'LineWidth', 2);
xlabel('Vehicle Speed [m/s]');
ylabel('Power [Watt]');
title('Powers vs. Vehicle Speed for Different Alfa Values');
legend({'Gear 1', 'Gear 2', 'Gear 3', 'Gear 4', 'Gear 5'}, 'Location', 'northeast');
grid on; % Adds a grid to the plot for better readability

% Set axis limits
xlim([0 130]); % Set x-axis limits from 0 to 100
ylim([0 130000]); % Set y-axis limits from 0 to 250, adjust as necessary based on expected torque values

%% Engine Torque

figure(3)

plot(w*60/(2*pi), Torque, 'LineWidth', 2); hold on;
xlabel('Engine Speed [rpm]');
ylabel('Engine Torque [N*m]');
title('Engine Torque vs. Engine speed');
grid on; % Adds a grid to the plot for better readability


%% Engine Power

figure(4)

plot(w*60/(2*pi), Torque.*w, 'LineWidth', 2); hold on;
xlabel('Engine Speed [rpm]');
ylabel('Engine Power [Watt]');
title('Engine Power vs. Engine speed');
grid on; % Adds a grid to the plot for better readability

%% Power plot with gear changes for delta=1

figure(5); % Opens a new figure window
hold on;

% Plot all powers with their original colors
plot(vel, Power1, 'b-', 'LineWidth', 2);
plot(vel, Power2, 'r-', 'LineWidth', 2);
plot(vel, Power3, 'g-', 'LineWidth', 2);
plot(vel, Power4, 'k-', 'LineWidth', 2);
plot(vel, Power5, 'm-', 'LineWidth', 2);

% Plot segments in orange
% Power1 up to 20.4
idx1 = find(vel <= 20.4);
plot(vel(idx1), Power1(idx1), 'Color', [1 0.5 0], 'LineWidth', 2); % Orange

% Power2 from 20.4 to 28.9
idx2 = find(vel >= 20.4 & vel <= 28.9);
plot(vel(idx2), Power2(idx2), 'Color', [1 0.5 0], 'LineWidth', 2); % Orange

% Power3 from 28.9 to 54.4
idx3 = find(vel >= 28.9 & vel <= 54.4);
plot(vel(idx3), Power3(idx3), 'Color', [1 0.5 0], 'LineWidth', 2); % Orange

% Power4 from 54.4 to 69.4
idx4 = find(vel >= 54.4 & vel <= 69.4);
plot(vel(idx4), Power4(idx4), 'Color', [1 0.5 0], 'LineWidth', 2); % Orange

% Markers at specific points
plot(20.4, interp1(vel, Power1, 20.4), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(28.9, interp1(vel, Power2, 28.9), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(54.4, interp1(vel, Power3, 54.4), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(69.4, interp1(vel, Power4, 69.4), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

xlabel('Vehicle Speed [m/s]');
ylabel('Power [Watt]');
title('Powers vs. Vehicle Speed for Different Alfa Values');
legend({'Gear 1', 'Gear 2', 'Gear 3', 'Gear 4', 'Gear 5'}, 'Location', 'northeast');
grid on; % Adds a grid to the plot for better readability

% Set axis limits
xlim([0 130]); % Set x-axis limits from 0 to 130
ylim([0 130000]); % Set y-axis limits from 0 to 130000
%% Plot from simulink

% % Data for the first plot (open loop response)
% time1 = out.open_loop.time;
% signals1 = out.open_loop.signals.values;
% 
% % Data for the second plot (step response)
% time2 = out.step.time;
% signals2 = out.step.signals.values;
% 
% % Create a figure window
% figure;
% hold on
% 
% % First subplot: Open loop response
% subplot(2, 1, 1); % This specifies a 2-row, 1-column grid of subplots, and activates the first subplot
% plot(time1, signals1, 'LineWidth', 1.5);
% yline(1.46, '--', 'LineWidth', 1.5); % Adding a dotted line at 1.46 m/s
% yline(27.45, '--', 'LineWidth', 1.5); % Adding a dotted line at 27.45 m/s
% text(max(time1), 1.46, '1.46 m/s', 'VerticalAlignment', 'baseline', 'HorizontalAlignment', 'left');
% text(max(time1), 27.45, '27.45 m/s', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
% title('Open loop response');
% xlabel('Time [s]');
% ylabel('Car velocity [m/s]');
% grid on
% 
% % Second subplot: Step response
% subplot(2, 1, 2); % Activates the second subplot
% plot(time2, signals2, 'LineWidth', 1.5);
% xlabel('Time [s]');
% ylabel('Throttle aperture');
% grid on
% 
% hold off

%%
% % Data for the first plot (open loop response)
% time1 = out.closed_loop.time;
% signals1 = out.closed_loop.signals.values;
% 
% % Data for the second plot (step response)
% time2 = out.input.time;
% signals2 = out.input.signals.values;
% 
% % Create a figure window
% figure;
% hold on
% 
% % First subplot: Open loop response
% subplot(2, 1, 1); % This specifies a 2-row, 1-column grid of subplots, and activates the first subplot
% plot(time1, signals1, 'LineWidth', 1.5);
% title('Closed loop response');
% xlabel('Time [s]');
% ylabel('Car velocity [m/s]');
% legend('Car Velocity','Velocity reference', 'Location', 'best');
% grid on
% 
% % Second subplot: Step response
% subplot(2, 1, 2); % Activates the second subplot
% plot(time2, signals2, 'LineWidth', 1.5);
% xlabel('Time [s]');
% ylabel('Throttle aperture');
% grid on
% 
% hold off

%%

% % Create a figure window
% figure;
% hold on
% 
% % First subplot: Open loop response
% subplot(2, 1, 1); % This specifies a 2-row, 1-column grid of subplots, and activates the first subplot
% plot(time, resp, 'LineWidth', 1.5);
% title('Closed loop response');
% xlabel('Time [s]');
% ylabel('Car velocity [km/h]');
% legend('Car Velocity','Velocity reference', 'Location', 'best');
% grid on
% 
% % Second subplot: Step response
% subplot(2, 1, 2); % Activates the second subplot
% plot(time, input, 'LineWidth', 1.5);
% xlabel('Time [s]');
% ylabel('Throttle aperture');
% grid on
% 
% hold off
% 
% figure;
% hold on
% 
% % First subplot: Open loop response
% subplot(2, 1, 1); % This specifies a 2-row, 1-column grid of subplots, and activates the first subplot
% plot(time, gears, 'LineWidth', 1.5);
% title('Automatic shift dynamic');
% xlabel('Time [s]');
% ylabel('Gear');
% grid on
% 
% % Second subplot: Step response
% subplot(2, 1, 2); % Activates the second subplot
% plot(time, rpm, 'LineWidth', 1.5);
% title('Engine velocity');
% xlabel('Time [s]');
% ylabel('Round per minute');
% grid on
% 
% hold off

