function result = prob17_18()
    x1_data = [0, 1, 1, 2, 2, 3, 3, 4, 4];
    x2_data = [0, 1, 2, 1, 2, 1, 2, 1, 2];
    y_data  = [15.1, 17.9, 12.7, 25.6, 20.5, 35.1, 29.7, 45.4, 40.2];
    
    n = numel(x1_data); % number of elements
    x1_sum = sum(x1_data); % sum of elements in x1_data
    x2_sum = sum(x2_data); % sum of elements in x2_data
    y_sum  = sum(y_data); % sum of elements in y_data
    y_mean = mean(y_data); % mean of elements in y_data
    x1_square = 0;
    x2_square = 0;
    x1y = 0;
    x2y = 0;
    x1x2 = 0;
    
    for i = 1:n
       x1_square = x1_square + x1_data(i)*x1_data(i);
       x2_square = x2_square + x2_data(i)*x2_data(i);
       x1y = x1y + x1_data(i)*y_data(i);
       x2y = x2y + x2_data(i)*y_data(i);
       x1x2 = x1x2 + x1_data(i)*x2_data(i);
    end
    
    % solving linear equations
    syms a0 a1 a2
    eqn1 = n*a0      + x2_square*a1  + x2_sum*a2    == y_sum;
    eqn2 = x1_sum*a0 + x1_square*a1  + x1x2*a2      == x1y;
    eqn3 = x2_sum*a0 + x1x2*a1       + x2_square*a2 == x2y;
    
    [A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [a0, a1, a2]);
    X = linsolve(A, B);
    
    fprintf('a0: %.5f   a1: %.5f   a2: %.5f\n', double(X(1)), double(X(2)), double(X(3)));

    % calculating standard error of estimate
    sr = 0;
    st = 0;
    
    for i = 1:n
       sr = sr + (y_data(i) - double(X(1)) - double(X(2))*x1_data(i) - double(X(3))*x2_data(i))^2;
       st = st + (y_data(i) - y_mean)^2;
    end
    
    sy_over_x = sqrt(sr/(n-3));
    
    r = sqrt((st-sr)/st);
    
    fprintf('standard error of estimate: %.5f\n', sy_over_x);
    fprintf('correlation coefficient: %.5f\n', r);

end