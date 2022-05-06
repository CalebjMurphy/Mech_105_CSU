function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns

%Checking the input argument to make sure that the input will throw an error out if the code is entered wrong
if nargin~=2
    error('Invalid Input')
end

%make all inputs integers so they work
n=round(n);
m=round(m);

% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);%creates correctly sized matrix

% Now the real challenge is to fill in the correct values of A
A(1,1:m)=[1:1:m];%creates first complete row
    if n>=2
        A(1:n,1)=[1:1:n];%creates first complete column
        for i=2:n %repeats process for each row but only in the rows that are not already complete
            j=2; %starts process in a column not already filled
            while j>=2 && j<=m
                A(i,j)= A(i,j-1)+A(i-1,j);%adds (same row previous column) and (previous row same column together) 
                if j==m, break, end%skips step of writting new j value
                j=j+1;
            end
        end
    end
end