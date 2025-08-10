% (1 x 1 x D) ---> (1 x 1 x D)
function out_image = apply_softmax(in_image)

    % Get the number of channels, corresponding to the third dimension of the array 'in_image.'
    D = size(in_image, 3);

    % Calculate alpha, the maximum value in the input image.
    alpha = max(in_image(:));
  
    % Preallocate two arrays with 0s, a temp array and the final output array.
    temp = zeros(1, 1, D);
    out_image = zeros(1, 1, D);
  
    % Calculate the exponentials and sum as per the formula provided in the handout instructions.
    sum = 0;
    for k = 1:D
        temp(1, 1, k) = exp(in_image(1, 1, k) - alpha);
        sum = sum + temp(1, 1, k);
    end
  
    % Calculate the final probabilities by computing the quotient.
    for k = 1:D
        out_image(1, 1, k) = temp(1, 1, k) / sum;
    end
end