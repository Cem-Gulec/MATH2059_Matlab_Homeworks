function result = prob9_9()
    
    A = [8 2 -2; 10 2 4; 12 2 2];
    B = [-2 4 6];
    C = [A, B'];
    fprintf('initial form:\n');
    disp(C)
    
    % largest element in first column in third row
    % swap first and third rows
    fprintf('second form after swapping 1st & 3rd row:\n');
    tmp = C(1,:);
    C(1,:) = C(3,:);
    C(3,:) = tmp;
    disp(C)
    
    % multiply first row by 5/6, subtract it from second row
    % multiply first row by 2/3, subtract it from third row
    fprintf('third form after updating 2nd & 3rd row:\n');
    C(2,:) = C(2,:) - C(1,:)*(5/6);
    C(3,:) = C(3,:) - C(1,:)*(2/3);
    disp(C)
    
    % swap second and third rows
    % multiply new second row by 1/2, subtract it from third row
    fprintf('final form after swapping done and updating the 3rd row:\n');
    tmp = C(2,:);
    C(2,:) = C(3,:);
    C(3,:) = tmp;
    
    C(3,:) = C(3,:) - C(2,:)*(1/2);
    disp(C)
    
    % from the resulted array x1, x2 and x3 can be easily calculated
    x3 = C(3,4) / C(3,3);
    x2 = (C(2,4) - C(2,3)*x3) / C(2,2);
    x1 = (C(1,4) - C(1,2)*x2 - C(1,3)*x3) / C(1,1);
    fprintf('from the final form solving variable values:\n');
    fprintf('x1: %.2f  x2: %.2f  x3: %.2f\n', x1, x2, x3);
    
    % substitution part
    func_1 = @(x,y,z) 8*x  + 2*y - 2*z;
    func_2 = @(x,y,z) 10*x + 2*y + 4*z;
    func_3 = @(x,y,z) 12*x + 2*y + 2*z;
    
    fprintf('\nsubstituting found values into the equations:');
    fprintf('\nresult for equation 1: %.2f\n', func_1(x1, x2, x3));
    fprintf('result for equation 2: %.2f\n', func_2(x1, x2, x3));
    fprintf('result for equation 3: %.2f\n', func_3(x1, x2, x3));

end