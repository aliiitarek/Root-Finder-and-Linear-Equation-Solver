% Bisection Method 
% function f(x) = f
function root = ProbTwo(xl, xu, es, imax);

    f = @(x) (x)*(x)*(x)-25;

    if (f(xl)*f(xu))>0 % if guesses do not bracket, exit
        disp('no bracket')
        return
    end
    
    for i=1:1:imax
        
        xr=(xu+xl)/2; % compute the midpoint xr
        ea = abs((xu-xl)/xl); % approx. relative error
        test= f(xl) * f(xr); % compute f(xl)*f(xr)
        
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
    end
s=sprintf('\n Root= %f #Iterations = %d \n', xr,i); 
disp(s);