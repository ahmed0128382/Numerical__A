% Define the function to integrate
f = @(x) sin(x);

% Define Simpson's Method using anonymous functions
simpsons = @(f, a, b, n) (b - a) / (3 * n) * (f(a) + 4 * sum(arrayfun(f, a + (1:2:n-1) * (b - a) / n)) + 2 * sum(arrayfun(f, a + (2:2:n-2) * (b - a) / n)) + f(b));

% Example usage
a = 0;               % Lower limit of integration
b = pi;              % Upper limit of integration
n = 100;             % Number of subintervals (must be even)

integral = simpsons(f, a, b, n);
disp(['The integral is: ', num2str(integral)]);
