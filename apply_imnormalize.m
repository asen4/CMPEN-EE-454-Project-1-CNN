% A simple function that scales each color channel's pixel values into the output range from -0.5 to 0.5.
% (N x M x 3) ---> (N x M x 3)
function out_image = apply_imnormalize(in_image)

    % Get the number of rows, corresponding to the first dimension of the array 'in_image.'
    num_rows = size(in_image, 1);

    % Get the number of columns, corresponding to the second dimension of the array 'in_image.'
    num_cols = size(in_image, 2);

    % Get the number of channels, corresponding to the third dimension of the array 'in_image.'
    num_channels = size(in_image, 3);

    % Convert all pixel values to doubles within the input image.
    double_in_image = double(in_image(:, :, :));

    % Create the output image, with the same size dimensions as the input image.
    out_image = zeros(num_rows, num_cols, num_channels);

    % Scale all pixel values down and store them in the output image. 
    out_image(:, :, :) = double_in_image / 255 - 0.5;
end
