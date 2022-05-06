function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Caleb Murphy
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
   
    lenx=length(x);
    leny=length(y);
    if lenx~=leny  %make sure that x & y are equally sized
        error('miss-sized inputs. please ensure x and y have same number of inputs')
    end
    [SortedY,Order]=sort(y); %Put the y values in order
    SortedX=x(Order); %keep the x to the corresponding y
    n=leny;
    firstQ=floor((n+1)/4);
    thirdQ=floor((3*n+3)/4);
    Q1=SortedY(firstQ);
    Q3=SortedY(thirdQ);
    IQR=Q3-Q1;
    j=0;
    for i=(1:n)
        if SortedY(i)>=Q1-1.5*IQR && SortedY(i)<=Q3+1.5*IQR %only includes non outliers
            j=j+1;
            NewY(j)=SortedY(i);
            NewX(j)=SortedX(i);
        end
    end
    len=length(NewX);
    avgy=mean(NewY);
    avgx=mean(NewX);
    for i=(1:len)
        XY(i)=NewX(i)*NewY(i); 
    end
    SUMXY=sum(XY);
    SUMX=sum(NewX);
    SUMY=sum(NewY);
    for i=(1:len)
        X2(i)=NewX(i)^2
    end
    SUMX2=sum(X2)
    slope=(len*SUMXY-SUMX*SUMY)/(len*SUMX2-SUMX^2);
    intercept=avgy-slope*avgx;
    fX=NewX;
    fY=NewY;
    for i=(1:len)
        inside(i)=(NewY(i)-avgy)^2;
    end
    SST=sum(inside);
    for i=(1:len)
        func= @(x) intercept+slope*x;
        inside2(i)=(NewY(i)-func(NewX(i)))^2;
    end
    SSR=sum(inside2);
    Rsquared=1-(SSR/SST)
end
