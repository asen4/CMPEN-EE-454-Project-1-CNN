% (2N x 2M x D) ---> (N x M x D)
function out_image = apply_maxpool(in_image)
    
    % Get the number of rows, corresponding to the first dimension of the array 'in_image.'
    N = size(in_image, 1);

    % Get the number of columns, corresponding to the second dimension of the array 'in_image.'
    M = size(in_image, 2);

    % Get the number of channels, corresponding to the third dimension of the array 'in_image.'
    D = size(in_image, 3);

    % The goal here is to individually trim the size of N and M one at a time, since doing it simultaneously would be slightly difficult and hard to keep track of.
    
    % Let's start with trimming down the columns.
    % (2N x 2M x D) ---> (2N x M x D)
    column_shrink_image = zeros(N, M/2);

    for k = 1:D
        for i = 1:N
            for j = 1:M/2
                col_start_pos = 2 * j - 1;
                col_end_pos = 2 * j;

                % Select the maximum pixel value between two adjacent, nonoverlapping columns.
                column_shrink_image(i, j, k) = max(in_image(i, col_start_pos, k), in_image(i, col_end_pos, k));
            end
        end
    end

    % Now let's trim the number of rows.
    % (2N x M x D) ---> (N x M x D)
    row_shrink_image = zeros(N/2, M/2);

    for k = 1:D
        for j = 1:M/2
            for i = 1:N/2
                row_start_pos = 2 * i - 1;
                row_end_pos = 2 * i;

                % Likewise, select the maximum pixel value between two adjacent, nonoverlapping rows.
                row_shrink_image(i, j, k) = max(column_shrink_image(row_start_pos, j, k), column_shrink_image(row_end_pos, j, k));
            end
        end
    end

    % Set the output image as the 'row_shrink_image,' representing the final result of apply_maxpool().
    out_image = row_shrink_image;
end