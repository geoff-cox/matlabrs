% =========================================================================
%  Given a list of GPS coordinates, P_1, P_2, ..., P_N, and another point,
%  P_0, on earth, this program computes all of the distances between P_i
%  and P_0. That is,
%
%   distances = [ d(P_1,P_0)
%                 d(P_2,P_0)
%                    ... 
%                 d(P_N,P_0) ]
%
%  where d(P_i,P_0) = global distance between P_i and P_0.
%
% INPUT:
%   pt_list (N x 2) list of GPS (degree) coordinates. 
%   P0 (1 x 2) single GPS (degree) coordinate. 
% OUTPUT:
%   distances (N x 1) list of distances between all the points in pt_list
%                     and P0.
% =========================================================================
function distances = TSP_get_global_dist_vector_Key(pt_list,P0)
    number_of_points = size(pt_list,1);
    distances = zeros(number_of_points,1);
    for k = 1:number_of_points
       distances(k) = TSP_global_dist_Key([pt_list(k,:);P0]); 
    end
end
% =========================================================================
% HR:
%
% =========================================================================

% HELPER FUNCTIONS
% Paste your TSP_global_dist code here
function g_dist = TSP_global_dist_Key(P)
    rad_of_earth = 3959;
    lat1 = P(1,1)*pi/180;
    lat2 = P(2,1)*pi/180;
    lon1 = P(1,2)*pi/180;
    lon2 = P(2,2)*pi/180;
    dlat = (lat1-lat2);
    dlon = (lon1-lon2);

    h = (sin(dlat/2))^2+cos(lat1)*cos(lat2)*(sin(dlon/2))^2;
    g_dist=2*rad_of_earth*asin(sqrt(h));
end