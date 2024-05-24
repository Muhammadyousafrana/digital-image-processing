imgd = imread('cameraman.tif'); 
noisy_image = imnoise(imgd, 'salt & pepper' , 0.05);
filter_size = 3;
padded_image = padarray(noisy_image, [filter_size, filter_size]);
smoothed_avg_image = uint8(zeros(size(noisy_image)));
smoothed_median_image = uint8(zeros(size(noisy_image)));
for i = 1:size(noisy_image, 1)
    for j = 1:size(noisy_image, 2)
        roi = padded_image(i:i+filter_size-1, j:j+filter_size-1);
        smoothed_avg_image(i, j) = mean(roi(:));
        smoothed_median_image(i, j) = median(roi(:));
    end
end
figure;
subplot(1, 3, 1), imshow(noisy_image), title('Noisy Image');
subplot(1, 3, 2), imshow(smoothed_avg_image), title('Averaged Image');
subplot(1, 3, 3), imshow(smoothed_median_image), title('Median Filtered Image');
