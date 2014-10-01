
function [root,iter,pre,X,bound,NEXT] = bisection(f, xl, xu, es, imax)
    xr=0;
    
     i=0;
    Y(1)=0;
    iter='';
    pre='';
    X=Y;
    bound='';
    NEXT = 0;
    if (xu<xl || f(xu)*f(xl)>0)
        root='no root';
        return;
    end;
    for i=1:1:imax
        NEXT(i,1) = xl;
        NEXT(i,3) = xu;
        xr=(xu+xl)/2;           % compute the midpoint xr
        NEXT(i,2) = xr;
        ea = abs((xu-xl)/xl);   % approx. relative error
        test= f(xl) * f(xr);    % compute f(xl)*f(xr)
        
        if (test < 0) 
            xu=xr;
        else
            xl=xr;
        end
        
        if (test == 0) 
            ea=0; 
        end
        
        if (ea < es)
            break;
        end
        Y(i)=xr;
    end
    root=xr;
    iter=i;
    pre=f(xr);
    X=Y;
    bound=(xu-xl)/(2^iter);