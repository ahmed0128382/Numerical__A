% Define the function to integrate
f = @(x) sin(x);

% Define the Trapezoidal Method using anonymous functions 
trapezoidal = @(f, a, b, n) (b - a) / (2 * n) * (f(a) + 2 * sum(arrayfun(f, a + (1:n-1) * (b - a) / n)) + f(b));

% Example usage
a = 0;               % Lower limit of integration
b = pi;              % Upper limit of integration
n = 10;             % Number of subintervals

integral = trapezoidal(f, a, b, n);
disp(['The integral is: ', num2str(integral)]);
