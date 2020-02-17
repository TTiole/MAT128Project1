function Julia(c, ar, br, ai, bi, step)
    % c is the parameter for the iteration function
    % Fxdpnt is an array of fixed points
    % ar is the lower bound of the real part
    % br is the upper bound of the real part
    % ai is the lower bound of the imaginary part
    % bi is the upper bound of the imaginary part
    % step is the step size
    
    rlength = (br-ar)/step + 1; % Number of real parts
    ilength = (bi-ai)/step + 1; % Number of imaginary parts
    
    O = zeros(1, ilength*rlength);
    
    j = 1; % Iterators
    for y = ai:step:bi
        i = 1; % Iterator
        for x = ar:step:br
            w = x+1i*y;
            [wk, count] = InverseIteration(w, c);

            i = i+1;
            O((j-1)*rlength + i) = wk;
        end
        j = j+1;
    end
    plot(O, '.');
    xlim([ar, br]);
    ylim([ai, bi]);
    axis xy;
end