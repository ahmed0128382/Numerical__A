clear
clc
% Newton-Raphson Method to find the root of a function
% f: Function handle for the polynomial
% df: Function handle for the derivative of the polynomial
% x0: Initial guess
% tolerance: Tolerance for the root
% maxIterations: Maximum number of iterations

% Define the polynomial function and its derivative as anonymous functions
f = @(x) x^3 - 7 * x^2 + 14.5 * x - 8;
df = @(x) 3 * x^2 - 14 * x + 14.5;

% Initial guess
x0 = 0;

% Tolerance and maximum number of iterations
tolerance = 1e-6;
maxIterations = 10;



x = x0;
root=[];
for i = 1:maxIterations
    root=[root,x];
    disp(['The root is: ', num2str(x)]);
    x_new = x - f(x) / df(x);
    if abs(x_new - x) < tolerance
        x=x_new;
        break;
    end
    x = x_new;
end





% Display the root
plot(root,'-r.')
disp(['The root is: ', num2str(x)]);
