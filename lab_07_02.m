img = imread('forest.tif');
img_double = im2double(img);
c = 255 / (log(1 + max(img_double(:))));
log_img = c * log(1 + img_double);
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(log_img), title('Log Transform Image');