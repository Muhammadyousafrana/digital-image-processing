rgbImage = imread('peppers.png');
noise_std = 25;

noisyR = imnoise(rgbImage(:,:,1), 'gaussian', 0, (noise_std^2)/255^2);
noisyG = imnoise(rgbImage(:,:,2), 'gaussian', 0, (noise_std^2)/255^2);
noisyB = imnoise(rgbImage(:,:,3), 'gaussian', 0, (noise_std^2)/255^2);

filteredR = medfilt2(noisyR);
filteredG = medfilt2(noisyG);
filteredB = medfilt2(noisyB);

% Combine the filtered channels using the bitwise OR operator
filteredImage = zeros(size(rgbImage));
filteredImage(:,:,1) = filteredR;
filteredImage(:,:,2) = filteredG;
filteredImage(:,:,3) = filteredB;

% Display the images
figure;
subplot(1,3,1), imshow(rgbImage), title('Original Image');
subplot(1,3,2), imshow(uint8(cat(3, noisyR, noisyG, noisyB))), title('Noisy Image');
subplot(1,3,3), imshow(uint8(filteredImage)), title('Filtered Image');

