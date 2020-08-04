function result = prob1_15(time, step_size)
    i_last = 0;
    q_last = 1;
    i_arr = zeros(1,11,1);
    q_arr = zeros(1,11,1);
    time_range = [0:0.01:0.1];
    counter = 2;
    
    for i = 0.01:step_size:time
        fprintf('time: %.2f   ', i);
        i_current = i_last - 1/5 * (i_last * 200 + q_last/0.0001) * step_size;
        q_current = q_last + i_last * step_size;
        i_last = i_current;
        q_last = q_current;
        i_arr(counter) = i_current;
        q_arr(counter) = q_current;
        counter = counter + 1;
        fprintf('i val: %.5f  q val: %.5f\n', i_current, q_current);
    end
    
    plot(time_range, i_arr, 'g');
    hold on
    plot(time_range, q_arr, 'r');
    
    
end