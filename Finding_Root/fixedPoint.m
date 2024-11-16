clear
clc
% Fixed Point Method to find the root of a function
% g: Function handle for g(x)
% x0: Initial guess
% tol: Tolerance for the root
% maxIter: Maximum number of iterations


% Define the function g(x) derived from f(x) = 0
% Here, we re-arrange the polynomial x^3 - 7x^2 + 14.5x - 8 = 0
% to x = sqrt((x^3 + 14.5x - 8) / 7) as an example
g = @(x) sqrt((x^3 + 14.5 * x - 8) / 7);

% Initial guess
x0 = 2;

% Tolerance and maximum number of iterations
tolerance = 1e-6;
maxIterations = 100;
x = x0;
root=[x];
for i = 1:maxIterations
    root=[root,x];
    x_new = g(x);
   % disp(['The x_new is: ', num2str(g(x))]);
    if abs(x_new - x) < tolerance
        root = x_new;
        x=x_new;
        break;
    end
    x = x_new;
end


% Display the root
%fprintf('\n');
disp(['The root is: ', num2str(x)]);
plot(root, '-r.');

