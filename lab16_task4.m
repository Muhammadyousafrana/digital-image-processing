% Read the image
img = imread('cameraman.tif');

% Convert the image to grayscale if it's not already
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert the image to double precision for processing
img = double(img);

% Get the size of the image
[M, N] = size(img);

% Center of the image
cx = round(M / 2);
cy = round(N / 2);

% Define cutoff frequency
D0 = input('Enter the cutoff frequency D0: ');

% Create a meshgrid for frequency domain
[u, v] = meshgrid(1:N, 1:M);

% Compute the distance from the center of the frequency domain
D = sqrt((u - cx).^2 + (v - cy).^2);

% Define the ideal highpass filter
H = double(D > D0);

% Apply the filter in frequency domain
filtered_img = ifftshift(fft2(img)) .* H;

% Inverse Fourier transform to get back to spatial domain
filtered_img = real(ifft2(ifftshift(filtered_img)));

% Normalize the image
filtered_img = uint8(255 * mat2gray(filtered_img));

% Display original and filtered images
subplot(1,2,1), imshow(uint8(img)), title('Original Image');
subplot(1,2,2), imshow(filtered_img), title('Ideal Highpass Filtered Image');

% % Save the filtered image
% imwrite(filtered_img, 'ideal_highpass_filtered_image.jpg');
