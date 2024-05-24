% Read the image
Image = imread('cameraman.tif');
cannyEdges = edge(Image, 'Canny');
laplacianEdges = edge(Image, 'log');
subplot(1,3,1), imshow(Image), title('Original Image');
subplot(1,3,2), imshow(cannyEdges), title('Canny Edges');
subplot(1,3,3), imshow(laplacianEdges), title('Laplacian Edges');
