phi = inline('z^2-1.25');
x = linspace(-1.8,1.8,1000);
y = linspace(-0.7,0.7,1000);
img = zeros(1000, 1000);
for i = 1:1000
    for j = 1:1000
        z(i,j) = x(i) + y(j) * 1i;
        zk = z(i,j);
        kount = 0; 
        while kount<50 && abs(zk)<2
            kount = kount + 1;
            zk = phi(zk);
            err1 = abs(zk-fixpt1);
            if err1<1.e-6, iflag1=iflag1+1; else, iflag1=0; end;
            err2 = abs(zk-fixpt2);
            if err2<1.e-6, iflag2=iflag2+1; else, iflag2=0; end;
        end;
        img(i,j) = kount;
    end; 
     
end;
        
img = img';
I = imagesc(img)
colormap('jet')