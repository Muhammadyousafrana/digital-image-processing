% Read original and reference grayscale images
original_img = imread('pout.tif');
reference_img = imread('cameraman.tif');

% Match histogram of original image to reference image
matched_img = imhistmatch(original_img, reference_img);

% Display original, reference, and matched images
figure;
subplot(2, 3, 1);
imshow(original_img);
title('Original Image');
subplot(2, 3, 4);
imhist(original_img);
title('Histogram of Original Image');

subplot(2, 3, 2);
imshow(reference_img);
title('Reference Image');
subplot(2, 3, 5);
imhist(reference_img);
title('Histogram of Reference Image');

subplot(2, 3, 3);
imshow(matched_img);
title('Matched Image');
subplot(2, 3, 6);
imhist(matched_img);
title('Histogram of Matched Image');
