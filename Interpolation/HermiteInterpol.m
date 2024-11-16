% Data points
x = [1, 2, 3];           % Data points
y = [1, 4, 9];           % Function values at data points
yp = [2, 8, 18];         % Derivatives at data points

% Build the divided differences table
n = length(x);
Q = zeros(2*n, 2*n);
z = zeros(2*n, 1);

% Build the z vector
for i = 1:n
    z(2*i-1) = x(i);
    z(2*i) = x(i);
end

% Build the Q matrix
for i = 1:n
    Q(2*i-1, 1) = y(i);
    Q(2*i, 1) = y(i);
    Q(2*i, 2) = yp(i);
    if i ~= 1
        Q(2*i-1, 2) = (Q(2*i-1, 1) - Q(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
    end
end

% Compute the divided differences
for j = 3:2*n
    for i = j:2*n
        Q(i, j) = (Q(i, j-1) - Q(i-1, j-1)) / (z(i) - z(i-j+1));
    end
end

% Define anonymous function for Hermite interpolation
hermiteInterpolation = @(xi) Q(2*n, 2*n) * prod(xi - z(1:2*n-1)) + sum(arrayfun(@(k) Q(k, k) * prod(xi - z(1:k-1)), 2*n:-1:1));

% Point at which to evaluate the interpolation
xi = 1.5;

% Evaluate the Hermite polynomial at xi
interpolatedValue = hermiteInterpolation(xi);

% Display the interpolated value
disp(['Interpolated value at xi = ', num2str(xi), ' is: ', num2str(interpolatedValue)]);

% Plot the interpolation
xx = linspace(min(x), max(x), 100);
yy = arrayfun(@(xi) hermiteInterpolation(xi), xx);

figure;
plot(x, y, 'o', xx, yy, '-');
xlabel('x');
ylabel('y');
title('Hermite Interpolation');
legend('Data points', 'Hermite Polynomial', 'Location', 'Best');
grid on;
