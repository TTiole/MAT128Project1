phi = inline('zk^2+c');
fixpt1 = (1+sqrt(6))/2;
fixpt2 = (1-sqrt(6))/2; 
x = linspace(-1.5,1.5,1000);
y = linspace(-0.7,0.7,1000);
img = zeros(800, 1000);
c = zeros(800, 1000);

for i = 1:800
    for j = 1:1000
        zk = 0;
        c(i,j) = x(i) + y(j) * 1i;
        kount = 0;
        while kount<100 && abs(zk)<2
            kount = kount + 1;
            zk = zk^2+c(i,j);
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
