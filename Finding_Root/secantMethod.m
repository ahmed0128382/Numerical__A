clear
clc
% Newton-Raphson Method to find the root of a function
% f: Function handle for the polynomial
% tolreance: Tolerance for the root
% maxIterations: Maximum number of iterations

% Define the polynomial function as anonymous functions
f = @(x) sin(x) - x;

% Initial guesses
x0 = 1;
x1 = 2;

% Tolerance and maximum number of iterations
tolerance = 1e-6;
maxIterations = 100;

root=[x0,x1];
for i = 1:maxIterations
    % Evaluate the function at the initial guesses 
    f0 = f(x0);
    f1 = f(x1);
    % Calculate the next approximation
    x2 = x1 - f1 * (x1 - x0) / (f1 - f0); 
    % Check for convergence 
    if abs(x2 - x1) < tolerance  
        break; 
    end
    root=[root,x2];
    % Update the guesses
    x0 = x1;
    x1 = x2;
    
    disp(['The root is: ', num2str(x2)]);
end

% Display the root
plot(root,'-r.')
fprintf('\n');
disp(['The root is: ', num2str(root(end))]);
