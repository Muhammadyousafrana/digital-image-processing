% Example 1
% BW1 = imread('circles.png');
% figure
% imshow(BW1)
% 
% BW2 = bwmorph(BW1,'remove');
% figure
% imshow(BW2)
% 
% BW3 = bwmorph(BW1,'skel',Inf);
% figure
% imshow(BW3)



% Example 2

% Image=imread('rice.png');
% No_Border=imclearborder(Image);
% Zoom_Original=imresize(Image,2);
% Zoom_Morphed=imresize(No_Border,2);
%  
% subplot(1,2,1)
% imshow(Zoom_Original)
% title('Original Image')
%  
% subplot(1,2,2)
% imshow(Zoom_Morphed)
% title('Zoom Morphed')

% Example 3
 
% I = imread('tire.tif');
% I2 = imfill(I);
% figure, imshow(I), figure, imshow(I2)


% ============= Task ==============
 
I = imread('tire.tif'); 
BW = imbinarize(I); 

figure;

subplot(3, 3, 1);
imshow(I); 
title('Original Grayscale Image');

subplot(3, 3, 2);
imshow(BW); 
title('Binary Image from Grayscale');

% Filled image based on specified locations
locations = [50, 50]; 
BW_fill_locations = imfill(BW, locations);
subplot(3, 3, 3);
imshow(BW_fill_locations);
title('Binary Image with Hole Filled by Seed Location');

% Filled image based on specified locations and 4-connectivity
BW_fill_conn = imfill(BW, locations, 4); % 4-connectivity
subplot(3, 3, 4);
imshow(BW_fill_conn);
title('Binary Image with Hole Filled by Seed Location and 4-Connectivity');

% Filled image with all holes filled
BW_fill_holes = imfill(BW, 'holes');
subplot(3, 3, 5);
imshow(BW_fill_holes);
title('Binary Image with All Holes Filled');

% Filled image with all holes filled (4-connectivity)
BW_fill_conn_holes = imfill(BW, 4, 'holes'); % 4-connectivity
subplot(3, 3, 6);
imshow(BW_fill_conn_holes);
title('Binary Image with All Holes Filled (4-Connectivity)');

% Grayscale image with dark regions filled
I_fill = imfill(I); 
subplot(3, 3, 7);
imshow(I_fill, []);
title('Grayscale Image with Dark Regions Filled');

% Grayscale image with dark regions filled (8-connectivity)
I_fill_conn = imfill(I, 8); 
subplot(3, 3, 8);
imshow(I_fill_conn, []);
title('Grayscale Image with Dark Regions Filled (8-Connectivity)');

