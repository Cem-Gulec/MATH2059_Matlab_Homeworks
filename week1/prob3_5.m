function [approx_result, approx_result_rev, TPRE, TPRE_rev] = prob3_5(x)
    sum = 0;
    sum_rev = 0;
    true_value = power(pi,4)/90;    % true value: equation's converged value when approaching to infinity
    
    % normal order summation for the equation
    for i = 1:x       
        fn = double(1 / power(i,4));
        sum = sum + fn;
    end
    
    % reversed order summation for the equation
    for i = x:-1:1
        fn = 1 / power(i,4);
        sum_rev = sum_rev + fn;
    end
    
    approx_result = sum;
    approx_result_rev = sum_rev;
    % True Percent Relative Error for normal order result
    TPRE = (abs(true_value - approx_result)/true_value)*100;
    % True Percent Relative Error for reversed order result
    TPRE_rev = (abs(true_value - approx_result_rev)/true_value)*100;
    
    fprintf('Result in normal (ascending) order    = %.15f\n', approx_result);
    fprintf('Result in reversed (descending) order = %.15f\n', approx_result_rev);
    fprintf('The True Percent Relative Error for normal order result   = %.15f\n', TPRE);
    fprintf('The True Percent Relative Error for reversed order result = %.15f\n', TPRE_rev);
    
    
end