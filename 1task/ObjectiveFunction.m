function [f] = objectiveFunction(studNr) %f - return value
    %studNr 1x1xxab    
    temp = num2str(studNr);
    
    a = str2num(temp(6));
    b = str2num(temp(7));
    
    if (b == 0)
        b = studNr;
        while(b > 9)
            temp = b;
            b = 0;
            while (temp ~= 0)
                b = b + mod(temp, 10)
                temp = floor(temp / 10)
            end
        end
    end
    
    syms f(x);
    f(x) = (x^2 - a)^2/b - 1;
    