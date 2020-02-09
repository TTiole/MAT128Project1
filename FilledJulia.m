function FilledJulia(phi,fxdpnt, ar, br, ai, bi, step)
    % Phi is iteration function
    % Fxdpnt is an array of fixed points
    % ar is the lower bound of the real part
    % br is the upper bound of the real part
    % ai is the lower bound of the imaginary part
    % bi is the upper bound of the imaginary part
    % step is the step size
    
    rlength = (br-ar)/step + 1; % Number of real parts
    ilength = (bi-ai)/step + 1; % Number of imaginary parts
    
    colormap([1 0 0; 1 1 1]);
    
    M = 2 * ones(ilength, rlength);
    
    j = 1; % Iterators
    for y = ai:step:bi
        i = 1; % Iterator
        for x = ar:step:br
            z = x+1i*y;
            [zk, count, converged] = NewtonMethod(z, phi, fxdpnt);
            if(count >= 100 || converged)
                M(j, i) = 1;
            end
            i = i+1;
        end
        j = j+1;
    end
    image([ar, br], [ai, bi], M);
    axis xy;
end

