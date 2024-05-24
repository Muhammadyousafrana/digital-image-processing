% %Read an image into the workspace.
% I = imread('pout.tif');
% %Display the image and its histogram.
% figure,subplot(1,2,1),imshow(I)
% subplot(1,2,2),imhist(I,64)
% 
% I = imread('pout.tif');
% J = histeq(I);
% %Display the contrast-adjusted image and its new histogram.
% figure,subplot(1,2,1),imshow(J)
% subplot(1,2,2),imhist(J,64)

% I = imread('pout.tif');
% [J,T] = histeq(I);
% figure,plot((0:255)/255,T);

% clear;
% close all;
% 
% itemp = imread('pout.tif');  
% i = itemp(:,:,1);
% 
% rtemp = min(i);  % find the min. value of pixels in all the columns (row vector)
% rmin = min(rtemp);  % find the min. value of pixel in the image
% 
% rtemp = max(i); % find the max. value of pixels in all the columns (row vector)
% rmax = max(rtemp);  % find the max. value of pixel in the image
% 
% if rmax ~= rmin
%     m = 255 / (rmax - rmin);  % find the slope of line joining point (0,255) to (rmin,rmax)
%     c = 255 - m * rmax;  % find the intercept of the straight line with the axis
%     i_new = m * i + c; % transform the image according to new slope
% else
%     i_new = i; % if rmax and rmin are equal, no transformation is needed
% end
% 
% figure, imshow(i); % display original image
% figure, imshow(i_new); % display transformed image. 
 


% Task 1:Run the following code and show the  resultant images .
clc;
clear all;
close all;
%% loading image
Orignal_Image=imread('pout.tif');
[r,c]=size(Orignal_Image);
 
%% Calculating PDF of original Image
Image=Orignal_Image;
subplot(2,2,1)
imshow(Image)
title('Orignial Image')
subplot(2,2,2)
imhist(Image)
title('Histogram of Orignial Image')
h=imhist(Image);
pdf=h/(r*c);
 
%% Summing PDF
for i=1:256
if i==1
I(i)=pdf(i);
else
I(i)=I(i-1)+pdf(i);
end
end
 
%% Round
s=(255*(I));
s=round(s);
 
%% Image Creation after  Equalization
for k=1:256
for i=1:r
for j=1:c
if Image(i,j)==k-1
Rec(i,j)=s(k); 
else
Image(i,j)=Image(i,j);
end
end
end
end
 
%% Finall Image
subplot(2,2,3)
imshow(uint8(Rec))
title('Image after Histogram Equalization')
subplot(2,2,4)
imhist(uint8(Rec))
title('Histogram after Histogram Equalization')
