BW = [0, 0, 0, 1, 0;
      0, 1, 1, 1, 0;
      0, 1, 1, 1, 0;
      0, 0, 0, 1, 0;
      0, 0, 0, 0, 0];

% Compute distance transforms
dist_transform_euclidean = bwdist(BW, 'euclidean');
dist_transform_cityblock = bwdist(BW, 'cityblock');
dist_transform_chessboard = bwdist(BW, 'chessboard');

% Display the original matrix and distance transforms
figure;

subplot(2, 2, 1);
imshow(BW);
title('Original Binary Matrix');

subplot(2, 2, 2);
imshow(dist_transform_euclidean, []);
title('Euclidean Distance Transform');
disp('Euclidean Distance Transform:');
disp(dist_transform_euclidean);

subplot(2, 2, 3);
imshow(dist_transform_cityblock, []);
title('Cityblock Distance Transform');
disp('Cityblock Distance Transform:');
disp(dist_transform_cityblock);

subplot(2, 2, 4);
imshow(dist_transform_chessboard, []);
title('Chessboard Distance Transform');
disp('Chessboard Distance Transform:');
disp(dist_transform_chessboard);