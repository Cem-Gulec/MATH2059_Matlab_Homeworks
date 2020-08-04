function result = prob5_4(n)
    
    counter = 0;
    xl = -1;
    xu = 0;
    f = @(x) -12 - 21*x + 18*power(x,2) - 2.75*power(x,3);
    % since it can be figured out in the graph where the roots outlied
    % we can easily detect them by giving a close value to approach
    f1 = fzero(f,-1);
    f2 = fzero(f, 1);
    f3 = fzero(f, 4);
    fprintf('root1: %.3f root2: %.3f root3: %.3f\n', f1,f2,f3);
    
    figure(1)
    fplot(f, [-3,5], 'g')
    x_line = xlim;
    y_line = ylim;
    line([0 0], y_line);  % y-axis
    line(x_line, [0 0]);  % x-axis
    hold on
    plot([f1,f2,f3], [0,0,0], '*r')
    
    % bisection method implementation
    fprintf('\n***bisection method***\n');
    while(1)
        f_xl = f(xl);
        f_xu = f(xu);
        xr = (xl+xu)/2;
        f_xr = f(xr);
        ea = abs( (xu-xl)/(xu+xl) )*100;
        fprintf('xl:%.5f xu:%.5f xr:%.5f f(xl):%.5f f(xu):%.5f f(xr):%.5f ea: %%%.5f \n', xl, xu, xr, f_xl, f_xu, f_xr, ea);
        
        % updating depending on the conditions
        if f_xl*f_xr < 0
            xu = xr;
        end
        
        if f_xl*f_xr > 0
            xl = xr;
        end
        
        if f_xu*f_xr < 0
            xl = xr;
        end
        
        counter = counter + 1;
        % stopping criterian
        if ea < 1 
            break 
        end
        
    end
    fprintf('number of iterations: %d\n', counter);
    fprintf('stopped at %%%.5f which is the closest percent to defined stopping criteria\n', ea);
    fprintf('approximate root: %.5f\n\n', xr);
    
    % false position method implementation
    fprintf('***false position method***\n');
    
    
    
    
end