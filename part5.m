phi = @(z) z^2 + 0.36 + 0.1*1i;
c = 0.36 + 0.1*1i;
ar = -1.8; br = 1.8; ai = -0.7; bi = 0.7; step = 0.01;
result = connected (phi,ar, br, ai, bi, step,c);

function result = connected (phi, ar, br, ai, bi, step,c)
     element = 0;
     orbit = [];  
     i = 0; %safe point
     while (ismember(orbit,element) == 0 & i<1000) %calculate orbit of 0
         element  = feval(phi,element);
         orbit = [orbit element];
         i = i+1;
     end
     rlength = (br-ar)/step + 1; %find out points in Julia set
     ilength = (bi-ai)/step + 1;
     O = zeros(1, ilength*rlength);
     j = 1; 
    for y = ai:step:bi
        i = 1; 
        for x = ar:step:br
            w = x+1i*y;
            wk = InverseIteration(w, c);
            i = i+1;
            O((j-1)*rlength + i) = wk;
        end
        j = j+1;
    end
    result = 0; %the set is connected if result is 0
    for k = 1: length(orbit)
        if ismember(O, orbit(i)) == 0
            result = result+1;
        end
    end           
end
