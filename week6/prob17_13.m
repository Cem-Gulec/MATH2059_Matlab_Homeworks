function result = prob17_13()
    x_data = [1, 2, 3, 4, 5];
    y_data = [0.5, 2, 2.9, 3.5, 4];
    
    z_data = [0, 0, 0, 0, 0]; % an external array to hold ln(x_data(i)) values
    n = numel(x_data); % number of elements in x_data
    
    % equation converted to
    % lnx = (y-b)/a
    % y = a*lnx + b
    for i = 1:n
        z_data(i) = log(x_data(i));
    end
    
    zi = sum(z_data); % sum of z_data elements
    yi = sum(y_data); % sum of y_data elements
    z_mean = mean(z_data); % mean of z_data elements
    y_mean = mean(y_data); % mean of y_data elements
    zi_square = 0; % sum of z_data(i) square for all elements
    ziyi = 0;      % sum of z_data(i)*y_data(i) for all elements
    
    for i = 1:n
        zi_square = zi_square + z_data(i)*z_data(i);
        ziyi = ziyi + z_data(i)*y_data(i);
    end
        
    % need to construct y = a1*x + a0
    a1 = (n*ziyi - zi*yi)/(n*zi_square - zi*zi);
    a0 = y_mean - a1*z_mean;
    
    fprintf('parameter a: %.5f\nparameter b: %.5f\n', a1, a0);
    
    % for the conclusion part
    syms a
    syms b
    syms x
    f = @(a,b,x) a1*log(x) + b;
    
    fprintf('prediction of y at x=2.6 :  %.5f\n', f(a1, a0, 2.6));
    
    
end