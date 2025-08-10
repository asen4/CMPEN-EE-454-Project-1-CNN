% (N x M x D1) ---> (N x M x D2)
function out_image = apply_convolve(in_image, filterbank, biasvals)
    % Get the number of filters, corresponding to the fourth dimension of the array 'filterbank.'
    numFilters = size(filterbank, 4);

    % Get the number of rows, corresponding to the first dimension of the array 'in_image.'
    N = size(in_image, 1);

    % Get the number of columns, corresponding to the second dimension of the array 'in_image.'
    M = size(in_image, 2);

    % Get the number of channels, corresponding to the third dimension of the array 'in_image.'
    D = size(in_image, 3);
   
    out_image = zeros(N, M, numFilters);
  
    for i = 1:numFilters
        conv_result = zeros(N, M);

        for j = 1:D
            % Apply the formula provided in the handout instructions.
            % Convolve the input image is convolved with the corresponding channel of the filter.
            conv_result = conv_result + imfilter(in_image(:, :, j), filterbank(:, :, j, i), 'conv');
        end

        % Add the scalar bias value.
        out_image(:,:,i) = conv_result + biasvals(i);
    end
end