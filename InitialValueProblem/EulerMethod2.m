% Define the differential equation 
f = @(t, y) -2 * y + t;

% Initial conditions
t0 = 0;   % Initial time
y0 = 1;   % Initial value of the solution

% Time step and number of steps
h = 0.1;  % Time step size
n = 100;  % Number of steps

% Initialize arrays to store the solution
t = t0:h:(t0 + h * n);
y = zeros(1, n+1);
y(1) = y0;

% Euler method loop
for i = 1:n
    y(i+1) = y(i) + h * f(t(i), y(i));
end

% Plot the solution
figure;
plot(t, y, '-.');
xlabel('t');
ylabel('y');
title('Solution of ODE using Euler Method');
grid on;
