function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

    %size check
    lenx=length(x);
    leny=length(y);
    if lenx~=leny
        error('invalid input sizes')
    end
    if abs((max(x)- min(x))/(lenx-1))~=abs(x(2)-x(1))
        error('improperly spaced inputs')
    end
    for i=1:lenx-1
        if x(i+1)<=x(i)
            error('misordered data points, please arrange x-values in order of increasing magnitude')
        end
    end
    evencheck=mod(lenx-1,2);
    Areaundercurve=0;
    if evencheck==0
        for i=1:leny-1/2
            if 2*(i-1)+3>lenx,break,end
            h=abs(x(2*(i-1)+3)-x(2*(i-1)+1))/2;
            Intg=(h/3)*(y(2*(i-1)+1)+4*y(2*i)+y(2*(i-1)+3));
            Areaundercurve=Areaundercurve+Intg;
        end
    elseif evencheck==1
        if max(x)==x(2)
            warning('too few data points, trapezoidal rule has been applied')
            Areaundercurve=trapz(x,y);
        else
            for i=1:leny/2
                if 2*(i-1)+3>lenx-1,break,end
                h=abs(x(2*(i-1)+3)-x(2*(i-1)+1))/2;
                Intg=(h/3)*(y(2*(i-1)+1)+4*y(2*i)+y(2*(i-1)+3));
                Areaundercurve=Areaundercurve+Intg;
            end
            warning('even numer of data points, trapezoidal rule has been applied to last interval')
            Intg=trapz(x(lenx-1:lenx),y(leny-1:leny));
            Areaundercurve=Areaundercurve+Intg;
        end
    end
    I=Areaundercurve;
end