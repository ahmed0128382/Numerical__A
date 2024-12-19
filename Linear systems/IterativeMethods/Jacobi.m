clc;
clear;

% Example matrix A and vector b
A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6; 25; -11 ; 15];
[n, ~] = size(A);

% Initial guess
XO = zeros(n, 1);

% Maximum number of iterations
N = 1000;

% Tolerance for convergence
TOL = 1e-6;

% Step 1: Set k=1
k = 1;

% Step 2: While (k <= N) do Steps 3-6
while k <= N
    % Step 3: For i = 1, ..., n, set xi
    x = zeros(n, 1);
    for i = 1:n
        sum1 = 0;
        for j = 1:n
            if j ~= i
                sum1 = sum1 + A(i, j) * XO(j);
            end
        end
        x(i) = (b(i) - sum1) / A(i, i);
    end
    
    % Step 4: If ||x - XO|| < TOL then OUTPUT(x1,...,xn); (The procedure was successful.) STOP.
    if norm(x - XO, inf) < TOL
        disp(['Jacobi method converged in ' num2str(k) ' iterations.']);
        disp('Solution using Jacobi method:');
        disp(x);
        return;
    end
    
    % Step 5: Set k = k + 1
    k = k + 1;
    
    % Step 6: For i = 1, ..., n, set XOi = xi
    XO = x;
end

% Step 7: OUTPUT('Maximum number of iterations exceeded'); (The procedure was successful.) STOP
disp('Jacobi method did not converge within the maximum number of iterations.');
