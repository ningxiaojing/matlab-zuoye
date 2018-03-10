close all;
clear all;
clc;
I=imread('1.jpg');
I=im2double(I);                       %是将输入图像变为浮点图像
[M,N,~]=size(I);
sig1=10;
H1=hpfilter('gaussian',M,N,sig1);
J1=(fft2(I,size(H1,1),size(H1,2)));
K1=J1.*H1;                            %低通滤波
L1=real(ifft2((K1)));
figure;imshow(L1);
% PQ=paddedsize(size(I));
% D0=0.05*PQ(1);
% H2=hpfilter('gaussian',PQ(1),PQ(2),D0);
% J2=fftshift(fft2(I,size(H2,1),size(H2,2)));
% K2=J2.*H2;
% L2=real(ifft2(ifftshift(K2)));
% L2=L2(1:size(I,1),1:size(I,2));
% figure;imshow(L2);
sig2=10;
H2=lpfilter('gaussian',M,N,sig2);
J2=(fft2(I,size(H2,1),size(H2,2)));
K2=J2.*H2;                              %高通滤波
L2=real(ifft2((K2)));
figure;imshow(L2);
ditong=imcrop();                        %剪裁图片
figure;imshow(ditong);
g=imadjust(ditong,[],[],0.4);           %对图片进行gamma校正
figure;imshow(g);
imwrite(g,'2.jpg');
