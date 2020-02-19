function [zk, count, converged] = NewtonComplex(z, phi, dphi)
    zk = z;
    iflag = 0;
    count = 0;
    
    while(count < 100 && abs(zk) < 2 && iflag < 5)
        count = count + 1;
        zk = zk - phi(zk)/dphi(zk);
        if(abs(phi(zk)) < 10^(-6))
            iflag = iflag + 1;
        else
            iflag = 0;
        end
    end
    
    if(iflag >= 5)
        converged = true;
    else
        converged = false;
    end
end