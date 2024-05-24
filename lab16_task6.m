% Read the image
image = imread('cameraman.tif'); % Replace 'your_image_path.jpg' with the actual path to your image file

% Convert the image to double precision
image = im2double(image);

% Define the size of the filter (e.g., same as the image size)
M = size(image, 1);
N = size(image, 2);

% Create a meshgrid for frequency domain coordinates
[u, v] = meshgrid(1:N, 1:M);

% Compute the distance from the origin
D = sqrt((u - M/2).^2 + (v - N/2).^2);

% Set the value of D0 (given as 120)
D0 = 120;

% Compute the filter response
H = 1 - exp(-(D.^2) / (2 * D0^2));

% Apply the filter to the image in the frequency domain
filtered_image = fftshift(fft2(image)) .* H;

% Inverse Fourier transform to get the filtered image in spatial domain
filtered_image = ifft2(ifftshift(filtered_image));

% Display the filtered image
imshow(abs(filtered_image), []);
title('Filtered Image');
