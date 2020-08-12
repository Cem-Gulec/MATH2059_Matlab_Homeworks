function result = prob9_16(Y, Z)

    % prob9_16_test.m file created to test the
    % program using the matrices from Prob.9.3.
    
    
    % getting dimensions out of the given inputs
    m = size(Y, 1);
    n = size(Y, 2);
    p = size(Z, 2);
    
    % checking if dimensions of Y and Z match for value n
    % if not immediately close program
    if size(Z, 1) ~= size(Y, 2)
        fprintf('***resulting with having a dimension error***\n\n');
        return
    end
    
    % initializing an array full of zeros to be modified
    X = zeros(m, p);
    
    % summing up elements and putting them in correct position
    for x = 1:m
        for y = 1:p
            total = 0;
            
            for z = 1:n
                total = total + Y(x, z)*Z(z, y);
            end
            
            X(x, y) = total;
        end
    end
    
    fprintf('resulted array after multiplication done:\n');
    disp(X)
    
end