function NewtonComplexIteration(ar, br, ai, bi, step, phi, dphi)
    rlength = (br-ar)/step + 1; % Number of real parts
    ilength = (bi-ai)/step + 1;
    M = 2 * ones(ilength, rlength);
    
    j = 1; % Iterators
    for y = ai:step:bi
        i = 1; % Iterator
        for x = ar:step:br
            z = x+1i*y;
            [zk, count, converged] = NewtonComplex(z, phi, dphi);
            if(converged)
                M(j, i) = count;
            else
                M(j,i) = count+1;
            end
            i = i+1;
        end
        j = j+1;
    end
    figure
    colormap(parula);
    imagesc([ar, br], [ai, bi],M);
    axis xy;
end