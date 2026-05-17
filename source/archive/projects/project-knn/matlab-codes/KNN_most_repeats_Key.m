% =========================================================================
% Given a column vector of numbers, this program returns the value that
% occurs most often.
%
% INPUT:
%   values (m x 1) a column vector of numeric values. 
% OUTPUT:
%   val (1 x 1) value in values that occurs most often.
% =========================================================================
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
%
% If you called any programs from a previous HW assignment in this function,
% copy and paste them here.  Otherwise, delete this comment.
%
% =========================================================================
% HR:
%
% =========================================================================