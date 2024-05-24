img = imread('cameraman.tif');
neg_img = (255-1) - img;
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(neg_img), title('Negated Image');