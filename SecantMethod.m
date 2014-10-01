function [secant,iter,pre,X] = SecantMethod(f, x0, es, imax);

    xi=x0;
    h=0.1;
    
    i=0;
    Y(1)=0;
     iter='';
    pre='';
    X='';
    for i=1:1:imax
        
        if(f(xi-h)-f(xi)==0)
            secant='no root';
            return;
        end;
        
        xii=xi-(f(xi)*(xi-h-xi))/(f(xi-h)-f(xi));
        ea = abs((xii-xi)/xii);
        
        if (ea < es)
            break;
        end
        
        xi=xii;
        
        Y(i)=xi;

    end
    
  %  if(f(xii)<0.00001)
  %      break;
  %  end;
        
    secant = xi;
    iter=i;
    pre=f(xi);
    X=Y;