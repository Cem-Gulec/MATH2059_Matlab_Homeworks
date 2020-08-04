function result = prob4_24()
    app_val_holder = 1;
    term_val = 1;
    counter = 2;
    pi = 3.1415926535;
    temp_init = pi / 3; % usage for as declared in 4.2 cos(pi/3)
    es = 0.000001;
    maxit = 100;
    
    while(1)
        % term value calculations
        app_val_holder = -app_val_holder * power(temp_init, 2) / (counter * (counter-1));
        term_val = term_val + app_val_holder;
        
        % error value calculation
        approx_rel_err = abs(app_val_holder / term_val);
        
        % limitations as declared
        if (approx_rel_err < es)
            break
        end
        if (counter >= 2*maxit)
            break
        end       
        counter = counter + 2;
    end
    
    approx_val = term_val;
    tru_rel_err = abs((0.5 - approx_val) / 0.5);
    counter_ret = counter / 2;
    
    fprintf('Number of counterations: %d\n', counter_ret);
    fprintf('Estimate value of cos(x): %.10f %.10f %d %.10f\n', approx_val);
    fprintf('\nApproximate relative error: %.10f\n', approx_rel_err);
    fprintf('True relative error: %.10f\n', tru_rel_err);
    
    
end