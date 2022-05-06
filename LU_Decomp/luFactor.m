function [L, U, P] = luFactor(A)
    % luFactor(A)
    %	LU decomposition with pivotiing
    % inputs:
    %	A = coefficient matrix
    % outputs:
    %	L = lower triangular matrix
    %	U = upper triangular matrix
    %   P = the permutation matrix
    
    % Dimensions
    rowsofA= height(A);
    colofA= length(A);
    if rowsofA~=colofA
        error('improperly sized matrix')
    end
    n=rowsofA;

    % Matrix Setup
    P=eye(n);
    L=eye(n);
    U=A;

    %Gauss elimination
    k=0;
    while(1)
        k=k+1;
        [m,I]=max(abs(U(k:n,k))); %checks for the largest value of U in column k
        m=U(I+k-1,k);
        if I~=1 %Initiates pivoting if the largest value is not in the first row
            % Pivot U
            NR=U(k+I-1,1:n);
            OR=U(k,1:n);
            U(k,1:n)=NR;
            U(k+I-1,1:n)=OR;
            % Pivot P
            NR=P(k+I-1,1:n);
            OR=P(k,1:n);
            P(k,1:n)=NR;
            P(I+k-1,1:n)=OR;
            if k>=2
                %pivot for L matrix
                NR=L(k+I-1,1:k-1);
                OR=L(k,1:k-1);
                L(k,1:k-1)=NR;
                L(k+I-1,1:k-1)=OR;
            end
        end
        if k>n-1,break,end
        for i=k:n-1
            Factorofeq=U(i+1,k)/m;
            L(i+1,k)= Factorofeq;
            NR=Factorofeq*U(k,:);
            U(i+1,:)=U(i+1,:)-NR;
        end
    end
end