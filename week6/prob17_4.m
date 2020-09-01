function result = prob17_4()
    x_data = [6, 7, 11, 15, 17, 21, 23,...
              29, 29, 37, 39];
    
    y_data = [29, 21, 29, 14, 21, 15,...
              7, 7, 13, 0, 3];
        
    n = numel(x_data); % number of elements in x_data
    xi = sum(x_data); % sum of x_data elements
    yi = sum(y_data); % sum of y_data elements
    x_mean = mean(x_data); % mean of x_data elements
    y_mean = mean(y_data); % mean of y_data elements
    xiyi = 0; % sum of x_data(i)*y_data(i) for all elements
    xi_square = 0; % sum of x_data(i) square for all elements
    yi_square = 0; % sum of y_data(i) square for all elements
    
    for i = 1:n
        xiyi = xiyi + x_data(i)*y_data(i);
        xi_square = xi_square + x_data(i)*x_data(i);
        yi_square = yi_square + y_data(i)*y_data(i);
    end
    
    % need to construct y = a1*x + a0
    a1 = (n*xiyi - xi*yi)/(n*xi_square - xi*xi);
    a0 = y_mean - a1*x_mean;
    
    % plotting function
    syms x
    f = @(x) a1*x + a0;
    figure(1)
    % in the range of [5,40]
    fplot(f, [5,40], 'g')
    hold on
    % plotting point coordinates (x_data(i), y_data(i)) for all points
    plot(x_data, y_data, '*b') 
    hold on
    plot(10, 10, 'or')
    
    % standart error estimation calculation
    sr = 0;
    
    for i = 1:n
       sr = sr + (y_data(i) - a0 - a1*x_data(i))^2;
    end
    
    sy_over_x = sqrt(sr/(n-2));
    
    % correlation
    r = (n*xiyi - xi*yi) / (sqrt(n*xi_square - xi*xi)*sqrt(n*yi_square - yi*yi));
    
    fprintf('standard error of estimate: %.5f\n', sy_over_x);
    fprintf('correlation: %.5f', r);
    
    % based on the visual assessment it is seen that the point (10,10) stays 
    % as an outlier. Based on the standard error, it can be easily
    % compared to the other points in the given data and be seen that it
    % stays much more away from the line than other data points.
     
    
    
end