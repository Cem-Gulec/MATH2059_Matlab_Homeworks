function result = prob5_22(xl, xu, es, imax)
    
    counter = 0;
    % function defined in the 
    f = @(x) power(x, 10) - 1;
    xr = xu + 1 ;
    iter = 0;
    fl = f(xl);
    
    while(1)
        xr_old = xr;
        xr = (xl + xu) / 2;
        fr = f(xr);
        iter = iter + 1;
        
        if xr ~= 0
            ea = abs((xr-xr_old)/xr)*100;
        end
        
        fprintf('xl:%.5f xu:%.5f xr:%.5f f(xl):%.5f f(xu):%.5f f(xr):%.5f ea: %%%.5f \n', xl, xu, xr, f(xl), f(xu), f(xr), ea);
        
        test = fl * fr;
        
        if test < 0
            xu = xr;
        elseif test > 0
            xl = xr;
            fl = fr;
        else
            ea = 0;
        end
        
        % stopping criteria
        if ea < es || iter >= imax
            break
        end
        counter = counter + 1;
    end
    
    fprintf('number of iterations: %d', counter);
    result = xr;
end