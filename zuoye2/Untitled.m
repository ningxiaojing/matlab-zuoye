close all;
clear all;
clc;
img=imread('flowers.png');
subplot(1,3,1);imshow(img);
huidu=rgb2gray(img);               %ͼ��ҶȻ�
subplot(1,3,2);imshow(huidu);
% thresh=graythresh(huidu);        %�Զ�ȷ����ֵ����ֵ  
img_bw=im2bw(huidu,0.1);          %��ͼ���ֵ������ֵ������ֵ���ֶ�����Ϊ0.1��
subplot(1,3,3);imshow(img_bw);
se=strel('disk',9);               %����һ��ƽ̹��Բ�νṹԪ�أ��뾶Ϊ9
kai=imopen(img_bw,se);            %�����������ȸ�ʴ������
figure,subplot(1,2,1);imshow(kai);
guan=imclose(kai,se);             %�ղ������������ͺ�ʴ
subplot(1,2,2);imshow(guan);
[m,n,k] = size(img);
ind = reshape([guan,guan,guan],m,n,k); % ind�ǰ����Ŷ�ά��guanͼ����ϳ�һ����ά��ͼ��Ľ��
img_color = img .* uint8(ind);
figure,imshow(img_color);
imwrite(img_color,'flowers2.png');%����ͼƬ
