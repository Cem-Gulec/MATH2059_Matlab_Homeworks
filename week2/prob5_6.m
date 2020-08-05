function result = prob5_6()
    
    counter = 0;
    xl = 0.5;
    xu = 2;
    f = @(x) log(power(x,2)) - 0.7;
    % defining roots for the function f
    f1 = fzero(f,-1);
    f2 = fzero(f, 1);
    fprintf('root1: %.5f root2: %.5f\n', f1,f2);
    
    % plotting the graph according to defined function
    figure(1)
    fplot(f, [-3,5], 'g')
    x_line = xlim;
    y_line = ylim;
    line([0 0], y_line);  % y-axis
    line(x_line, [0 0]);  % x-axis
    hold on
    plot([f1,f2], [0,0], '*r') % plotting root points
    
    
    % bisection method implementation
    fprintf('\n***bisection method***\n');
    for i = 1:3
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
    fprintf('approximate error: %%%.8f\n', ea);
    fprintf('approximate root: %.5f\n\n', xr);
    
    
    % false position method implementation
    fprintf('***false position method***\n');
    counter = 0;
    state_counter = 0;
    xl_old = -1;
    xl = 0.5;
    xu = 2;
    f_xl = f(xl);
    
    for i = 1:3
        if xl == xl_old
            state_counter = state_counter + 1;
        end
        
        % if either xl or xu repeats more than 2 times
        % it needs to be halved
        if state_counter == 3
            f_xl = f_xl / 2;
        end
        
        f_xu = f(xu);
        xr = xu - (f_xu* (xu-xl)/(f_xu-f_xl));
        ea = abs( (xu-xl)/(xu+xl) )*100;
        fprintf('xl:%.5f xu:%.5f xr:%.5f f(xl):%.5f f(xu):%.5f f(xr):%.5f ea: %%%.5f \n', xl, xu, xr, f_xl, f_xu, f(xr), ea);
        
        
        % updating conditions
        if f_xl*f(xr) <0
             xu = xr;
        
        else
             xl = xr;
        end
        
        
        % stopping criteria
        if  abs(f(xr)) < 0.01 || f(xr) == 0
             break 
        end
        
        counter = counter + 1;
        
    end
    fprintf('number of iterations: %d\n', counter);
    fprintf('approximate error: %%%.8f\n', ea);
    fprintf('approximate root: %.5f\n\n', xr);
    
end