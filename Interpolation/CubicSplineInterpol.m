% Define the data points
x = [1, 2, 3, 4];
y = [1, 4, 9, 16];

% Use MATLAB's built-in cubic spline interpolation function
pp = spline(x, y);

% Define the range for interpolation
z = linspace(min(x), max(x), 100);

% Evaluate the polynomial at the given points
P = ppval(pp, z);

% Plot the result
figure;
plot(x, y, 'o', z, P, '-');
title('Cubic Spline Interpolation');
xlabel('x');
ylabel('y');
grid on;

