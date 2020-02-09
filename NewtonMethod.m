function [zk, count, converged] = NewtonMethod(z, phi, fxdpnt)
    zk = z;
    iflag = zeros(1, length(fxdpnt));
    count = 0;
    
    while(count < 100 && abs(zk) < 2 && all(iflag < 5))
        count = count + 1;
        zk = phi(zk);
        for i = 1:length(fxdpnt)
            if(abs(zk - fxdpnt(i)) < 10^(-6))
                iflag(i) = iflag(i)+1;
            else
                iflag(i) = 0;
            end
        end
    end
    
    if(any(iflag >= 5))
        converged = true;
    else
        converged = false;
    end
end