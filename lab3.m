%a=imread('E:\Web_Development\lesson_1\img\hi.jpg');
%imshow(a)

%Display mutliple images
%X1=imread('forest.tif');
%[X2,map2]=imread('trees.tif');
%subplot(1,2,1),imshow(X1);
%subplot(1,2,2),imshow(X2);


%[X1,map1]=imread('forest.tif');
%[X2,map2]=imread('trees.tif');
%subplot(1,2,1), subimage(X1,map1)
%subplot(1,2,2), subimage(X2,map2)


% [X1, map1]=imread('forest.tif');
% [X2,map2]=imread('trees.tif');
% subplot(1,2,1), imshow(X1, map1)
% subplot(1,2,2), imshow(X2, map2)


% A=rand(50);
% imwrite(A, 'E:\Web_Development\lesson_1\html.png')
% imshow('E:\Web_Development\lesson_1\html.png')

% a=imread('E:\Web_Development\lesson_1\html.png');
% imwrite(a, gray(256), 'E:\Web_Development\lesson_1\b.bmp');
% imshow('E:\Web_Development\lesson_1\b.bmp')

% I = imread('cameraman.tif');
% h = imshow(I,[0 80]); 

%task#01

% row = 256;
% col = 256;
% img = zeros(row, col);
% img(170:175, :) = 1;
% img(:, 170:175) = 1;
% figure;
% imshow(img);


% Read an image (Replace 'your_image.jpg' with the actual filename)
img = imread('E:\Web_Development\lesson_1\img\hi.jpg');

% Display the image using imagesc
imshow(img)
subplot(2, 3, 1);
imagesc(img);
title('Using imagesc');

% % Display the image using imshow
subplot(2, 3, 2);
imshow(img);
title('Using imshow');

% Get the current image displayed using getimage
currentImage = getimage;

% % Display the current image using imagesc
subplot(2, 3, 3);
imagesc(currentImage);
title('Using getimage with imagesc');


% Set the true size of the image using truesize
subplot(2, 3, 4);
imshow(img);
title('Original Image');
truesize;

% % Zoom in on a region of interest using zoom
subplot(2, 3, 5);
imshow(img);
title('Zoomed Image');
zoom(5); % Zoom in by a factor of 2

subplot(2, 3, 6);
imagesc(currentImage);
title('ColorbarImage');
colorbar;




