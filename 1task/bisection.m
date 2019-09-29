function [] = bisection(f,left, right, epsilon)
    fplot(f);
    hold on
    
    xm = (left + right)/2;
    L = right - left;
    fxm = f(xm);
    
    iteration = 0;
    i = [];
    lArr = [];
    rArr = [];
    x1Arr = [];
    x2Arr = [];
    fplot(xm, fxm,'dr');
    while(L>=epsilon)
        x1 = left + L/4;
        x2 = right - L/4;
    
        fx1 = f(x1);
        fx2 = f(x2);
        
        iteration = iteration +1;
        
        i = [i; iteration];
        lArr = [lArr; left];
        rArr = [rArr; right];
        x1Arr = [x1Arr; x1];
        x2Arr = [x2Arr; x2];
        
        if(fx1<fxm)
            right = xm;
            xm = x1;
        elseif(fx2<fxm)
            left = xm;
            xm = x2;
        else
            left = x1;
            right = x2;
        end
        L = right - left;
        fxm = f(xm);
        fplot(x1, fx1,'db');
        fplot(xm, fxm,'dr');
        fplot(x2, fx2,'db');
    end
    
    T = table(i,lArr, rArr, x1Arr, x2Arr);
    T.L = T.rArr - T.lArr;
    T.Xm = (T.lArr + T.rArr)/2;
    T.Fxm = double(f(T.Xm));
    T.Fx1 = double(f(T.x1Arr));
    T.Fx2 = double(f(T.x2Arr));
    T.Properties.VariableNames = {'i', 'l', 'r', 'x1', 'x2', 'L', 'xm', 'f(xm)', 'f(x1)', 'f(x2)'};
    T = movevars(T, 'L', 'After', 'r');
    T = movevars(T, 'xm', 'After', 'r');
    
    disp(T);
