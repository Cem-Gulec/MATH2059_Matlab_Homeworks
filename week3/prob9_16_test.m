function result = prob9_16_test()

    %test the function
    A=[1,6;3,10;7,4];
    B=[1,3;0.5,2];
    C=[2,-2;-3,1];
    
    fprintf('array A:\n');
    disp(A)
    fprintf('array B:\n');
    disp(B)
    fprintf('array C:\n');
    disp(C)
    
    fprintf('multiplication of A and B:\n');
    prob9_16(A, B)
    
    fprintf('multiplication of A and C:\n');
    prob9_16(A, C)
    
    fprintf('multiplication of B and A:\n');
    prob9_16(B, A)
    
    fprintf('multiplication of B and C:\n');
    prob9_16(B, C)
    
    fprintf('multiplication of C and A:\n');
    prob9_16(C, A)
    
    fprintf('multiplication of C and B:\n');
    prob9_16(C, B)
    
end