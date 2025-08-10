% Load the debugging data.
load('debuggingTest.mat');
load('CNNparameters.mat');

% Find the appropriate layers for RELU.
relu_layers = find(strcmp(layertypes, 'relu'));

% We'll test layer 3 for example, hence indexing by 1.
input_layer = relu_layers(1) - 1;
output_layer = relu_layers(1);
input_data = layerResults{input_layer};
expected_output = layerResults{output_layer};

% Apply the RELU function.
computed_output = apply_relu(input_data);

% Compare with the expected output.
difference = abs(computed_output - expected_output);
max_difference = max(difference(:));
fprintf('Maximum difference between computed and expected output: %e\n', max_difference);

% Visualize the results.
figure;

% Input visualization.
subplot(2, 3, 1);
imshow(mean(input_data, 3) + 0.5);
title('Input');

% Computed output visualization.
subplot(2, 3, 2);
imshow(mean(computed_output, 3) + 0.5);
title('Computed Output');

% Expected output visualization.
subplot(2, 3, 3);
imshow(mean(expected_output, 3) + 0.5);
title('Expected Output');