%% Fitting gear 1

% Define your points
x = [1, 0.8, 0.4, 0]; % x-coordinates
y = [20.4, 13, 5.5, 4.5]; % y-coordinates

% Fit a cubic polynomial (degree 3)
p1 = polyfit(x, y, 3);

% To evaluate the polynomial at a set of x values (for plotting or other purposes)
x_fit = linspace(min(x), max(x), 100); % 100 points between min and max x
y_fit = polyval(p1, x_fit);

% Plot the original points and the fitted polynomial
figure(5)
plot(x, y, 'o', 'MarkerFaceColor', 'r'); % Original points
hold on;
plot(x_fit, y_fit, '-b'); % Fitted polynomial
legend('Data points', 'Cubic Fit');
xlabel('Throttle aperture (delta)');
ylabel('Car velocity [m/s]');
title('Threshold t1 as function of delta');


%% Fitting gear 2

% Define your points
x = [1, 0.8, 0.4, 0]; % x-coordinates
y = [28.9, 15, 6, 5.3]; % y-coordinates

% Fit a cubic polynomial (degree 3)
p2 = polyfit(x, y, 3);

% To evaluate the polynomial at a set of x values (for plotting or other purposes)
x_fit = linspace(min(x), max(x), 100); % 100 points between min and max x
y_fit = polyval(p2, x_fit);

% Plot the original points and the fitted polynomial
figure(6)
plot(x, y, 'o', 'MarkerFaceColor', 'r'); % Original points
hold on;
plot(x_fit, y_fit, '-b'); % Fitted polynomial
legend('Data points', 'Cubic Fit');
xlabel('Throttle aperture (delta)');
ylabel('Car velocity [m/s]');
title('Threshold t2 as function of delta');

%% Fitting gear 3

% Define your points
x = [1, 0.8, 0.4, 0]; % x-coordinates
y = [54.4, 32.7, 13.1, 11.6]; % y-coordinates

% Fit a cubic polynomial (degree 3)
p3 = polyfit(x, y, 3);

% To evaluate the polynomial at a set of x values (for plotting or other purposes)
x_fit = linspace(min(x), max(x), 100); % 100 points between min and max x
y_fit = polyval(p3, x_fit);

% Plot the original points and the fitted polynomial
figure(7)
plot(x, y, 'o', 'MarkerFaceColor', 'r'); % Original points
hold on;
plot(x_fit, y_fit, '-b'); % Fitted polynomial
legend('Data points', 'Cubic Fit');
xlabel('Throttle aperture (delta)');
ylabel('Car velocity [m/s]');
title('Threshold t3 as function of delta');

%% Fitting gear 4

% Define your points
x = [1, 0.8, 0.4, 0]; % x-coordinates
y = [69.4, 43.63, 17.5, 15.5]; % y-coordinates

% Fit a cubic polynomial (degree 3)
p4 = polyfit(x, y, 3);

% To evaluate the polynomial at a set of x values (for plotting or other purposes)
x_fit = linspace(min(x), max(x), 100); % 100 points between min and max x
y_fit = polyval(p4, x_fit);

% Plot the original points and the fitted polynomial
figure(8)
plot(x, y, 'o', 'MarkerFaceColor', 'r'); % Original points
hold on;
plot(x_fit, y_fit, '-b'); % Fitted polynomial
legend('Data points', 'Cubic Fit');
xlabel('Throttle aperture (delta)');
ylabel('Car velocity [m/s]');
title('Threshold t4 as function of delta');
