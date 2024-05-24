Image1 = imread('cameraman.tif'); 
rows1 = size(Image1,1);  	% Number of rows in I 
columns1 = size(Image1,2);  	   % Number of columns in I 
% Pick size of output image 
rows2 = rows1 * 2; 
columns2 = columns1 * 2; 
Image2 = zeros(rows2 + 2,columns2 + 2); 	% Allocate output image
	 
cx = columns2/columns1;  	 		% Scale in x 
cy = rows2/rows1;  	 	 	% Scale in y 
for x=2:columns2-1 
for y=2:rows2-1 
% Calculate position in input image  
if (mod(x,2) == 0)    
  v = round(x/cx);     
w = round(y/cy); 
    Image2(y,x) = Image1(w,v);  
else 
     Image2(y,x) = -1;  
end 
% Bilinear Startshere 
end 
end 
 for x=2:columns2-1 
for y=2:rows2-1 
% Calculate position in input image   
if (Image2(y,x) == -1) 
Image2(y,x) = (Image2(y - 1,x) + Image2(y + 1,x) + Image2(y,x - 1) + Image2(y,x + 1)) / 4;    
end 
% Bilinear  
end 
end 
subplot(1,2,1); 
imshow(Image1); 
subplot(1,2,2); 
imagesc(Image2); 




