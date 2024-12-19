clc;
clear;

% Example usage:
A = [1 1 0 3 8; 2 1 -1 1 7; 3 -1 -1 2 11; -1 2 3 -1 -7];
[n, m] = size(A); 

% Extract the coefficient matrix and the constant vector
coeff_matrix = A(:, 1:n);
const_vector = A(:, end);

% Ensure the coefficient matrix is non-singular
if det(coeff_matrix) == 0
    error('Matrix A is singular and cannot be decomposed without pivoting.');
end

% Initialize L and U
L = eye(n);
U = zeros(n);

% Perform LU decomposition manually without partial pivoting
for i = 1:n
    % Check for zero pivot element
    if coeff_matrix(i, i) == 0
        error('Zero pivot encountered. Matrix is singular or requires pivoting.');
    end
    
    % Compute U
    for j = i:n
        U(i, j) = coeff_matrix(i, j) - L(i, 1:i-1) * U(1:i-1, j);
    end
    
    % Compute L
    for j = i+1:n
        L(j, i) = (coeff_matrix(j, i) - L(j, 1:i-1) * U(1:i-1, i)) / U(i, i);
    end
end

% Forward substitution to solve L * y = const_vector
y = zeros(n, 1);
for i = 1:n
    y(i) = (const_vector(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
end

% Backward substitution to solve U * x = y
x = zeros(n, 1);
for i = n:-1:1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end

% Output solution
disp('Solution using LU decomposition without partial pivoting:');
disp(x);
