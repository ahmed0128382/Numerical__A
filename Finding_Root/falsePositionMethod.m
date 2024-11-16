clear
clc
% False Position Method to find the root of a function
% f: Function handle for the polynomial
% tolreance: Tolerance for the root
% maxIterations: Maximum number of iterations

% Define the polynomial function as anonymous functions
f = @(x) x^3 - 7 * x^2 + 14.5 * x - 8;

% Initial interval [a,b]
a = 0.0;
b = 1.0;

% Tolerance and maximum number of iterations
tolerance = 1e-6;
maxIterations = 100;

root=[a];
if f(a) * f(b) > 0 
    error('The function must have different signs at a and b');
end
for i = 1:maxIterations 
    % Calculate the false position
    c = b - (f(b) * (b - a)) / (f(b) - f(a));
    %c = (f(b) * a) - (b * f(a)) / (f(b) - f(a));
    root=[root,c];
    display(['The root is: ', num2str(root(end))]);
    % Check for convergence 
    if abs(f(c)) < tolerance 
        break;
    end
    % Update the interval
    if f(a) * f(c) < 0 
        b = c;
    else
        a = c; 
    end
end

% Display the root
plot(root,'-r.')
fprintf('\n');
disp(['The root is: ', num2str(root(end))]);