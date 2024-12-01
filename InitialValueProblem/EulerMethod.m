% Define the differential equation dy/dt = -2y
f = @(t, y) -2*y;

% Set the time span and step size
tspan = [0, 1];
h = 0.1;

% Initial condition
y0 = 1;

% Euler method implementation
t = tspan(1):h:tspan(2);
y = zeros(size(t));
y(1) = y0;

for i = 1:length(t)-1
    y(i+1) = y(i) + h*f(t(i), y(i));
end

% Plot the results
plot(t, y, 'o-')
xlabel('t')
ylabel('y')
title('Euler Method Solution')