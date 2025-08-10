function main_routine()
    % Loading this file defines imageset, trueclass, and classlabels.
    load('cifar10testdata.mat');
    
    % Loading this file defines filterbanks and biasvectors.
    load('CNNparameters.mat');

    % Because we are using ten classes, let's initialize the confusion matrix as a 10x10 grid.
    confusion_matrix = zeros(10, 10);
    
    % Traverse through all 10 classes.
    for classindex = 1:10
        % Get indices of all images of that class.
        inds = find(trueclass == classindex);

        % Traverse through all 1,000 images within a class.
        for img_idx = 1:length(inds)
            % Get the current image for this class.
            imrgb = imageset(:, :, :, inds(img_idx));
    
            % Apply all 18 layers of the CNN in sequence.
            final_output = apply_cnn(imrgb, filterbanks, biasvectors);
    
            % Analyze the classification result to see if the predicted and true class match or not.
            [~, predicted_class] = max(squeeze(final_output));
            true_class = trueclass(inds(img_idx));
    
            % Update the confusion matrix accordingly.
            confusion_matrix(true_class, predicted_class) = confusion_matrix(true_class, predicted_class) + 1;
        end
    
    end

    % Compute and display the accuracy using the formula provided in the handout instructions.
    accuracy = sum(diag(confusion_matrix)) / sum(confusion_matrix(:)) * 100;
    fprintf('Overall Accuracy: %.2f%%\n', accuracy);

    % Display the confusion matrix.
    disp('Confusion Matrix:');
    disp(confusion_matrix);

end

% A helper function to apply the 18 layers of the CNN in sequence accordingly as defined in the handout instructions.
function output18 = apply_cnn(input_image, filterbanks, biasvectors)
    % Layer 1: Image Normalization
    output1 = apply_imnormalize(input_image);
        
    % Layer 2: Convolution
    output2 = apply_convolve(output1, filterbanks{2}, biasvectors{2});
        
    % Layer 3: ReLU
    output3 = apply_relu(output2);

    % Layer 4: Convolution
    output4 = apply_convolve(output3, filterbanks{4}, biasvectors{4});
    
    % Layer 5: ReLU
    output5 = apply_relu(output4);
    
    % Layer 6: Maxpool
    output6 = apply_maxpool(output5);
    
    % Layer 7: Convolution
    output7 = apply_convolve(output6, filterbanks{7}, biasvectors{7});
    
    % Layer 8: ReLU
    output8 = apply_relu(output7);

    % Layer 9: Convolution
    output9 = apply_convolve(output8, filterbanks{9}, biasvectors{9});
    
    % Layer 10: ReLU
    output10 = apply_relu(output9);
    
    % Layer 11: Maxpool
    output11 = apply_maxpool(output10);
    
    % Layer 12: Convolution
    output12 = apply_convolve(output11, filterbanks{12}, biasvectors{12});
    
    % Layer 13: ReLU
    output13 = apply_relu(output12);
    
    % Layer 14: Convolution
    output14 = apply_convolve(output13, filterbanks{14}, biasvectors{14});
    
    % Layer 15: ReLU
    output15 = apply_relu(output14);

    % Layer 16: Maxpool
    output16 = apply_maxpool(output15);

    % Layer 17: Fullconnect
    output17 = apply_fullconnect(output16, filterbanks{17}, biasvectors{17});
    
    % Layer 18: Softmax
    output18 = apply_softmax(output17);
end