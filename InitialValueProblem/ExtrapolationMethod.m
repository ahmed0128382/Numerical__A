% Define the differential equation dy/dt = 2ty
f = @(t, y) 2 * t * y;

% Initial conditions
t0 = 1;   % Initial time
y0 = 1;   % Initial value of the solution

% Number of steps and initial step size
n = 10;  % Number of steps
h1 = 0.1;  % Initial step size
h2 = h1 / 2;  % Refined step size

% Initialize arrays to store the solution
t1 = t0:h1:(t0 + h1 * n);
y1 = zeros(1, n+1);
y1(1) = y0;

t2 = t0:h2:(t0 + h2 * 2 * n);
y2 = zeros(1, 2*n+1);
y2(1) = y0;

% Improved Euler method loop for step size h1
for i = 1:n
    k1 = h1 * f(t1(i), y1(i));
    k2 = h1 * f(t1(i) + h1, y1(i) + k1);
    y1(i+1) = y1(i) + (k1 + k2) / 2;
end

% Improved Euler method loop for step size h2
for i = 1:2*n
    k1 = h2 * f(t2(i), y2(i));
    k2 = h2 * f(t2(i) + h2, y2(i) + k1);
    y2(i+1) = y2(i) + (k1 + k2) / 2;
end

% Apply Richardson Extrapolation
y_extrapolated = (4 * y2(1:2:end) - y1) / 3;

% Plot the solution
figure;
plot(t1, y1, '-o', t1, y2(1:2:end), '-x', t1, y_extrapolated, '-s');
legend('Improved Euler (h1)', 'Improved Euler (h2)', 'Richardson Extrapolated');
xlabel('t');
ylabel('y');
title('Solution of ODE using Improved Euler Method with Richardson Extrapolation');
grid on;
