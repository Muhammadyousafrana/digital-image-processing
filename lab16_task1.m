% Define image dimensions
M = 256; % Height
N = 256; % Width

% Create black background image
image = zeros(M, N);

% Define rectangle parameters
rect_width = 100;
rect_height = 50;
rect_x = round((N - rect_width) / 2); % Center the rectangle horizontally
rect_y = round((M - rect_height) / 2); % Center the rectangle vertically

% Add white rectangle to the image
image(rect_y:rect_y+rect_height-1, rect_x:rect_x+rect_width-1) = 1;

% Calculate the DFT with zero-padding
image_fft = fftshift(fft2(image, 2*M, 2*N));

% Calculate magnitude spectrum
magnitude_spectrum = abs(image_fft);

% Brighten the display
brightened_spectrum = log(1 + magnitude_spectrum);

% Display the original image and its magnitude spectrum
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 2);
imshow(brightened_spectrum, []);
title('Magnitude Spectrum');

