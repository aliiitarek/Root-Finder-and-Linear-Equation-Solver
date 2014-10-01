function [fixed,iter,pre,X] = fixedPoint(g, x0, ep, imax)

    xi=x0;
    i=0;
    Y(1)=0;
    
    for i=1:1:imax
        
        xii=g(xi);
        
        if(abs(xii-g(xii))<ep)
            break;
        end;

        xi=xii;
        
        Y(i)=xi;
    end
fixed=xi;
iter=i;
pre=g(xi);
X=Y;