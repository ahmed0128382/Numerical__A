clc
clear
% Example usage:
% Define the polynomial function as an anonymous function
polynomial = @(x) sin(x) - 7 * x^2 + 14.5 * x - 8;

% Call the bisection method function
a = 1.0; % Start of interval
b = 3.0; % End of interval
tolerance = 1e-6; % Tolerance for the root
% Check if the initial interval is valid
    if polynomial(a) * polynomial(b) > 0
        error('The function must have different signs at a and b');
    end

    while (b - a) / 2 > tolerance
        % Find the midpoint
        c = (a + b) / 2;
        % Check the value of the function at the midpoint
        if polynomial(c) == 0
            break; % The root is found
        elseif polynomial(a) * polynomial(c) < 0
            b = c; % The root is in the left interval
        else
            a = c; % The root is in the right interval
        end
        root = (a + b) / 2;
    end

% Return the midpoint as the root


% Display the root
disp(['The root is: ',num2str((a+b)/2)]);
disp(['(b - a)/2: ',num2str((b-a)/2)]);
