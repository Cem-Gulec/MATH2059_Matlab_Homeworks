function result = prob17_1()
    data = [8.8,  9.5,  9.8, 9.4,  10,...
            9.4,  10.1, 9.2, 11.3, 9.4,...
            10,   10.4, 7.9, 10.4, 9.8,...
            9.8,  9.5,  8.9, 8.8,  10.6,...
            10.1, 9.5,  9.6, 10.2, 8.9];
        
     % (alfa/2, n-1) = 0.025,24
     table_val = 2.0639;
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
     fprintf('lower bound for 95%% confidence: %.5f\nupper bound for 95%% confidence: %.5f\n', lower_bound, upper_bound);
     
     % constructing histogram for datas given
     hist(data)
end