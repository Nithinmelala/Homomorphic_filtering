clc;

clear all;

close all;

%kids.tif,onion.png,office_4.jpg,liftingbody.png,pears.png,pillsetc.png,rice.png,peppers.png,saturn.png,tape.png,tissue.png,westconcordaerial.png,westconcordorthophoto.png
I = imread('trees.tif'); %;concordaerial.png,gantrycrane.png,fabric.png, a1.jpg,a2.png,a3.png,a4.png,a9.jpg,forest.tif,coins.png,eight.tif,circuit.tif,board.tif,testpat1.png,pout.tif, m83.tif,circles.png

[nr1, nc1 ,nm1] = size(I);

I1 = imresize(I,[nr1/3,nc1/3]);

[nr, nc ,nm] = size(I1);

OriginalI = I1;

figure(1);

subplot(1,4,1); % using for displaying the image in single window

imshow(I1);

title('Original Image');

hm = homomorphic(I1);

%subplot(1,4,2);

%imshow(uint8(hm));

%title(' Enhanced Image ');

a = hm(:,:,1);

a1 = a == 255;

for k1 = 1:nr 
    
    for k2 = 1:nc
        
        if(a1(k1,k2) ==1)  
            
            for k3 = 1:nm
                
            hm(k1,k2,k3) = OriginalI(k1,k2,k3);
            
            end 
            
        end
        
    end   
    
end

%%
hm1 = hm;

for k3 = 1:nm
    
for k1 = 2:nr-1
    
    for k2 = 2:nc-1
        
        data1 = hm(k1-1:k1+1,k2-1:k2+1,k3);
        
        hm1(k1,k2,k3) = mean(data1(:));
        
    end
    
end

end 

hm1;
subplot(1,4,2);
imshow(uint8(hm1));
title('Homomorphic filter');

alpha = 0.5;
beta = 1.5;
Hemphasis = alpha + beta*hm1;

%figure(1);
%subplot(1,5,3);
%plot(1:30,hm1(1,1:30),'r',1:30,Hemphasis(1,1:30),'b','LineWidth',2);
%grid on;
%legend('High-pass Filter','High-frequency Emphasis Filter','Location','best');

%figure() 
%subplot(1,2,1)
%imhist(I1,64)
%title('Histogram of Original Image');
%subplot(1,2,2)
%imhist(hm1,64)
%title('Histogram of Homomotphic filter Image');








