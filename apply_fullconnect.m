% (N x M x D1) ---> (1 x 1 x D2)
function out_image = apply_fullconnect(in_image, filterbank, biasvals) 
    % Get the number of filters, corresponding to the fourth dimension of the array 'filterbank.'    
    % Recall the filterbank is of size (N x M x D1 x D2).
    % numFilters is D2.
    numFilters = size(filterbank, 4); 

    out_image = zeros(1, 1, numFilters);

    % Reshape the input image with new dimensions, a 1D vector of length (N * M * D1).
    % Essentially speaking, this flattens the 3D image into a single column vector.
    inarray_flat = reshape(in_image, [], 1); 

    % Using numFilters, reshape the filterbank with new dimensions, a 2D matrix of size (N * M * D1) x D2.
    filterbank_flat = reshape(filterbank, [], numFilters); 

    % Compute the output image as per the formula provided in the handout instructions.
    % filterbank_flat' takes the transpose of the original filterbank_flat, with new size of D2 × (N * M * D1).
    % This performs a dot product between the flattened input image and each of the flattened filters in the filterbank.
    out_image(1, 1, :) = filterbank_flat' * inarray_flat + biasvals(:); 
end
