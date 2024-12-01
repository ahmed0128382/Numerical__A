clc 
clear
% Define the differential equation and its derivative dy/dt = 2ty
% its derivative is 2t*(dy/dt) + 2y
f = @(t, y) 2 * y * t;          % First derivative (dy/dt)
d2y = @(t, y) 2 * t * f(t, y) + 2*y;  % Second derivative (d^2y/dt^2)

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

% Taylor method loop (Second order)
for i = 1:n
    y(i+1) = y(i) + h * f(t(i), y(i)) + (h^2 / 2) * d2y(t(i), y(i));
end

% Plot the solution
figure;
plot(t, y, '-o');
xlabel('t');
ylabel('y');
title('Solution of ODE using Taylor Method of Second Order');
grid on;
