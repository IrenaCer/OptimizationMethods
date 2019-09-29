function [] = goldenSection(f,left, right, epsilon)
    fplot(f);
    hold on
    
    tau = (-1 + sqrt(5))/2;

    L = right - left;
    x1 = right - tau * L;
    x2 = left + tau * L;

    fx1 = f(x1);
    fx2 = f(x2);
    iteration = 0;
    fplot(x1, fx1,'db');
    fplot(x2, fx2,'db');

    i = [];
    x1Arr = [];
    x2Arr = [];
    lArr = [];
    rArr = [];
    
    %disp(double(fx1));
    while(L >= epsilon)
        x1Arr = [x1Arr; double(x1)];
        x2Arr = [x2Arr; double(x2)];
        lArr = [lArr; left];
        rArr = [rArr; right];
        
        if(fx2 < fx1)
            left = x1;
            L = right - left;
        
            x1 = x2;
            x2 = left + tau * L;
        
            fx1 = fx2;
            fx2 = f(x2);
            fplot(x2, fx2,'db');
        else
            right = x2;
            L = right - left;
        
            x2 = x1;
            x1 = right - tau * L;
        
            fx2 = fx1;
            fx1 = f(x1);
            fplot(x1, fx1,'db');
        end
        iteration = iteration + 1;
        i = [i; iteration];
    end
    
    T = table(i,lArr, rArr, x1Arr, x2Arr);
    T.L = T.rArr - T.lArr;
    T.Fx1 = double(f(T.x1Arr));
    T.Fx2 = double(f(T.x2Arr));
    T.Properties.VariableNames = {'i', 'l', 'r', 'x1', 'x2', 'L', 'f(x1)', 'f(x2)'};
    T = movevars(T, 'L', 'After', 'r');
    
    disp(T);


