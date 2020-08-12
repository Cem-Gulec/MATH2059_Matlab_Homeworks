function result = prob9_8()
    
    A = [10 2 -1; -3 -6 2; 1 1 5];
    B = [27 -61.5 -21.5];
    C = [A,B'];
    fprintf('initial form:\n');
    disp(C)

    % multiply first row by 3/10, add it to the second row
    % multiply first row by -1/10, add it to the third row
    fprintf('second form after updating 2nd & 3rd row:\n');
    C(2,:) = C(2,:) + C(1,:)*(3/10);
    C(3,:) = C(3,:) + C(1,:)*(-1/10);
    disp(C)
    
    % multiply second row by 4/27, add it to the third row
    fprintf('third and final form after updating 3rd row:\n');
    C(3,:) = C(3,:) + C(2,:)*(4/27);
    disp(C)
    
    % from the resulted array x1, x2 and x3 can be easily calculated
    x3 = C(3,4) / C(3,3);
    x2 = (C(2,4) - C(2,3)*x3) / C(2,2);
    x1 = (C(1,4) - C(1,2)*x2 - C(1,3)*x3) / C(1,1);
    fprintf('from the final form solving variable values:\n');
    fprintf('x1: %.2f  x2: %.2f  x3: %.2f\n', x1, x2, x3);
    
    % substitution part
    func_1 = @(x,y,z) 10*x + 2*y - z;
    func_2 = @(x,y,z) -3*x - 6*y + 2*z;
    func_3 = @(x,y,z)    x +   y + 5*z;
    
    fprintf('\nsubstituting found values into the equations:');
    fprintf('\nresult for equation 1: %.2f\n', func_1(x1, x2, x3));
    fprintf('result for equation 2: %.2f\n', func_2(x1, x2, x3));
    fprintf('result for equation 3: %.2f\n', func_3(x1, x2, x3));
    
end