% Define the function to differentiate
f = @(x) sin(x);

% Define the step size
h = 0.1;

% Define the central difference method
centralDifference = @(f, x, h) (f(x + h) - f(x - h)) / (2 * h);

% Compute the central difference approximations
D_h = @(x) centralDifference(f, x, h);
D_h2 = @(x) centralDifference(f, x, h / 2);

% Apply Richardson Extrapolation
p = 2; % Order of the central difference method
richardsonExtrapolation = @(x) (2^p * D_h2(x) - D_h(x)) / (2^p - 1);

% Point at which to evaluate the derivative
x = pi / 4;

% Evaluate the derivative
approxDerivative = richardsonExtrapolation(x);

% Display the results
disp(['Central difference approximation with step size h: ', num2str(D_h(x))]);
disp(['Central difference approximation with step size h/2: ', num2str(D_h2(x))]);
disp(['Richardson extrapolated derivative: ', num2str(approxDerivative)]);
