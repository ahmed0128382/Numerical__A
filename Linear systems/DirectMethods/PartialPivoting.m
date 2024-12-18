clc
clear
% Example usage:
A = [0.003 59.14 59.17; 5.291 -6.13 46.78];
% Get the number of unknowns and equations 
[n, m] = size(A); 
if m ~= n + 1 
    error('Augmented matrix A must have n rows and n+1 columns'); 
end

% Step 1: Forward Elimination
for i = 1:n-1
    % Step 2: Find pivot with maximum absolute value in column i
    [~, p] = max(abs(A(i:n, i)));
    p = p + i - 1;
    
    if A(p, i) == 0 
        disp('No unique solution exists'); % all potential pivot elements are zero
        return;
    end
    
    % Step 3: Swap rows if necessary
    if p ~= i
        A([i p], :) = A([p i], :);
    end
    
    % Step 4: Elimination
    for j = i+1:n 
        mji = A(j, i) / A(i, i); % Step 5
        A(j, :) = A(j, :) - mji * A(i, :); % Step 6: perform (Ej - mji * Ei) -> (Ej)
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

