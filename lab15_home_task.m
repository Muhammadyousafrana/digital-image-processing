% Read the image
image = imread('triangle.jpg');

% Convert the image to grayscale
gray_image = rgb2gray(image);

% Threshold the grayscale image
threshold = graythresh(gray_image);
binary_image = imbinarize(gray_image, threshold);

% Display the binary image
figure;
subplot(2, 2, 1);
imshow(binary_image);
title('Binary Image');

% Structuring elements for hit-and-miss transformation
SE1 = [
    0 0 1;
    0 1 1;
    1 1 1;
];

SE2 = [
    1 1 1;
    1 0 0;
    1 0 0;
];

% Perform hit-and-miss transformation
hitmiss_result = bwhitmiss(binary_image, SE1, SE2);

% Display the hitmiss result to verify
subplot(2, 2, 2);
imshow(hitmiss_result);
title('Hit-and-Miss Transformation Result');

% Perform thinning
thinned_image = bwmorph(hitmiss_result, 'thin', Inf);

% Display the thinned image
subplot(2, 2, 3);
imshow(thinned_image);
title('Thinned Image');

% Perform thickening
thickened_image = bwmorph(hitmiss_result, 'thicken', Inf);

% Display the thickened image
subplot(2, 2, 4);
imshow(thickened_image);
title('Thickened Image');
