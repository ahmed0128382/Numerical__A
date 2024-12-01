% Define the differential equation as an anonymous function
f = @(t, y) 2 *t*y;

% Initial conditions
t0 = 1;   % Initial time
y0 = 1;   % Initial value of the solution

% Time step and number of steps
h = 0.05;  % Time step size
n = 10;  % Number of steps

% Initialize arrays to store the solution
t = t0:h:(t0 + h * n);
y = zeros(1, n+1);
y(1) = y0;

% Runge-Kutta method loop
for i = 1:n
    k1 = h * f(t(i), y(i));
    k2 = h * f(t(i) + h/2, y(i) + k1/2);
    k3 = h * f(t(i) + h/2, y(i) + k2/2);
    k4 = h * f(t(i) + h, y(i) + k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
end

% Plot the solution
figure;
plot(t, y, '-o');
xlabel('t');
ylabel('y');
title('Solution of ODE using Runge-Kutta Method (RK4)');
grid on;
