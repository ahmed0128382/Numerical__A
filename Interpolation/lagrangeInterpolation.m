% Example usage:
x = [1, 2, 3]; % Data points 
y = [1, 4, 9]; % Function values at data points 
% Point at which to evaluate the interpolation 
xi = 1.5;
n = length(x);
L = 0;
for i = 1:n 
    % Calculate the Lagrange basis polynomial 
    Li = 1; 
    for j = 1:n 
        if i ~= j 
            Li = Li * (xi - x(j)) / (x(i) - x(j));
        end
    end
    % Add the contribution of the current basis polynomial to the result
    L = L + y(i) * Li;
end
% Display the interpolated value 
disp(['Interpolated value at xi = ', num2str(xi), ' is: ', num2str(L)]);

% Define the range for interpolation
z = linspace(min(x), max(x), 100);


plot(x,y,'-r.');
xlabel('x'); 
ylabel('y');
title('Lagrange Interpolation');
