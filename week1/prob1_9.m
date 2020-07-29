function result = prob1_9(time, d_val)
    y_last = 0;
    
    for i = 0.5:d_val:time
        fprintf('time: %.2f   ', i);
        y_current = y_last + (3*(450/1250) * sin(i-d_val)^2 - 450/1250) * d_val;
        y_last = y_current;
        fprintf('%.5f\n', y_last);
    end
    
    
end