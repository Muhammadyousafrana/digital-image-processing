% Read the input image
img = imread('cameraman.tif');
% Define the Sobel kernel for horizontal edge detection
sobel_kernel_horizontal = [-1 0 1;
                           -2 0 2;
                           -1 0 1];
% Pad the image to avoid border effects
img_padded = padarray(double(img), [1, 1]);
output = zeros(size(img));
% Apply the Sobel operator
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        % Perform convolution
        window = img_padded(i:i+2, j:j+2);
        output(i, j) = sum(sum(window .* sobel_kernel_horizontal));
    end
end
% Normalize the output to [0, 255]
output = uint8((output - min(output(:))) / (max(output(:)) - min(output(:))) * 255);
figure;
subplot(1, 2, 1); imshow(img); title('Original Image');
subplot(1, 2, 2); imshow(output); title('Sobel Horizontal Edge Detection');
