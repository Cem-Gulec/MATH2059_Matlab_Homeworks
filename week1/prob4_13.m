function [result_a, result_b, result_c, result_d, result_e] = prob4_13(n)
    
    result_a = sqrt(abs(n-1)) + 1;
    result_b = exp(-n);
    result_c = sqrt(power(n,2)+1) - n;
    result_d = (exp(-n)-1)/n;
    result_e = sin(n)/(1 + cos(n));
    
    syms x
    result_a_d = sqrt(abs(x-1)) + 1;
    result_a_der = diff(result_a_d)
    error_a = n * double(subs(result_a_der,n)) / double(subs(result_a_d,n));
    
    result_b_d = exp(-x);
    result_b_der = diff(result_b_d)
    error_b = n * double(subs(result_b_der,n)) / double(subs(result_b_d,n));
    
    result_c_d = sqrt(power(x,2)+1) - x;
    result_c_der = diff(result_c_d)
    error_c = n * double(subs(result_c_der,n)) / double(subs(result_c_d,n));
    
    result_d_d = (exp(-x)-1)/x;
    result_d_der = diff(result_d_d)
    error_d = n * double(subs(result_d_der,n)) / double(subs(result_d_d,n));
    
    result_e_d = sin(x)/(1 + cos(x));
    result_e_der = diff(result_e_d)
    error_e = n * double(subs(result_e_der,n)) / double(subs(result_e_d,n));
    
    fprintf('result of the a = %.10f derivative = %.10f  error: %.10f\n', result_a, double(subs(result_a_der,n)), error_a);
    fprintf('result of the b = %.10f derivative = %.10f  error: %.10f\n', result_b, double(subs(result_b_der,n)), error_b);
    fprintf('result of the c = %.10f derivative = %.10f  error: %.10f\n', result_c, double(subs(result_c_der,n)), error_c);
    fprintf('result of the d = %.10f derivative = %.10f  error: %.10f\n', result_d, double(subs(result_d_der,n)), error_d);
    fprintf('result of the e = %.10f derivative = %.10f  error: %.10f\n', result_e, double(subs(result_e_der,n)), error_e);
    
    % with the spesified value to be put for spesified function (such as for b function n is taken as 10)
    % it can be seen that function c and d comes up with a low error rate.
    % However a,b and e functions come up with very bad results for the
    % error rate.

end