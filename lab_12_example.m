% my_rgb= imread('peppers.png');
%  
% a = zeros(size(my_rgb, 1), size(my_rgb, 2));
%  
%  red = my_rgb(:,:,1);
%  just_red = cat(3, red, a, a);
%  
%  green = my_rgb(:,:,2);
%  just_green = cat(3, a, green, a);
%  
%  blue = my_rgb(:,:,3);
%  just_blue = cat(3, a, a, blue);
%  
% subplot(1,3,1),title('Red Channel'),imshow(just_red);
%  
% subplot(1,3,2),title('Green Channel'),imshow(just_green );
%  
% subplot(1,3,3),title('Blue Channel'),imshow( just_blue);

% Enhance the Brightness of Red Channel through constant addition method.



% img= imread('peppers.png');
%  
% a = zeros(size(img, 1), size(img, 2));
%  
%  red = img(:,:,1);
%  just_red = cat(3, red, a, a);
%  
%  just_red1=1.5 .*just_red;
%  
%  subplot(1,2,1),title('red channel with low brightness'),imshow(just_red);
%  
%  subplot(1,2,2),title('red channel after brightness control'),imshow(just_red1);


%contrast stretching through histogram equalization of Red channel
% my_rgb= imread('peppers.png'); 
% red = my_rgb(:,:,1);
% subplot(1,2,1),title('original Red channel histogram  '),imhist(red,64);
% subplot(1,2,2),title('equalized histogram of  red channel'), imhist(histeq(red,64));


% Read the image
shadow = imread("lowlight_1.jpg");

% Convert RGB image to CIELAB color space
shadow_lab = rgb2lab(shadow);

% The values of luminosity span a range from 0 to 100. Scale the values to the range [0 1]
max_luminosity = 100;
L = shadow_lab(:,:,1)/max_luminosity;

% Perform the three types of contrast adjustment on the luminosity channel, and keep the a* and b* channels unchanged.
shadow_imadjust = shadow_lab;
shadow_imadjust(:,:,1) = imadjust(L)*max_luminosity;
shadow_imadjust = lab2rgb(shadow_imadjust);

shadow_histeq = shadow_lab;
shadow_histeq(:,:,1) = histeq(L)*max_luminosity;
shadow_histeq = lab2rgb(shadow_histeq);

shadow_adapthisteq = shadow_lab;
shadow_adapthisteq(:,:,1) = adapthisteq(L)*max_luminosity;
shadow_adapthisteq = lab2rgb(shadow_adapthisteq);

% Display the original image and the three contrast adjusted images as a montage.
figure
montage({shadow,shadow_imadjust,shadow_histeq,shadow_adapthisteq},"Size",[1 4])
title("Original Image and Enhanced Images using imadjust, histeq, and adapthisteq")
