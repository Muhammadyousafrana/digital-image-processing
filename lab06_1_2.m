% Task_02
image = imread("cameraman.tif")
% Specify the rotation angle
angle = 45;

% Rotate the image using Linear interpolation
rotated_linear = imrotate(image, angle, 'bilinear');

% Rotate the image using Bicubic interpolation
rotated_bicubic = imrotate(image, angle, 'bicubic');

% Display the original and rotated images
figure;
subplot(1, 3, 1), imshow(image), title('Original Image');
subplot(1, 3, 2), imshow(rotated_linear), title('Rotated (Linear)');
subplot(1, 3, 3), imshow(rotated_bicubic), title('Rotated (Bicubic)');
