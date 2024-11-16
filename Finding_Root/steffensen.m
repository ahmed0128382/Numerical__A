clear
clc
% Steffensen's Method to find the root of a function
% f: Function handle for the polynomial
% tolreance: Tolerance for the root
% maxIterations: Maximum number of iterations

% Define the polynomial function as anonymous functions
f = @(x) x^3 - 7 * x^2 + 14.5 * x - 8;

% %fixed point where p=g(p)
% f = @(x) sqrt((x^3 + 14.5 * x - 8)/7);
% Initial guess
x0=1;

% Tolerance and maximum number of iterations
tolerance = 1e-6;
maxIterations = 100;
x=x0;
root=[x];
for i = 1:maxIterations 
    % Apply Steffensen's method
    fx = f(x);
    gx = f(x + fx);
    x_new = x - (fx^2 / (gx - fx));
    root=[root,x_new];
    display(['The root is: ', num2str(root(end))]);
    % Check for convergence 
    if abs(x_new - x) < tolerance 
        break;
    end
    % Update the value
    x=x_new;
end

% Display the root
plot(root,'-r.')
fprintf('\n');
disp(['The root is: ', num2str(root(end))]);