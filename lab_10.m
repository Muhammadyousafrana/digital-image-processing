% img = imread('cameraman.tif');
% imgd = im2double(img);   % imgd in [0,1]
% f = ones(3,3)/9;
% img1 = filter2(f, imgd);
% subplot(121);imshow(img);
% subplot(122);imshow(img1);


% img = imread('cameraman.tif');
% imgd = im2double(img);   % imgd in [0,1]
% imgd = imnoise(imgd,'salt & pepper',0.02);
% f = ones(3,3)/9;
% img1 = filter2(f, imgd);
% subplot(121);imshow(imgd);
% subplot(122);imshow(img1);

% img = imread('cameraman.tif'); 
% imgd = im2double(img); % imgd in [0 , 1] 
% imgd=imnoise(imgd, 'salt & pepper' , 0.05); 
%  
% [x , y]=size(imgd); %get size of imgd 
% g=zeros(x+2,y+2); %create padded imgd (called g)  
% B=zeros(size(imgd)); %first fill with zeros 
%  
% %store imgd within g 
% for i=1:x    
%  for j=1:y 
%         g(i+1,j+1)=imgd(i,j); 
%     end  
% end 
%    %let the window be an array 
%                  %store the 3 x 3 neighbour values in the array 
%                         %store and find the middle element 
% for i=1:size(g,1)- 2               
%     for j=1:size(g,2) - 2 
%               window = zeros(3,3);               
%               inc=1; 
%          for x =1:3 
%            for y = 1:3 
%                  window(inc)= g(i+x-1,j+y-1); 
%                  inc=inc+1;           
%            end 
%          end 
%                  med=sort(window);                  
%                  disp(med) 
%                  %place the median in output matrix 
%                  B(i,j)= med(5);%median is at 5th location in 3x3 matrix. 
%     end
%  end 
% subplot(1,3,1) ,imshow(img);title('Original Image'); 
% subplot(1,3,2) ,imshow(imgd);title('Noisy Image');  
% subplot(1,3,3) ,imshow(B); title('smooth with median filter');

% 
% I = imread('cameraman.tif');
% J = imnoise(I,'salt & pepper',0.02);
% K = medfilt2(J);
% subplot(121);imshow(J);
% subplot(122);imshow(K);



% 
% img = imread('cameraman.tif'); 
% imgd = im2double(img); % Convert image to double, imgd in [0 , 1] 
% imgd = imnoise(imgd, 'salt & pepper', 0.05); 
% 
% [x, y] = size(imgd); % Get size of imgd 
% g = zeros(x + 2, y + 2); % Create padded imgd (called g)  
% B = zeros(size(imgd)); % First fill with zeros 
% 
% % Store imgd within g 
% for i = 1:x    
%     for j = 1:y 
%         g(i + 1, j + 1) = imgd(i, j); 
%     end  
% end 
% 
% % Create Gaussian kernel
% h = fspecial('gaussian', [3, 3], 1); % You can adjust the size and standard deviation (sigma) as needed
% 
% % Apply Gaussian blur filter
% for i = 1:size(g, 1) - 2               
%     for j = 1:size(g, 2) - 2 
%         window = g(i:i+2, j:j+2); % Get the 3x3 window from the padded image
%         % Convolve the window with the Gaussian kernel
%         blurred_pixel = sum(sum(window .* h));
%         B(i, j) = blurred_pixel; 
%     end
% end 
% 
% subplot(1, 3, 1), imshow(img); title('Original Image'); 
% subplot(1, 3, 2), imshow(imgd); title('Noisy Image');  
% subplot(1, 3, 3), imshow(B); title('Smooth with Gaussian Blur Filter');


% I = imread('E:\Trip\a.jpg');
% I = rgb2gray(I);
% f = edge(I, 'sobel');
% imshow(f);
% % imshow(I);

% img  = imread('E:\Trip\b.jpg');
% red = img(:,:,1)
% green = img(:,:,2)
% blue = img(:,:,3);
% red = adapthisteq(red);
% green = adapthisteq(green);
% blue = adapthisteq(blue);
% img = cat(3,red ,green,blue);
% % img = imsharpen(img);
% imshow(img);

% shadow = imread("E:\Trip\b.jpg");
% shadow_lab = rgb2lab(shadow);
% %The values of luminosity span a range from 0 to 100. Scale the values to the range [0 1], which is the expected range of images with data type double.
% max_luminosity = 100;
% L = shadow_lab(:,:,1)/max_luminosity;
% %Perform the three types of contrast adjustment on the luminosity channel, and keep the a* and b* channels unchanged. Convert the images back to the RGB color space.
% shadow_imadjust = shadow_lab;
% shadow_imadjust(:,:,1) = imadjust(L)*max_luminosity;
% shadow_imadjust = lab2rgb(shadow_imadjust);
%  
% shadow_histeq = shadow_lab;
% shadow_histeq(:,:,1) = histeq(L)*max_luminosity;
% shadow_histeq = lab2rgb(shadow_histeq);
%  
% shadow_adapthisteq = shadow_lab;
% shadow_adapthisteq(:,:,1) = adapthisteq(L)*max_luminosity;
% shadow_adapthisteq = lab2rgb(shadow_adapthisteq);
% %Display the original image and the three contrast adjusted images as a montage.
% figure
% montage({shadow,shadow_imadjust,shadow_histeq,shadow_adapthisteq},"Size",[1 4]);title("Original Image and Enhanced Images using " + ...
%     "imadjust, histeq, and adapthisteq")

% 
% % Read the RGB image.
% rgbImage = imread('E:\Trip\b.jpg');
% 
% % Extract the green channel.
% greenChannel = rgbImage(:, :, 2);
% 
% % Calculate the mean and standard deviation of the green channel.
% meanGreen = mean(greenChannel(:));
% stdGreen = std(double(greenChannel(:)));
% 
% % Set the constant 'k' for thresholding.
% k = 0.5; % Adjust 'k' as needed.
% 
% % Calculate the threshold value.
% thresholdValue = meanGreen + k * stdGreen;
% 
% % Create the binary image by thresholding the green channel.
% binaryImage = greenChannel > thresholdValue;
% 
% % Display the binary image.
% imshow(binaryImage);



% clc
% clear all
% close all
%  
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


[X,map] = imread('trees.tif');
imshow(X,map),title('Indexed image');
