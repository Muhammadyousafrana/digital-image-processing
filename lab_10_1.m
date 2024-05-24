img = imread('cameraman.tif'); 
imgd = im2double(img); % Convert image to double, imgd in [0 , 1] 
imgd = imnoise(imgd, 'salt & pepper', 0.05); 

[x, y] = size(imgd); % Get size of imgd 
g = zeros(x + 2, y + 2); % Create padded imgd (called g)  
B = zeros(size(imgd)); % First fill with zeros 

% Store imgd within g 
for i = 1:x    
    for j = 1:y 
        g(i + 1, j + 1) = imgd(i, j); 
    end  
end 

% Apply averaging filter
for i = 1:size(g, 1) - 2               
    for j = 1:size(g, 2) - 2 
        window = zeros(3, 3);               
        inc = 1; 
        for x = 1:3 
            for y = 1:3 
                window(inc) = g(i + x - 1, j + y - 1); 
                inc = inc + 1;           
            end 
        end 
        % Calculate average and place it in the output matrix 
        avg = mean(window(:)); % Calculate the mean of all elements in the window
        B(i, j) = avg; 
    end
end 

subplot(1, 3, 1), imshow(img); title('Original Image'); 
subplot(1, 3, 2), imshow(imgd); title('Noisy Image');  
subplot(1, 3, 3), imshow(B); title('Smooth with Averaging Filter');
