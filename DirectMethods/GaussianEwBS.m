clc
clear
% Example usage:
A = [0 -1 1 8; 3 3 9 0; 3 3 5 -6]; 
% Get the number of unknowns and equations 
[n, m] = size(A); 
if m ~= n + 1 
    error('Augmented matrix A must have n rows and n+1 columns'); 
end
% Step 1: Forward Elimination
for i = 1:n-1
    % Step 2: Find pivot 
    p = i; 
    while p <= n && A(p, i) == 0 
        p = p + 1; 
    end
    if p > n 
        disp('No unique solution exists'); %all the 1st col are zeros
        return;
    end
    % Step 3: Swap rows if necessary
    if p ~= i
        A([i p], :) = A([p i], :);
    end
    % Step 4: Elimination
    for j = i+1:n 
        mji = A(j, i) / A(i, i); % step 5
        A(j, :) = A(j, :) - mji * A(i, :); %step 6 : perform  (Ej −mjiEi) → (Ej);
    end
end
% Step 7: Check for no unique solution
if A(n, n) == 0 
    disp('No unique solution exists'); 
    return; 
end
% Step 8: Backward Substitution 
x = zeros(n, 1); 
x(n) = A(n, m) / A(n, n); 
for i = n-1:-1:1 
    x(i) = (A(i, end) - sum(A(i, i+1:n) .* x(i+1:n)')) / A(i, i); 
end
% Step 10: Output solution 
disp('Solution:'); 
disp(x); 

