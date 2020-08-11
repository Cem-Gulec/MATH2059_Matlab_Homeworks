function result = prob6_22()
    
    x_init = 1.2; % initial x and y values
    y_init = 1.2; 
    x_flag = 0;
    y_flag = 0;
    
    % function declarations
    fx = @(x) -1*power(x, 2) + x + 0.75;
    fy = @(x,y) (power(x, 2) - y) / (5*y);
    
    while(1)
        
        y_val = fx(x_init);
        x_val = fy(x_init, y_init);
        approx_err_x = (x_val - x_init) / x_val;
        approx_err_y = (y_val - y_init) / y_val;
        x_init = x_val;
        y_init = y_val;
        
        fprintf('x_val: %.6f y_val: %.6f approx_err_x: %.6f approx_err_y: %.6f\n', x_val, y_val, approx_err_x, approx_err_y);
        if abs(approx_err_x) < 0.0005 
            x_flag = 1; 
        end
        if abs(approx_err_y) < 0.0005 
            y_flag = 1; 
        end
        if x_flag && y_flag break, end
        
        
    end
    
    fprintf('\n\nfinalized root values for newton-raphson method with 0.05%% stopping criteria\n');
    fprintf('x_val: %.8f y_val: %.8f', x_init, y_init);
    
end