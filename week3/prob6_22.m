function result = prob6_22()
    
    x_init = 1.2; % initial x and y values
    y_init = 1.2; 
    x_flag = 0;
    y_flag = 0;
    x_final = 0;
    y_final = 0;
    
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
        if abs(approx_err_x) < 0.0001 && x_flag == 0
            x_flag = 1;
            x_final = x_val;
        end
        if abs(approx_err_y) < 0.0001 && y_flag == 0
            y_flag = 1; 
            y_final = y_val;
        end
        if x_flag && y_flag break, end
        
        
    end
    
    fprintf('\nfinalized root values for fixed point iteration method\n');
    fprintf('x_val: %.8f y_val: %.8f\n\n', x_final, y_final);
    
    
    % Newton raphson method implementation
    syms x
    syms y
    x_init = 1.2; % initial x and y values
    y_init = 1.2;
    % functions re-defined for newton raphson method
    u = @(x,y) y + power(x, 2) - x - 0.75;
    v = @(x,y) y + 5*x*y - power(x, 2);
    % partial derivative definitions
    ux = diff(u(x,y), x); % derivative of u respect to x
    uy = diff(u(x,y), y); % derivative of u respect to y
    vx = diff(v(x,y), x); % derivative of v respect to x
    vy = diff(v(x,y), y); % derivative of v respect to y
    
    
    while(1)
        
        x_val = x_init - (u(x_init,y_init) * vpa(subs(vy, {x,y}, {x_init, y_init})) - v(x_init,y_init) * vpa(subs(uy, {x,y}, {x_init, y_init}))) / (vpa(subs(ux, {x,y}, {x_init, y_init})) * vpa(subs(vy, {x,y}, {x_init, y_init})) - vpa(subs(uy, {x,y}, {x_init, y_init})) * vpa(subs(vx, {x,y}, {x_init, y_init})));
        y_val = y_init - (v(x_init,y_init) * vpa(subs(ux, {x,y}, {x_init, y_init})) - u(x_init,y_init) * vpa(subs(vx, {x,y}, {x_init, y_init}))) / (vpa(subs(ux, {x,y}, {x_init, y_init})) * vpa(subs(vy, {x,y}, {x_init, y_init})) - vpa(subs(uy, {x,y}, {x_init, y_init})) * vpa(subs(vx, {x,y}, {x_init, y_init})));
        approx_err_x = (x_val - x_init) / x_val;
        approx_err_y = (y_val - y_init) / y_val;
        x_init = x_val;
        y_init = y_val;
        
        fprintf('x_val: %.7f y_val: %.7f approx_err_x: %.7f approx_err_y: %.7f\n', double(x_val), double(y_val), double(approx_err_x), double(approx_err_y));
        if abs(approx_err_x) < 0.0001 && abs(approx_err_y) < 0.0001
            break
        end
        
    end
    
    
    
    fprintf('\n\nfinalized root values for newton-raphson method\n');
    fprintf('x: %.8f\ny: %.8f', double(x_init), double(y_init));
    
end