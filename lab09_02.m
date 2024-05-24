% Task_02
% Read grayscale image
img = imread('pout.tif');

% Perform histogram equalization using histeq
img_histeq = histeq(img);

% Perform histogram equalization using imadjust
img_imadjust = imadjust(img);

% Display original and equalized images
figure;
subplot(2, 3, 1);
imshow(img);
title('Original Image');

subplot(2, 3, 2);
imshow(img_histeq);
title('Equalized Image (histeq)');

subplot(2, 3, 3);
imshow(img_imadjust);
title('Equalized Image (imadjust)');

% Plot histograms
subplot(2, 3, 4);
imhist(img);
title('Original Histogram');

subplot(2, 3, 5);
imhist(img_histeq);
title('Equalized Histogram (histeq)');

subplot(2, 3, 6);
imhist(img_imadjust);
title('Equalized Histogram (imadjust)');
