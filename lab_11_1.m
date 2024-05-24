img = imread('cameraman.tif');
% Define Prewitt kernels for horizontal and vertical edge detection
prewitt_horizontal = [-1 -1 -1; 0 0 0; 1 1 1];
prewitt_vertical = [-1 0 1; -1 0 1; -1 0 1];
% Pad the image to handle edge effects
pad_size = floor(size(prewitt_horizontal, 1) / 2);
img_padded = padarray(double(img), [pad_size, pad_size]);
% Initialize output matrices for horizontal and vertical edges
edges_horizontal = zeros(size(img));
edges_vertical = zeros(size(img));
% Convolve the image with Prewitt kernels to detect edges
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        % Extract the region of interest
        roi = img_padded(i:i+2*pad_size, j:j+2*pad_size);
        % Perform convolution
        edges_horizontal(i, j) = sum(sum(roi .* prewitt_horizontal));
        edges_vertical(i, j) = sum(sum(roi .* prewitt_vertical));
    end
end
% Combine horizontal and vertical edges to get the final edge image
edges_combined = sqrt(edges_horizontal.^2 + edges_vertical.^2);
% Display the original image, the combined edge-detected image, and the binary edge-detected image
subplot(1, 3, 1);
imshow(uint8(img));
title('Original Image');
subplot(1, 3, 2);
imshow(uint8(edges_combined), []);
title('Prewitt Edge Detection');