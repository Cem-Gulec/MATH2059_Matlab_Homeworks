function result = prob18_20()

    % ********** solving for 18.5 ************
    
    x_data = [1.6, 2, 2.5, 3.2, 4, 4.5];
    y_data = [2,   8, 14,  15,  8, 2];
    first_order = [0, 0, 0, 0, 0];
    second_order = [0, 0, 0, 0];
    third_order = [0, 0, 0];
    R = [0, 0, 0]; % for storing estimated error values
    func_val1 = 2.8;
    func_val2 = 4;
    
    % calculating first-order values
    for i = 1:numel(first_order)
        first_order(i) = (y_data(i+1)-y_data(i)) / (x_data(i+1)-x_data(i));
    end
    
    % calculating second-order values
    for i = 1:numel(second_order)
        second_order(i) = (first_order(i+1)-first_order(i)) / (y_data(i+2)-y_data(i));
    end
    
    % calculating third-order values
    for i = 1:numel(third_order)
        third_order(i) = (second_order(i+1)-second_order(i)) / (y_data(i+3)-y_data(i));
    end
    
    R(1) = 0.7;
    R(2) = second_order(1)*(func_val1-x_data(1))*(func_val1-x_data(2));
    R(3) = third_order(1)*(func_val1-x_data(1))*(func_val1-x_data(2))*(func_val1-x_data(3));
            
    fprintf('********** results for 18.5 ************\nfirst order: ');
    disp(first_order)
    fprintf('second order: ');
    disp(second_order)
    fprintf('third order: ');
    disp(third_order)
    fprintf('estimated error for first order: %.5f\n', double(R(1)));
    fprintf('estimated error for second order: %.5f\n', double(R(2)));
    fprintf('estimated error for third order: %.5f\n', double(R(3)));
    
     % ********** solving for 18.6 ************
    
    x_data_new = [1, 2, 3,  5,  7,   8];
    y_data_new = [3, 6, 19, 99, 291, 444];
    first_order_new = [0, 0, 0, 0, 0];
    second_order_new = [0, 0, 0, 0];
    third_order_new = [0, 0, 0];
    R_new = [0, 0, 0];
    
    % calculating first-order values
    for i = 1:numel(first_order_new)
        first_order_new(i) = (y_data_new(i+1)-y_data_new(i)) / (x_data_new(i+1)-x_data_new(i));
    end
    
    % calculating second-order values
    for i = 1:numel(second_order_new)
        second_order_new(i) = (first_order_new(i+1)-first_order_new(i)) / (y_data_new(i+2)-y_data_new(i));
    end
    
    % calculating third-order values
    for i = 1:numel(third_order_new)
        third_order_new(i) = (second_order_new(i+1)-second_order_new(i)) / (y_data_new(i+3)-y_data_new(i));
    end
    
    R_new(1) = -15;
    R_new(2) = second_order_new(1)*(func_val2-x_data_new(1))*(func_val2-x_data_new(2));
    R_new(3) = third_order_new(1)*(func_val2-x_data_new(1))*(func_val2-x_data_new(2))*(func_val2-x_data_new(3));
    
    fprintf('\n\n********** results for 18.6 ************\nfirst order: ');
    disp(first_order_new)
    fprintf('second order: ');
    disp(second_order_new)
    fprintf('third order: ');
    disp(third_order_new)
    fprintf('estimated error for first order: %.5f\n', double(R_new(1)));
    fprintf('estimated error for second order: %.5f\n', double(R_new(2)));
    fprintf('estimated error for third order: %.5f\n', double(R_new(3)));
end