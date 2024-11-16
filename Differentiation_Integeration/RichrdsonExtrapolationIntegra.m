% Define the function to integrate
f = @(x) sin(x);

% Define the trapezoidal rule
trapezoidal = @(f, a, b, n) (b - a) / (2 * n) * (f(a) + 2 * sum(arrayfun(f, a + (1:n-1) * (b - a) / n)) + f(b));

% Integration limits
a = 0;
b = pi;

% Number of intervals
n = 10;

% Compute the trapezoidal approximations
I_h = trapezoidal(f, a, b, n);
I_h2 = trapezoidal(f, a, b, 2 * n);

% Apply Richardson Extrapolation
p = 2; % Order of the trapezoidal rule
I_extrapolated = (2^p * I_h2 - I_h) / (2^p - 1);

% Display the results
disp(['Trapezoidal approximation with n intervals: ', num2str(I_h)]);
disp(['Trapezoidal approximation with 2n intervals: ', num2str(I_h2)]);
disp(['Richardson extrapolated value: ', num2str(I_extrapolated)]);
