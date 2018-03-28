close all;
clear all;
clc;
img=imread('flowers.png');
subplot(1,3,1);imshow(img);
huidu=rgb2gray(img);               %图像灰度化
subplot(1,3,2);imshow(huidu);
% thresh=graythresh(huidu);        %自动确定二值化阈值  
img_bw=im2bw(huidu,0.1);          %对图像二值化，二值化的阈值是手动设置为0.1了
subplot(1,3,3);imshow(img_bw);
se=strel('disk',9);               %创建一个平坦的圆形结构元素，半径为9
kai=imopen(img_bw,se);            %开操作，即先腐蚀后膨胀
figure,subplot(1,2,1);imshow(kai);
guan=imclose(kai,se);             %闭操作，即先膨胀后腐蚀
subplot(1,2,2);imshow(guan);
[m,n,k] = size(img);
ind = reshape([guan,guan,guan],m,n,k); % ind是把三张二维的guan图像组合成一个三维的图像的结果
img_color = img .* uint8(ind);
figure,imshow(img_color);
imwrite(img_color,'flowers2.png');%保存图片
