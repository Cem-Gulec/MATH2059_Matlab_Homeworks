function result = prob1_2(time, step_size)
    
    v_last = 0;
    analytical_sol = 41.137;
    
    for i = 1:(time*1/step_size)       
        v_current = v_last + (9.81 - (12.5/68.1)*v_last) * step_size;
        v_last = v_current;
    end
    
    abs_rel_err = abs((analytical_sol - v_last)/analytical_sol)*100;
    
    fprintf('Velocity = %.5f\n', v_last);
    fprintf('Absolute relative error for time = %d, step size = %.1f = %.5f%%\n', time, step_size, abs_rel_err);
    
end