function [wk, count] = InverseIteration(w,c)
    wk = w;
    count = 0;
    
    % Iterator function
    psi = @(theta, r) sqrt(r)*cos(theta/2)+1i*sqrt(r)*sin(theta/2);
    
    while(count < 100)
        count = count + 1;
        x = real(wk-c);
        y = imag(wk-c);
        theta = atan2(y,x);
        r = sqrt(x^2 + y^2);
        wk = psi(theta, r);
        wk = wk * (-1)^round(rand);
    end
end