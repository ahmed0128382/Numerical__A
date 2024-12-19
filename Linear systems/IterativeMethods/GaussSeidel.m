clc;
clear;

% Given matrix A and vector b
A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6; 25; -11 ; 15];
[n, ~] = size(A);

% Initial guess
x = zeros(n, 1);

% Maximum number of iterations
max_iter = 1000;

% Tolerance for convergence
tol = 1e-6;

% Step 1: Set k = 1
k = 1;

% Step 2: While (k ≤ max_iter) do Steps 3-6
while k <= max_iter
    x_old = x;
    
   % Step 3: For i = 1,...,n set xi using the Gauss-Seidel formula 
   for i = 1:n 
       sum1 = 0;
       for j = 1:i -1 
           sum1 = sum1 + A(i, j) * x(j);
       end
       for j = i+1:n
           sum1 = sum1 + A(i, j) * x_old(j);
       end
        x(i) = (b(i) - sum1) / A(i, i);
    end
    
    % Step 4: If ||x - x_old|| < tol then OUTPUT(x1,...,xn); (The procedure was successful.) STOP.
    if norm(x - x_old, inf) < tol
        disp(['Gauss-Seidel method converged in ' num2str(k) ' iterations.']);
        disp('Solution using Gauss-Seidel method:');
        disp(x);
        return;
    end
    
    % Step 5: Set k = k + 1
    k = k + 1;
end

% Step 7: OUTPUT('Maximum number of iterations exceeded'); (The procedure was unsuccessful.) STOP.
disp('Gauss-Seidel method did not converge within the maximum number of iterations.');
