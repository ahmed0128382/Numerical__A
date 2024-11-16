% Define the function to integrate
f = @(x) exp( (x^2));

% Define the Romberg integration method using anonymous functions
romberg = @(f, a, b, n) rombergIntegration(f, a, b, n);

rombergIntegration = @(f, a, b, n) arrayfun(@(k) rombergStep(f, a, b, k), 1:n);

rombergStep = @(f, a, b, k) (2^(k-1) * trapezoidalRefined(f, a, b, 2^(k-1)) - trapezoidalRefined(f, a, b, 2^(k-2))) / (2^(k-1) - 1);

trapezoidalRefined = @(f, a, b, n) (b - a) / (2 * n) * (f(a) + 2 * sum(arrayfun(f, a + (1:n-1) * (b - a) / n)) + f(b));

% Example usage
a = 0;               % Lower limit of integration
b = 1;              % Upper limit of integration
n = 10;               % Number of Romberg steps

% Perform Romberg integration
R = romberg(f, a, b, n);

% Display the Romberg integration results
disp('Romberg integration results:');
disp((R(end)));
