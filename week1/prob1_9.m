function result = prob1_9(time, step_size)
    y_last = 0;
    
    for i = 0.5:step_size:time
        fprintf('time: %.2f   ', i);
        y_current = y_last + (3*(450/1250) * sin(i-step_size)^2 - 450/1250) * step_size;
        y_last = y_current;
        fprintf('y value: %.5f\n', y_last);
    end
    
    result = y_last;
    
    
end