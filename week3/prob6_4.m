function result = prob6_4()

    syms x
    f = @(x) -1 + 5.5*x - 4*power(x,2) + 0.5*power(x,3);
    f1 = fzero(f, 0);
    f2 = fzero(f, 1);
    f3 = fzero(f, 6);
    fprintf('root1: %.5f root2: %.5f root3: %.5f\n', f1,f2,f3);
     
    % plotting the function
    figure(1)
    fplot(f, [-2,8], 'g')
    x_line = xlim;
    y_line = ylim;
    line([0 0], y_line);  % y-axis
    line(x_line, [0 0]);  % x-axis
    hold on
    plot([f1,f2,f3], [0,0,0], '*r') % plotting root points
    
    % newton-raphson method implementation
    root_1_init = 0;
    root_2_init = 1;
    root_3_init = 6
    
    root_der = diff(f(x)) % derivative of the function
    
    % for the first root
    while(1)
        
        x_val = root_1_init - f(root_1_init)/double(subs(root_der, root_1_init))
        approx_err = (x_val - root_1_init) / x_val;
        root_1_init = x_val;
        
        fprintf('x_val: %.8f approx_err: %.8f\n', x_val, approx_err);
        if abs(approx_err) < 0.01 break, end
        
    end
    
    % for the second root
    fprintf('\n\n');
    while(1)
        
        x_val = root_2_init - f(root_2_init)/double(subs(root_der, root_2_init))
        approx_err = (x_val - root_2_init) / x_val;
        root_2_init = x_val;
        
        fprintf('x_val: %.8f approx_err: %.8f\n', x_val, approx_err);
        if abs(approx_err) < 0.01 break, end
        
    end
    
    % for the third root
    fprintf('\n\n');
    while(1)
        
        x_val = root_3_init - f(root_3_init)/double(subs(root_der, root_3_init))
        approx_err = (x_val - root_3_init) / x_val;
        root_3_init = x_val;
        
        fprintf('x_val: %.8f approx_err: %.8f\n', x_val, approx_err);
        if abs(approx_err) < 0.01 break, end
        
    end
    
    fprintf('\n\nfinalized root values for newton-raphson method with 0.01%% stopping criteria\n');
    fprintf('x1: %.8f\nx2: %.8f\nx3: %.8f', root_1_init, root_2_init, root_3_init);
     
end