Image1 = imread('cameraman.tif');

rows1 = size(Image1, 1);     % Number of rows in Image1
columns1 = size(Image1, 2);  % Number of columns in Image1

% Pick size of output image
rows2 = rows1 * 2;
columns2 = columns1 * 2;

Image2 = zeros(rows2, columns2); % Allocate output image

cx = columns2 / columns1; % Scale in x
cy = rows2 / rows1;       % Scale in y

for x = 1:columns2
    for y = 1:rows2
        % Calculate position in input image
        if (mod(x, 2) == 0)
            v = round(x / cx);
            w = round(y / cy);
            Image2(y, x) = Image1(min(w, rows1), min(v, columns1));
        else
            Image2(y, x) = -1;
        end
    end
end

% Bicubic starts here
for x = 2:columns2-1
    for y = 2:rows2-1
        % Calculate position in input image
        if (x ~= 1 && x ~= columns2 && y ~= 1 && y ~= rows2)
            Image2(y, x) = (Image2(y - 1, x - 1) + Image2(y - 1, x) + Image2(y - 1, x + 1) + ...
                            Image2(y, x - 1) + Image2(y, x + 1) + ...
                            Image2(y + 1, x - 1) + Image2(y + 1, x) + Image2(y + 1, x + 1)) / 8;
        end
    end
end

% Bicubic ends here

subplot(1, 2, 1); imshow(Image1);
subplot(1, 2, 2); imagesc(Image2);
