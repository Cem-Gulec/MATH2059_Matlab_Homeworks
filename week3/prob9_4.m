function result = prob9_4()
    
    x = 0:1:10; % range
    % function declarations
    func_1 = (x + 6)/2;
    func_2 = (x + 34)/6;
    
    % finding intersection point
    sub = find(func_1 == func_2);
    x_inter = x(sub);
    y_inter = func_2(sub);
    
    figure(1)
    plot(x, func_1, ...
        x, func_2,...
        x_inter, y_inter, 'r*');
    
    fprintf('intersection point at (x,y) = (%d, %d)\n', x_inter, y_inter);
    
    func_1_sub = @(x,y) 4*x - 8*y;
    func_2_sub = @(x,y) -x + 6*y;
    
    fprintf('\nresult for 1st equation with substitution = %d\n', func_1_sub(x_inter, y_inter));
    fprintf('result for 2nd equation with substitution = %d\n', func_2_sub(x_inter, y_inter));
        
end