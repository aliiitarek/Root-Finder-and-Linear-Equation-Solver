function [root,iter,pre,X] = False(f, xl, xu, es, imax)
    xr=0;
    i=0;
    Y(1)=0;
    iter='';
    pre='';
    X=Y;
    
    if (f(xl)*f(xu)>0 || xl>xu)               % if guesses do not bracket, exit
       root='no root';
        return
    end
    
    if f(xl) > 0
        temp = xl;
        xl = xu;
        xu = temp;
    end
    for i=1:1:imax
        
        if(i~=1)
            prev_xr=xr;
        end
        
        xr=(xl*f(xu)-xu*f(xl))/(f(xu)-f(xl)); % compute xr
       
        if (f(xr) < 0) 
            xl=xr;  
        else
            xu=xr;
        end
        
        if(i~=1)
            if(abs((xr-prev_xr)/xr)<es)
                break;
            end
        end
    Y(i)=xr;
    end
root=xr;
iter=i;
pre=f(xr);
X=Y;