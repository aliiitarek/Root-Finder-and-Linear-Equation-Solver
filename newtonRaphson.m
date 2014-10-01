function [newton,iter,pre,X]  = newtonRaphson(f, x0, es, imax)
    xi=x0;
    h=0.1;
    i=0;
    Y(1)=0;
    iter='';
    pre='';
    X=Y;
    for i=1:1:imax
        
        dervF=(-1*f(xi+2*h)+8*f(xi+h)-8*f(xi-h)+f(xi-2*h))/(12*h);
        if(dervF==0)
            newton='derivative = 0 , bad point';
            return;
        end;
        xii=xi-(f(xi))/(dervF);
        ea = abs((xii-xi)/xii);
        
        if (ea < es)
            break;
        end
        
        xi=xii;
        Y(i)=xi;

    end
newton=xi;
iter=i;
pre=f(xi);
X=Y;