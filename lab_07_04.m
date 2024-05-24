img = imread('cameraman.tif');
subplot(3, 3, 1), imshow(img), title('Original Image');
for i = 1:8
    bit_mask = bitget(img, i);
    subplot(3, 3, 1 + i), imshow(logical(bit_mask)), title(['Bit plane ', int2str(i)]);
end
