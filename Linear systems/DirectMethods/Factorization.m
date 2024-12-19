clc 
clear
% Example usage:
A = [5 -1 1 8; 3 0 9 0; 3 3 5 -6];
b = [8; 0; -6];
[n, m] = size(A); 
if m ~= n + 1 
    error('Augmented matrix A must have n rows and n+1 columns'); 
end

% Extract the coefficient matrix and the constant vector
coeff_matrix = A(:, 1:n);
const_vector = A(:, end);

% Perform LU decomposition
[L, U, P] = lu(coeff_matrix);

% Adjust the right-hand side vector according to the permutation matrix
b_permuted = P * const_vector;

% Forward substitution to solve L * y = P * b
y = zeros(n, 1);
for i = 1:n
    y(i) = (b_permuted(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
end

% Backward substitution to solve U * x = y
x = zeros(n, 1);
for i = n:-1:1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end

% Output solution 
disp('Solution:'); 
disp(x);
