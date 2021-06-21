I = imread('concordaerial.png');
figure(1);
subplot(1,4,1); % using for displaying the image in single window
imshow(I);title('Original Image');

I = im2double(I);
I = log(1 + I);

M = 2*size(I,1) + 1;
N = 2*size(I,2) + 1;

sigma = 10;

[X, Y] = meshgrid(1:N,1:M);
centerX = ceil(N/2);
centerY = ceil(M/2);
gaussianNumerator = (X - centerX).^2 + (Y - centerY).^2;
H = exp(-gaussianNumerator./(2*sigma.^2));
H = 1 - H;

%figure(1);
%subplot(1,5,4); % using for displaying the image in single window
%imshow(H);
%title('Filter Image');
%imshow(H,'InitialMagnification',25)

H = fftshift(H);

If = fft2(I, M, N);
Iout = real(ifft2(H.*If));
Iout = Iout(1:size(I,1),1:size(I,2));

%imshowpair(I, Ihmf, 'montage')


alpha = 0.5;
beta = 1.5;
Hemphasis = alpha + beta*H;


%figure(1);

%subplot(1,5,4); % using for displaying the image in single window
%plot(1:30,H(1,1:30),'r',1:30,Hemphasis(1,1:30),'b','LineWidth',2);
%grid on;
%legend('High-pass Filter','High-frequency Emphasis Filter','Location','best');
%title('Grapgh');
If = fft2(I, M, N);
Iout = real(ifft2(Hemphasis.*If));
Iout = Iout(1:size(I,1),1:size(I,2));

Ihmf_2 = exp(Iout) - 1;
figure(1);

subplot(1,4,2); % using for displaying the image in single window

%imshowpair(I, Ihmf_2, 'montage')
imshow(Ihmf_2);title('Homomorphic filter');

%imshowpair(Ihmf, Ihmf_2, 'montage')