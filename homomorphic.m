function hm = homomorphic(a)
rL=0;    % 0.01
rH=1.25; % 2
c1=10;   % 1 
d0=0.01; % 200
for k1=1:size(a,3);
a1=a(:,:,k1);

[r,c]=size(a1);
P=r/2;
Q=c/2;
for i=1:r
    for j=1:c
        H(i,j)=(rH-rL)*(1-exp(-c1*((sqrt((i-P/2)^2+(j-Q/2)^2))/d0)^2))+rL;
    end
end
%H = fftshift(H);
%log
L=log(double(a1)+1);
%dft
F=fft2(L);
%filtering
F2=F.*H;
%inverse dft
iF=ifft2(F2);
%inverse log
recover(:,:,k1)=abs(exp(iF));
end
hm=uint8(recover);

 








