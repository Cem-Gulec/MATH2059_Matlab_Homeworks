function result = prob5_13()

    % function with given coefficients put into it
    f = @(x) 9.81*x*(1 - exp(-150/x)) - 540;
    f1 = fzero(f, 50);
    fprintf('root: %.5f\n', f1);
    
    % plotting the figure for the function f
    figure(1)
    fplot(f, [0,100], 'g')
    x_line = xlim;
    y_line = ylim;
    line([0 0], y_line);  % y-axis
    line(x_line, [0 0]);  % x-axis
    hold on
    plot(f1, 0, '*r') % plotting root points

    % false position method implementation
    fprintf('\n***false position method***\n');
    counter = 0;
    state_counter = 0;
    xl_old = 55;
    xl = 55;
    xu = 60;
    f_xl = f(xl);
    
    while(1)
        if xl == xl_old
            state_counter = state_counter + 1;
        end
        
        % if either xl or xu repeats its value more than 2 times
        % it needs to be halved
        if state_counter == 3
            f_xl = f_xl / 2;
        end
        
        f_xu = f(xu);
        xr = xu - (f_xu* (xu-xl)/(f_xu-f_xl));
        ea = abs( (xu-xl)/(xu+xl) )*100;
        fprintf('xl:%.5f xu:%.5f xr:%.5f f(xl):%.5f f(xu):%.8f f(xr):%.9f ea: %%%.5f \n', xl, xu, xr, f_xl, f_xu, f(xr), ea);
        
        
        % updating conditions
        if f_xl*f(xr) <0
             xu = xr;
        
        else
             xl = xr;
        end
        
        
        % stopping criteria
        if  ea < 0.1 || f(xr) == 0
             break 
        end
        
        counter = counter + 1;
        
    end
    fprintf('number of iterations: %d\n', counter);
    fprintf('approximate error: %%%.8f\n', ea);
    fprintf('approximate root: %.5f\n\n', xr);
    
    result = xr;
    
    
end