% Read the image
img = imread('cameraman.tif');

% Convert the image to grayscale if it's not already
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert the image to double precision for processing
img = double(img);

% Define Laplacian filter
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];

% Apply Laplacian filter
filtered_img = conv2(img, laplacian_filter, 'same');

% Enhance edges using highpass filter
enhanced_img = img - filtered_img;

% Normalize the image
enhanced_img = uint8(255 * mat2gray(enhanced_img));

% Display original and filtered images
subplot(1,2,1), imshow(uint8(img)), title('Original Image');
subplot(1,2,2), imshow(enhanced_img), title('Highpass Laplacian Filtered Image');

% % Save the filtered image
% imwrite(enhanced_img, 'highpass_laplacian_filtered_image.jpg');
