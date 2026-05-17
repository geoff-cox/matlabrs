% =========================================================================
% Given a minesweeper space, S, this program returns the locations of all
% the adjacent spaces of S that have not been revealed and are not mines.
%
% INPUT:
%   row (1 x 1) row of a given minesweeper space.
%   col (1 x 1) column of a given minesweeper space.
%   field (N x N) minesweeper map showing the mines and the number of
%                 adjacent mines.
%   revealed (N x N) true/false map showing which spaces have been revealed. 
% OUTPUT:
%   adj_spaces (k x 2) adjacent unrevealed and non-mine spaces to the space
%                      located at row and col.
% =========================================================================
function adj_spaces = MS_adj_unrevealed_safe_spaces_Key(row,col,field,revealed)
    N = size(field,1);
    buffed_field = -1*ones(N+2);
    buffed_field(2:end-1,2:end-1) = field;
    adj_spaces = zeros(8,2);
    space_count = 1;
    for r = row-1:row+1
        for c = col-1:col+1
            if buffed_field(r+1,c+1) ~= -1 && revealed(r,c) == 0
                adj_spaces(space_count,:) = [r,c];
                space_count = space_count + 1;
            end
        end
    end
    adj_spaces(space_count:end,:) = [];
end
% =========================================================================
% HR:
%
% =========================================================================