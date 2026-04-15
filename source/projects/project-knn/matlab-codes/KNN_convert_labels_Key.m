% =========================================================================
% Given a list of data labels that are character arrays, this program
% converts these labels into a positive integer value. Additionally, this
% program outputs a key for this conversion.
%
% INPUT:
%   labels (M x 1) column vector of single characters. 
%   int_labels (M x 1) integer labels. 
% OUTPUT:
%   label_key (Q x 1) list of Q unique character labels in labels.
% =========================================================================

function [int_labels,label_key] = KNN_convert_labels_Key(labels)
    label_key = P26_unique_values_Key(labels);
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

function new_list = P26_unique_values_Key(list)
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