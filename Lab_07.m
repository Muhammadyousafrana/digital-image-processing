% A=imread('rice.png');
% figure,imshow(A);title('Original Image');
% %Image Negative
% L=256;
% s= (L-1)-A;
% figure,imshow(s);title('Image negative -> S = L - 1 - r')


%  A=imread('rice.png');
% figure,imshow(A);title('Original Image'); 
% %Log Transformation
% %Input Image in type double
% r=double(A);
% C=1;
% S=C*log(1+r);
% Temp=255/(C*log(256));
% %Display image range [0 255]
% B=uint8(Temp*S);
% figure,imshow(B);title('Log Transformation -> S = clog(1+r)');


image=imread('pout.tif'); 
image_double=im2double(image);
 [r c]=size(image_double); 
cc=input('Enter the value for c==>'); 
ep=input('Enter the value for gamma==>'); 
for i=1:r     
for j=1:c        
 imout(i,j)=cc*power(image_double(i,j),ep);   
 end 
end 
figure,imshow(image);
figure,imshow(imout); 



% clear all; clc; 
% itemp = imread('pout.tif'); %read the image
% i = itemp(:,:,1); 
% rtemp = min(i);   % find the min. value of pixels in all the columns (row vector) 
% rmin = min(rtemp);      % find the min. value of pixel in the image 
% rtemp = max(i);  % find the max. value of pixels in all the columns (row vector) 
% rmax = max(rtemp);      % find the max. value of pixel in the image 
% m = 255/(rmax - rmin);  % find the slope of line joining point (0,255) to (rmin,rmax) 
% c = 255 - m*rmax;    % find the intercept of the straight line with the axis 
% i_new = m*i + c;        % transform the image according to new slope 
% figure; imshow(i);       % display original image 
% figure; imshow(i_new);   % display transformed image 



% i = imread('cameraman.tif'); % Read the image
% 
% [row, col, ~] = size(i); % Extract the dimensions of the image
% 
% % Input threshold values
% T1 = input('Enter the Lowest threshold value: ');
% T2 = input('Enter the Highest threshold value: ');
% 
% % Process each pixel in the image
% for x = 1:row
%     for y = 1:col
%         if (i(x, y) > T1) && (i(x, y) < T2)
%             i(x, y) = 255; % Set pixel to white if it meets the condition
%         else
%             % No need to modify the pixel if it doesn't meet the condition
%         end
%     end
% end
% 
% % Display the original and modified images
% figure;
% subplot(1, 2, 1);
% imshow(i); % Display the original image
% 
% subplot(1, 2, 2);
% imshow(uint8(i)); % Display the modified image with background
% 


% p=imread('cameraman.tif');
%  z=double(p); 
%  [row col]=size(z); 
%  for i=1:1:row 
%      for j=1:1:col 
%          if(z(i,j)>30)&&(z(i,j)<140) 
%              z(i,j)=255; 
%          else
%              z(i,j)=0;
%          end
%      end
%  end
%  subplot(1,2,1); imshow(p); title('Original Image'); 
%  subplot(1,2,2); imshow(uint8(z));title('Grey level slicing without background');



% A=imread('coins.png'); 
% B=bitget(A,1); 
% figure, subplot(2,2,1);imshow(logical(B));title('Bit plane 1');
% B=bitget(A,2);
% subplot(2,2,2);imshow(logical(B));title('Bit plane 2');
% B=bitget(A,3); 
% subplot(2,2,3);imshow(logical(B));title('Bit plane 3'); 
% B=bitget(A,4); 
% subplot(2,2,4);imshow(logical(B));title('Bit plane 4'); 
% B=bitget(A,5); 
% figure, subplot(2,2,1);imshow(logical(B));title('Bit plane 5'); 
% B=bitget(A,6); 
% subplot(2,2,2);imshow(logical(B));title('Bit plane 6');
% B=bitget(A,7); 
% subplot(2,2,3);imshow(logical(B));title('Bit plane 7');
% B=bitget(A,8); 
% subplot(2,2,4);imshow(logical(B));title('Bit plane 8'); 
