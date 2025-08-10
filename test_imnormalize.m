% Load the debugging data.
load('debuggingTest.mat');

% Apply the normalization function.
% We'll test the first layer itself, hencing passing in the the original input image 'imrgb.'
normalized_image = apply_imnormalize(imrgb);

% Compare with the expected output.
expected_output = layerResults{1};
difference = abs(normalized_image - expected_output);
max_difference = max(difference(:));
fprintf('Maximum difference between computed and expected output: %e\n', max_difference);

% Visualize the results.
figure;
subplot(1, 3, 1);
imshow(imrgb);
title('Original Image');

subplot(1, 3, 2);
imshow(normalized_image + 0.5);  % Add 0.5 to bring back to [0, 1] range for visualization
title('Normalized Image');

subplot(1, 3, 3);
imshow(expected_output + 0.5);  % Add 0.5 to bring back to [0, 1] range for visualization
title('Expected Output');