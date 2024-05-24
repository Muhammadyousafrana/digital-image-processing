% Read the image
img = imread('cameraman.tif');

% Convert the image to double precision for processing
img = double(img);

% Display the original image
figure;
subplot(2, 3, 1);
imshow(uint8(img));
title('Original Image');

% Apply FFT2
fft_img = fft2(img);

% Display the magnitude spectrum of FFT2
subplot(2, 3, 2);
imshow(log(1 + abs(fftshift(fft_img))), []);
title('Magnitude Spectrum (FFT2)');

% Apply IFFT2
ifft_img = ifft2(fft_img);

% Display the reconstructed image using IFFT2
subplot(2, 3, 3);
imshow(uint8(ifft_img));
title('Reconstructed Image (IFFT2)');

% Define lowpass Gaussian filter
[M, N] = size(img);
sigma = 20;
[X, Y] = meshgrid(1:N, 1:M);
centerX = ceil(N/2);
centerY = ceil(M/2);
gaussian_filter = exp(-((X - centerX).^2 + (Y - centerY).^2) / (2*sigma^2));

% Apply the lowpass Gaussian filter in frequency domain
filtered_fft_img = fft_img .* gaussian_filter;
% Reconstruct the image using IFFT2 after applying the filter
filtered_img = ifft2(filtered_fft_img);

% Display the filtered image
subplot(2, 3, 4);
imshow(uint8(abs(filtered_img)));
title('Lowpass Gaussian Filtered Image');
% Define highpass Laplacian filter
laplacian_filter = fspecial('laplacian', 0);

% Apply the highpass Laplacian filter
highpass_filtered_img = imfilter(img, laplacian_filter);

% Display the highpass filtered image
subplot(2, 3, 5);
imshow(uint8(abs(highpass_filtered_img)));
title('Highpass Laplacian Filtered Image');
