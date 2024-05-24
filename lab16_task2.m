% Read the image
originalImage = imread('E:\dip_img.png');

% Convert the image to grayscale
grayImage = rgb2gray(originalImage);

% Create Sobel filter kernels
sobelHorizontal = [-1 0 1; -2 0 2; -1 0 1];
sobelVertical = [-1 -2 -1; 0 0 0; 1 2 1];

% Apply Sobel filter in spatial domain
filteredSpatial = abs(conv2(double(grayImage), sobelHorizontal, 'same')) + abs(conv2(double(grayImage), sobelVertical, 'same'));

% Apply Fourier Transform to the grayscale image
fourierImage = fft2(double(grayImage));

% Create Sobel filter kernels in frequency domain
sobelHorizontalFreq = fft2(sobelHorizontal, size(grayImage, 1), size(grayImage, 2));
sobelVerticalFreq = fft2(sobelVertical, size(grayImage, 1), size(grayImage, 2));

% Apply Sobel filter in frequency domain
filteredFreq = abs(ifft2(fourierImage .* sobelHorizontalFreq)) + abs(ifft2(fourierImage .* sobelVerticalFreq));

% Threshold the filtered image
thresholdValue = 100;
binaryImage = filteredFreq > thresholdValue;

% Display the images
figure;
subplot(2, 3, 1), imshow(originalImage), title('Original Image');
subplot(2, 3, 2), imshow(filteredSpatial, []), title('Filtered Image (Spatial)');
subplot(2, 3, 3), imshow(filteredFreq, []), title('Filtered Image (Frequency)');
subplot(2, 3, 4), imshow(abs(filteredSpatial), []), title('Filtered Image (Spatial) - Absolute');
subplot(2, 3, 5), imshow(abs(filteredFreq), []), title('Filtered Image (Frequency) - Absolute');
subplot(2, 3, 6), imshow(binaryImage), title('Binary Image');
