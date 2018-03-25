close all;
clear all;
clc;
img=imread('flowers.png');
subplot(1,3,1);imshow(img);
huidu=rgb2gray(img);        %图像灰度化
subplot(1,3,2);imshow(huidu);
thresh=graythresh(huidu);       %自动确定二值化阈值  
img_bw=im2bw(huidu,thresh);      %对图像二值化 
subplot(1,3,3);imshow(img_bw);
se=strel('disk',9);
kai=imopen(img_bw,se);
figure,subplot(1,3,1);imshow(kai);
guan=imclose(kai,se);
subplot(1,3,2);imshow(guan);
% K=bwlabel(guan);
% rgb=labelrgb(K);
% img_color=img.*img_bw;
% subplot(1,3,3);imshow(img_color);
