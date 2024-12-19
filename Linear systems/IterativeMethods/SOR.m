clc;
clear;

% Given matrix A and vector b
A = [4 3 0; 3 4 -1; 0 -1 4];
b = [24; 30; -24];
[n, ~] = size(A);

% Initial guess
XO = zeros(n, 1);

% Relaxation factor (typically between 1 and 2)
omega = 1.25;

% Maximum number of iterations
N = 1000;

% Tolerance for convergence
TOL = 1e-3;

% Step 1: Set k = 1
k = 1;

% Step 2: While (k ≤ N) do Steps 3-6
while k <= N
    x = zeros(n, 1);  % Initialize new estimate vector
    
    % Step 3: For i = 1,...,n set xi
    for i = 1:n
        sum1 = 0;
        for j = 1:i-1
            sum1 = sum1 + A(i, j) * x(j);  % Use the most recent updates in this iteration
        end
        for j = i+1:n
            sum1 = sum1 + A(i, j) * XO(j);  % Use values from the previous iteration
        end
        x(i) = (1 - omega) * XO(i) + (omega / A(i, i)) * (b(i) - sum1);
    end
    
    % Step 4: If ||x - XO|| < TOL then OUTPUT(x1,...,xn); (The procedure was successful.) STOP.
    if norm(x - XO, inf) < TOL
        disp(['SOR method converged in ' num2str(k) ' iterations.']);
        disp('Solution using SOR method:');
        disp(x);
        return;
    end
    
    % Step 5: Set k = k + 1
    k = k + 1;
    
    % Step 6: For i = 1,...,n set XOi = xi
    XO = x;
end

% Step 7: OUTPUT('Maximum number of iterations exceeded'); (The procedure was unsuccessful.) STOP.
disp('SOR method did not converge within the maximum number of iterations.');
