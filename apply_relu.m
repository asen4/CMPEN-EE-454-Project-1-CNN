% A simple function that "zeros" any negative pixel values in the input image.
% (N x M x D) ---> (N x M x D)
% Side Note: ReLU stands for Rectified Linear Unit.
function out_image = apply_relu(in_image)
    
    % Get the number of rows, corresponding to the first dimension of the array 'in_image.'
    N = size(in_image, 1);

    % Get the number of columns, corresponding to the second dimension of the array 'in_image.'
    M = size(in_image, 2);

    % Get the number of channels, corresponding to the third dimension of the array 'in_image.'
    D = size(in_image, 3);

    for i = 1:N
        for j = 1:M
            for k = 1:D
                % Within the input image, remove any negative pixel values found by "zeroing" them.
                out_image(i, j, k) = max(in_image(i, j, k), 0);
            end
        end
    end
end