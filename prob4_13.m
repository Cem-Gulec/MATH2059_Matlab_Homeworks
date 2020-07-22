function [result_a, result_b, result_c, result_d, result_e] = prob4_13(x)
    result_a = sqrt(abs(x-1)) + 1;
    result_b = exp(-x);
    result_c = sqrt(power(x,2)+1) - x;
    result_d = (exp(-x)-1)/x;
    result_e = sin(x)/(1 + cos(x));
    
    fprintf('result of the a = %.10f\n', result_a);
    fprintf('result of the b = %.10f\n', result_b);
    fprintf('result of the c = %.10f\n', result_c);
    fprintf('result of the d = %.10f\n', result_d);
    fprintf('result of the e = %.10f\n', result_e);

end