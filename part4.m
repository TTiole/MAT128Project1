image = imread("fig-i-a.png");
dim = cal_dimension(image);
disp(dim)

function dim = cal_dimension(image)
     figure = double(image);
     m = size(figure,1); %create grid
     a = floor(log2(m));
     b = 2.^(1:a);
     Nr = zeros(1,a);
     for i = 1:a
         c = b(i);
         d = m/c;
         for j = 1:d %differential box-counting method
             for k = 1:d
                 A = figure(c*(j-1)+[1:c],c*(k-1)+[1:c]);
                 minim = min(A(1:end));
                 maxim = max(A(1:end));
                 nr = fix(maxim/c)-fix(minim/c)+1;
                 Nr(i) = Nr(i) + nr;
             end
         end
     end
     r = m./b;
     val = polyfit(log10(r),log10(Nr),1); %least square linear fit
     dim = val(1);
end
