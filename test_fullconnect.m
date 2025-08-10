% Load the debugging data.
load('debuggingTest.mat');
load('CNNparameters.mat');

% Find the fullconnect layer.
fullconnect_layer = find(strcmp(layertypes, 'fullconnect'));

% We'll test layer 17 for example, hence indexing by 1.
% Get input, filterbank, bias values, and expected output.
input_data = layerResults{fullconnect_layer - 1};
filterbank = filterbanks{fullconnect_layer};
biasvals = biasvectors{fullconnect_layer};
expected_output = layerResults{fullconnect_layer};

% Apply the fullconnect function.
computed_output = apply_fullconnect(input_data, filterbank, biasvals);

% Compare with the expected output.
difference = abs(computed_output - expected_output);
max_difference = max(difference(:));
fprintf('Maximum difference between computed and expected output: %e\n', max_difference);

% Difference visualization.
subplot(2,2,4);
bar(squeeze(difference));
title('Difference (Computed - Expected)');
ylabel('Difference');

% Print the computed and expected outputs.
fprintf('\nComputed output:\n');
disp(squeeze(computed_output)');
fprintf('\nExpected output:\n');
disp(squeeze(expected_output)');