clear 
clc

% Define the data points
x = [1, 5, 3, 4];
y = [1, 25, 9, 16];

% Number of data points
n = length(x);

xi=2.5;

% Initialize the Lagrange polynomial
L = @(z) 0;

% Calculate the Lagrange polynomial
for i = 1:n
    % Initialize the Lagrange basis polynomial
    Li = @(z) 1;
   
    for j = 1:n
        if i ~= j
            Li = @(z) Li(z) .* (z - x(j)) / (x(i) - x(j));
            
        end
    end
    L = @(z) L(z) + y(i) * Li(z);
end

% Display the interpolated value
disp(['Interpolated value at xi = ', num2str(xi), ' is: ', num2str(L(xi))]);

% Define the range for interpolation
z = linspace(min(x), max(x), 100);

% Evaluate the polynomial at the given points
P = L(z);

% Plot the result
figure;
plot(x, y, 'o', z, P, '-');
title('Lagrange Interpolation Polynomial');
xlabel('x');
ylabel('y');
grid on;
