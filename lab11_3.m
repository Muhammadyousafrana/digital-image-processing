rgbImage = imread('peppers.png');
% grayImage = rgb2gray(rgbImage);
sobelR = edge(rgbImage(:,:,1), 'Sobel');
sobelG = edge(rgbImage(:,:,2), 'Sobel');
sobelB = edge(rgbImage(:,:,3), 'Sobel');

cannyR = edge(rgbImage(:,:,1), 'Canny');
cannyG = edge(rgbImage(:,:,2), 'Canny');
cannyB = edge(rgbImage(:,:,3), 'Canny');

sobelEdges = sobelR | sobelG | sobelB;
cannyEdges = cannyR | cannyG | cannyB;

figure;
subplot(2,2,1), imshow(sobelR), title('Sobel - Red Channel');
subplot(2,2,2), imshow(sobelG), title('Sobel - Green Channel');
subplot(2,2,3), imshow(sobelB), title('Sobel - Blue Channel');
subplot(2,2,4), imshow(sobelEdges), title('Sobel - Combined');

figure;
subplot(2,2,1), imshow(cannyR), title('Canny - Red Channel');
subplot(2,2,2), imshow(cannyG), title('Canny - Green Channel');
subplot(2,2,3), imshow(cannyB), title('Canny - Blue Channel');
subplot(2,2,4), imshow(cannyEdges), title('Canny - Combined');
