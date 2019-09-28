function [] = newton(f, xi, epsilon)
    fplot(f);
    hold on
    
    fplot(xi, f(xi),'pr');
    
    der = diff(f);
    der2 =diff(der);
     
    xip1 = xi - der(xi) / der2(xi);
    iteration = 0;
    
    i = [];
    xiArr = [];
    xip1Arr = [];
    
    fplot(xip1, f(xip1),'pr');

    
    absx = abs(xip1 - xi);
    
    while (absx >= epsilon)
        iteration = iteration + 1;
        i = [i; iteration];
        xiArr = [xiArr; double(xi)];
        xip1Arr = [xip1Arr; double(xip1)];
        
        xi = xip1;
        xip1 = xi - der(xi) / der2(xi);

        fplot(xip1, f(xip1),'pr');

        disp(iteration);
        absx = abs(xip1 - xi);
        
    end
    
    T = table(i, xiArr, xip1Arr);
    T.Der = double(der(T.xiArr));
    T.Der2 = double(der2(T.xiArr));
    T.Fxi = double(f(T.xiArr));
    T.Fxip1 = double(f(T.xip1Arr));
    T.Properties.VariableNames = {'i', 'xi', 'xi+1', 'f`(xi)', 'f``(xi)', 'f(xi)', 'f(xi+1)'};
    
    disp(T);
