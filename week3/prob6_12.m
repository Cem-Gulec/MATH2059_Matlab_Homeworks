function result = prob6_12()
    
    syms x
    f = @(x) -2*power(x, 6) - 1.5*power(x, 4) + 10*x + 2;
    f1 = fzero(f, 0);
    f2 = fzero(f, 1);
    fprintf('root1: %.5f root2: %.5f\n\n\n', f1,f2);
    
    % plotting the function
    figure(1)
    fplot(f, [-0.8,1.4], 'g')
    x_line = xlim;
    y_line = ylim;
    line([0 0], y_line);  % y-axis
    line(x_line, [0 0]);  % x-axis
    hold on
    plot([f1,f2], [0,0], '*r') % plotting root points
    
    % calculation phase
    % to determine the maximum of the function it means we need function's
    % derivation and its roots
    root_2_init = 1;
    root_der = diff(f(x)); % derivative of the function
    root_der_2 = diff(f(x), 2); % second derivative of the function
    
    % for the second root
    while(1)
        
        x_val = root_2_init - double(subs(root_der, root_2_init))/double(subs(root_der_2, root_2_init));
        approx_err = (x_val - root_2_init) / x_val;
        root_2_init = x_val;
        
        fprintf('x_val: %.8f approx_err: %.8f\n', x_val, approx_err);
        if abs(approx_err) < 0.005 break, end
        
    end
    
    
    
    fprintf('\n\nfinalized root values for newton-raphson method with 5%% stopping criteria\n');
    fprintf('x2: %.8ff', root_2_init);
    

end