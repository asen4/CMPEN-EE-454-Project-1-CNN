% Load the debugging data.
load('debuggingTest.mat');
load('CNNparameters.mat');

% Find the softmax layer.
softmax_layer = find(strcmp(layertypes, 'softmax'));

% We'll test layer 18 for example, hence indexing by 1.
% Get input and expected output.
input_data = layerResults{softmax_layer - 1};
expected_output = layerResults{softmax_layer};

% Apply the softmax function.
computed_output = apply_softmax(input_data);

% Compare with the expected output.
difference = abs(computed_output - expected_output);
max_difference = max(difference(:));
fprintf('Maximum difference between computed and expected output: %e\n', max_difference);

% Visualize the results.
figure;

% Input visualization.
subplot(2,2,1);
bar(squeeze(input_data));
title('Input');
ylabel('Value');
xlabel('Class');

% Computed output visualization.
subplot(2,2,2);
bar(squeeze(computed_output));
title('Computed Output');
ylabel('Probability');
xlabel('Class');

% Expected output visualization.
subplot(2,2,3);
bar(squeeze(expected_output));
title('Expected Output');
ylabel('Probability');
xlabel('Class');

% Difference visualization.
subplot(2,2,4);
bar(squeeze(difference));
title('Difference (Computed - Expected)');
ylabel('Difference');
xlabel('Class');

% Print the computed and expected probabilities.
fprintf('\nComputed probabilities:\n');
disp(squeeze(computed_output)');
fprintf('\nExpected probabilities:\n');
disp(squeeze(expected_output)');