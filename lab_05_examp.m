% %Conversion of color/grayscale image into binary [ 2 levels]  
% I = imread('cameraman.tif');  
% K= imfinfo('cameraman.tif');   
% if(K.BitDepth ==24)  	% An integer indicating the number of bits per pixel 
%     I=rgb2gray(I);      
% end   
% [r,c] = size(I);   
% I2= uint8(zeros(r,c));
% for i = 1:r      
% for j=1:c        
%   if (I(i,j)>128)              I2(i,j) =255;          else  
%             I2(i,j) =0;  
%         end  
%     end  
% end     
% figure,    
% subplot(121),imshow(I);   
% subplot(122),imshow(I2); 

% Shrinking the image to 1/2 
% I = imread('cameraman.tif'); K= imfinfo('cameraman.tif'); if(K.BitDepth ==24) I=rgb2gray(I);
% end 
% [r,c] = size(I); 
% I2(1:r/2, 1:c/2) = I(1:2:r, 1:2:c); 
% figure,
% subplot(1,2,1)=imshow(I); 
% figure,
% subplot(1,2,2) = imshow(I2); 


% I1 = imread('cameraman.tif'); 
% M1 = size(I1,1); % Number of rows in I 
% N1 = size(I1,2); % Number of columns in I 
% % Pick size of output image 
% M2 = 300; 
% N2 = 100; 
% I2 = zeros(M2,N2); % Allocate output 
% cx = N2/N1; % Scale in x 
% cy = M2/M1; % Scale in y
%  for x=1:N2 
% for y=1:M2 
% % Calculate position in input image 
% v = x/cx;
%  w=y/cy; 
% % We'll just pick the nearest neighbor to (v,w) 
% v = round(v);
% % rounds each element of v to the nearest integer
%  w = round(w); 
% I2(y,x) = I1(w,v); 
% end 
% end 
% subplot(1,2,1); imshow(I1); 
% subplot(1,2,2); imagesc(I2); 


%3x3 Matrix 
% A = zeros(3,3); 
% A(:)=[10,2,9,4,18,14,22,7,25]; 
% display(A); %Before Interpolation 
% C = imresize(A,[6,6],'nearest'); 
% display(C); %After Interpolation 


% Read image into the workspace. 
% I	= imread('rice.png'); 
% % Resize the image, specifying scale factor and the interpolation method. 
% J	= imresize(I, 0.5, 'nearest'); 
% % Display the original and the resized image. 
% figure, imshow(I), title('Original Image') 
% figure, imshow(J), title('Resized Image Using Nearest Neighbor')  


a =imread('cameraman.tif');
c =size(a);  
for i = 1:1:c(1)       
  b=0;         
for j = 1:1:c(2)          
 for k = 1:1:3 
     bbb(i,j+b)=a(i,j);                 
     b=b+1;          
 end          
 b=b-1;         
end  
end  
cc=size(bbb);  
 for i = 1:1:cc(2)      
 b=0;       
for j = 1:1:cc(1)           
  for k = 1:1:3
      bb(j+b,i)=bbb(j,i);
      b=b+1;          
   end      
 b=b-1;     
  end  
 end    
size(bb); 
figure, imshow(a)
figure, imshow(bb) 
