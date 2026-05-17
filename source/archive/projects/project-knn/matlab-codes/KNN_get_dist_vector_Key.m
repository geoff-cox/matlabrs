% =========================================================================
% Given a list of points, P_1, P_2, ..., P_N (with dimension M) and another
% point, P_0, this program computes all of the distances between P_i and
% P_0. That is,
%
%   distances = [ d(P_1,P_0)
%                 d(P_2,P_0)
%                    ... 
%                 d(P_N,P_0) ]
%
% where d(P_i,P_0) = the euclidean distance between P_i and P_0.
%
% INPUT:
%   pt_list (N x M) list of points (with dimension M). 
%   P0 (1 x M) single point (with dimension M). 
% OUTPUT:
%   distances (N x 1) list of distances between all the points in pt_list
%                     and P0.
% =========================================================================
function distances = KNN_get_dist_vector_Key(pt_list,pt)
    pt_list_diff = pt_list - pt;
    sum_of_sqrs = sum(pt_list_diff.^2,2);
    distances = sqrt(sum_of_sqrs);
end

% =========================================================================
% HR:
%
% =========================================================================