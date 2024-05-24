
RGB_image = imread('lowlight_1.jpg');
green_channel = RGB_image(:,:,2);
threshold_level = 0.5 * max(green_channel(:));
binary_image = green_channel > threshold_level;
imshow(RGB_image);
title('Original RGB Image');
figure;
imshow(binary_image);
title('Binary Image (Green Channel Threshold)');
