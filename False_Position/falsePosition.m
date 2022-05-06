function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

%falsePosition finds the root with the false position method
%   [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%   Inputs-
%   func- is the function that is inputed by the user
%   xl- is the lower guess
%   xu- is the upper guess
%   es- is the percent error that the function will stop if the approximate
%   error goes under that value
%   maxit- the maximum number of iterations the program will run before
%   spitting out an answer, even if it doesn't reach the desired es value
%   varargin- any other parameters from the function
%   Outputs-
%   root- the solved root of the equation 
%   fx- the y value of that calculated root
%   ea- the approximate error
%   iter- the number of iterations it took to find that root

if nargin<3,error('Invalid number of inputs'),end
fxl=func(xl,varargin {:});
fxu=func(xu,varargin {:});
es=.0001;
maxit=200;
if fxl==0
    root=xl;
    iter=0;
    fx=fxl;
    ea=0;
elseif fxu==0
    root=xu;
    iter=0;
    fx=fxu;
    ea=0;
elseif fxl*fxu<0
    ea=100;
    iter=0;
    rootp=xl;
    while ea>es && iter<maxit
        iter=iter+1;
        root=xu-(fxu*(xl-xu))/(fxl-fxu);
        fxn=func(root,varargin {:});
        if fxn==0
            fprintf('the root is %\f.Error is 0%%.',root)
            fx=func(root,varargin {:});
            ea=0;
            break
        elseif fxu*fxn<0
            ea=(abs(root-rootp)/root)*100;
            rootp=root;
            xl=root;
            fxl=fxn;
            elseif fxl*fxn<0
            ea=(abs(root-rootp)/root)*100;
            rootp=root;
            xu=root;
            fxu=fxn;
        end
    end
    fx=func(root,varargin {:});
else
    disp('Invalid bounds- Please enter new bounds and run again')
end

end