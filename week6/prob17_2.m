function result = prob17_2()
    data = [29.65, 28.55, 28.65, 30.15, 29.35, 29.75, 29.25,...
            30.65, 28.15, 29.85, 29.05, 30.25, 30.85, 28.75,...
            29.65, 30.45, 29.15, 30.45, 33.65, 29.35, 29.75,...
            31.25, 29.45, 30.15, 29.65, 30.55, 29.65, 29.25];
        
     % (alfa/2, n-1) = 0.05,27
     table_val = 1.7033;
     mean_val = mean(data);
     stddev_val = std(data);
     variance_val = var(data);
     coeff_var_val = std(data)/mean(data)*100;
     lower_bound = mean_val - (stddev_val/sqrt(numel(data))) * table_val;
     upper_bound = mean_val + (stddev_val/sqrt(numel(data))) * table_val;
        
     fprintf('mean: %.5f\n', mean_val);
     fprintf('standard deviation: %.5f\n', stddev_val);
     fprintf('variance: %.5f\n', variance_val);
     fprintf('coefficient variation: %.5f%%\n', coeff_var_val);
     fprintf('lower bound for 90%% confidence: %.5f\nupper bound for 90%% confidence: %.5f\n', lower_bound, upper_bound);
     
     % constructing histogram for datas given
     hist(data)
     
     % for the g section of the problem
     % (alfa/2, n-1) = 0.16,27
     new_table_val = 0.473;
     new_lower_bound = mean_val - (stddev_val/sqrt(numel(data))) * new_table_val;
     new_upper_bound = mean_val + (stddev_val/sqrt(numel(data))) * new_table_val;
     fprintf('\nlower bound for g section: %.5f\nupper bound for g section: %.5f\n', new_lower_bound, new_upper_bound);
     
     % with the new boundaries found for g section, only two of the data
     % given can fit into boundaries, which is not a valid estimation.
end