% Binary image matrix
bw = [1 1 1 0 0 0 0 0;
      1 1 1 0 1 1 0 0;
      1 1 1 0 1 1 0 0;
      1 1 1 0 0 0 1 0;
      1 1 1 0 0 0 1 0;
      1 1 1 0 0 0 1 0;
      1 1 1 0 0 1 1 0;
      1 1 1 0 0 0 0 0;
     ];

% Get dimensions of the binary image
bw_rows = size(bw, 1);
bw_cols = size(bw, 2);

% Matrix to store labels, initialize label counter, and track equivalence pairs
labels = zeros(bw_rows, bw_cols);
label_no = 0;
equivalence_pairs = [];
equ_row = 0;

% First pass to assign labels
for col = 1:bw_cols
    for row = 1:bw_rows
        p = bw(row, col); % Get pixel value

        if p == 0
            continue  % Skip background pixels
        else % When pixel value is 1
            % Check neighbors and assign labels
            if (row ~= 1) && (col ~= 1)
                top = bw(row-1, col);
                left = bw(row, col-1);
                top_lb = labels(row-1, col);
                left_lb = labels(row, col-1);

                if (top == 0) && (left == 0)
                    label_no = label_no + 1;
                    labels(row, col) = label_no;
                elseif ((top == 0) && (left ~= 0)) || ((top ~= 0) && (left == 0))
                    if (top == 1)
                        labels(row, col) = top_lb;
                    else
                        labels(row, col) = left_lb;
                    end
                else
                    % Both neighbors are 1's
                    if top_lb == left_lb
                        labels(row, col) = top_lb;
                    else
                        labels(row, col) = left_lb;
                        equ_row = equ_row + 1;
                        equivalence_pairs(equ_row, 1) = top_lb;
                        equivalence_pairs(equ_row, 2) = left_lb;
                    end
                end
            elseif (row == 1 && col ~= 1)
                % Operates on 1st row elements except 1st column element
                left = bw(row, col-1);
                left_lb = labels(row, col-1);

                if (left == 0)
                    label_no = label_no + 1;
                    labels(row, col) = label_no;
                else
                    labels(row, col) = left_lb;
                end
            elseif (row ~= 1 && col == 1)
                % Operates on 1st column elements except 1st row element
                top = bw(row-1, col);
                top_lb = labels(row-1, col);

                if (top == 0)
                    label_no = label_no + 1;
                    labels(row, col) = label_no;
                else
                    labels(row, col) = top_lb;
                end
            else
                % Operates on the first element
                label_no = label_no + 1;
                labels(row, col) = label_no;
            end
        end
    end
end

% Display labels and equivalence pairs after the first pass
disp('Labels after the first pass:');
disp(labels);
disp('Equivalence pairs:');
disp(equivalence_pairs);

% Processing equivalence pairs to form equivalence classes
equivalence_classes = equivalence_pairs(1, :);
e_row = 1;

[rows, cols] = size(equivalence_pairs);

for i = 2:rows
    for j = 1:cols
        new_class_row = 0;
        [class_rows, class_cols] = size(equivalence_classes);
        
        % Check if the current pair belongs to an existing class
        for k = 1:class_rows
            for m = 1:class_cols
                if (equivalence_pairs(i, j) == equivalence_classes(k, m))
                    new_class_row = 1;
                    count = 1;
                    class_cols = size(equivalence_classes, 2);
                    
                    % Add new values to the existing class
                    for n = 1:class_cols
                        equi_val = equivalence_pairs(i, n);
                        if (equivalence_pairs(i, j) ~= equi_val)
                            equivalence_classes(k, class_cols+count) = equi_val;
                            count = count + 1;
                        end
                    end
                    break
                end
            end
        end
        
        % If the pair doesn't belong to an existing class, create a new class
        if (j == size(equivalence_pairs, 2) && new_class_row ~= 1)
            e_row = e_row + 1;
            equivalence_classes(e_row, 1:cols) = equivalence_pairs(i, 1:cols);
        end
    end
end

% Display the final equivalence classes
disp('Final Equivalence Classes:');
disp(equivalence_classes);

% Second pass to replace each label by the label assigned to its equivalence classes
[class_rows, class_cols] = size(equivalence_classes);

for col = 1:bw_cols
    for row = 1:bw_rows
        if labels(row, col) ~= 0
            % Find and replace labels with their corresponding equivalence class labels
            for i = 1:class_rows
                for j = 1:class_cols
                    if labels(row, col) == equivalence_classes(i, j)
                        labels(row, col) = max(equivalence_classes(i, :));
                    end
                end
            end
        end
    end
end

% Display the final labeled image
disp('Labeled Image:');
disp(labels);
