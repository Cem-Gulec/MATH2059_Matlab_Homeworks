function [result1, result2, TPRE_arr1, TPRE_arr2] = prob3_6(x)
    % input x to the function: 5 in this question

    appr_err = 0;
    sum1 = 1;
    sum2 = 1;
    iter = 20;  % iteration number
    true_value = 6.737947 * power(10,-3);
    
    % calculation of the first approach
    fprintf('**Approximations for the first approach**\n');
    for i = 0:iter
        % approximation value calculation
        eq_val = power(x, i) / factorial(i);
        if (i ~= 0) && mod(i, 2) == 1
            appr_err = ((sum1-eq_val-sum1)/(sum1-eq_val));
            sum1 = sum1 - eq_val;
        end
        
        if (i ~= 0) && mod(i, 2) == 0
            appr_err = abs((sum1-eq_val-sum1)/(sum1-eq_val));
            sum1 = sum1 + eq_val;
        end
        
        % true error calculation
        if mod(i, 2) == 1
            true_err = (abs(true_value - sum1)/true_value);
        end
        
        if mod(i, 2) == 0
            true_err = (abs(true_value - sum1)/true_value)*-1;
        end
        
        fprintf('iter: %d approx: %.10f true err: %.8f approx err: %.7f\n', i, sum1, true_err, appr_err);
    end
    
    
    % calculation for the second approach
    fprintf('\n\n**Approximations for the second approach**\n');
    for i = 0:iter
        eq_val = power(x, i) / factorial(i);
        
        if i ~= 0
            appr_err = abs((sum2-eq_val-sum2)/(sum2-eq_val));
            sum2 = sum2 + eq_val;
        end
        
        true_err = (abs(true_value - 1/sum2)/true_value)*-1;
        fprintf('iter: %d approx: %.10f true err: %.8f approx err: %.7f\n', i, 1/sum2, true_err, appr_err);
    end
    
    % comparing these two approaches first one converge to the true value
    % slower and also approximate values in consecutive iterations have
    % more difference than the second approach.
    
end