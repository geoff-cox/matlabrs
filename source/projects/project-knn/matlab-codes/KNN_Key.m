%=========================================================================
% This program is an implementation of the K-Nearest Neighbor (KNN)
% Algorithm for data label prediction.
%
% INPUT:
%   k          (1x1)  number of neighboring points used to predict each 
%                     unknown label (category).
%   data       (N1xM) numeric matrix containing labeled data features in
%                     each row.
%   labels     (N1x1) character array containing the labels for each data
%                     feature in 'data'.
%   new_data   (N2xM) numeric matrix containing unlabeled data features in
%                     each row.
% OUTPUT:
%   new_labels (N2x1) character array containing the labels for each row in
%                     'new_data'
%=========================================================================
function [new_labels,label_map] = KNN_Key(k,data,data_labels,new_data)

    M = size(new_data,1);

    [numeric_labels,label_map] = KNN_convert_labels_Key(data_labels);

    if isnumeric(data_labels)
        new_labels(M,1) = 0;
    else
        new_labels(M,1) = ' ';
    end

    for m = 1:M
        distance_vector = KNN_get_dist_vector_Key(data,new_data(m,:));
        [~,new_order] = sort(distance_vector);
        k_nearest_labels = numeric_labels(new_order(1:k));
        label = KNN_most_repeats_Key(k_nearest_labels);
        new_labels(m) = label_map(label,:);
    end

end

function [int_labels,label_key] = KNN_convert_labels_Key(labels)
    label_key = KNN_unique_values_Key(labels);
    N = length(labels(:,1));
    int_labels = zeros(N,1);
    for k = 1:numel(labels)
        j = 1;
        while labels(k) ~= label_key(j)
            j = j + 1;
        end
        int_labels(k) = j;
    end
end
function distances = KNN_get_dist_vector_Key(pt_list,pt)
    pt_list_diff = pt_list - pt;
    sum_of_sqrs = sum(pt_list_diff.^2,2);
    distances = sqrt(sum_of_sqrs);
end
function val = KNN_most_repeats_Key(values)
    [unique_vals,unique_idxs] = unique(values);
    max_k = 1;
    max_count = sum(values == unique_vals(max_k));
    for k = 2:numel(unique_vals)
        this_count = sum(values == unique_vals(k));
        if this_count > max_count
            max_count = this_count;
            max_k = k;
        elseif this_count == max_count && unique_idxs(k) < unique_idxs(max_k)
            max_count = this_count;
            max_k = k;
        end
    end
    val = unique_vals(max_k);
end
function new_list = KNN_unique_values_Key(list)
    N = numel(list);
    new_list = list;
    k = 1;
    m = 1;
    del_vals = zeros(1,N);
    while k < N
        for j = k+1:N
            if new_list(k) == new_list(j)
                del_vals(m) = j;
                m = m + 1;
            end
        end
        k = k + 1;
    end
    del_vals(m:end) = [];
    new_list(del_vals) = [];
end
