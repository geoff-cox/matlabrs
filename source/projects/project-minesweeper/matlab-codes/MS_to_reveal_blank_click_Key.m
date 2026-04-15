  % =========================================================================
% Given a blank minesweeper space, S, this program returns the locations of
% all the spaces that should be revealed based on this blank space being
% pressed.
%
% INPUT:
%   row (1 x 1) row of a given blank minesweeper space.
%   col (1 x 1) column of a given blank minesweeper space.
%   field (N x N) minesweeper map showing the mines and the number of
%                 adjacent mines.
%   revealed (N x N) true/false map showing which spaces have been revealed. 
% OUTPUT:
%   to_reveal (K x 2) a list of all spaces to reveal.
% =========================================================================

function to_reveal = MS_to_reveal_blank_click_Key(row,col,field,revealed)
    reveal_chain = [row,col];
    explored = revealed;
    explored(row,col) = 1;
    to_reveal    = zeros(numel(revealed),2);
    k = 1;
    while size(reveal_chain,1) > 0
        to_reveal(k,:) = reveal_chain(1,:);
        row = reveal_chain(1,1);
        col = reveal_chain(1,2);
        if field(row,col) == 0
            adj_spaces = MS_adj_unrevealed_safe_spaces_Key(row,col,field,explored);
            for m = 1:size(adj_spaces)
                explored(adj_spaces(m,1),adj_spaces(m,2)) = 1;
            end
            reveal_chain = [reveal_chain;adj_spaces];
        end
        reveal_chain(1,:) = [];
        k = k + 1;
    end
    to_reveal(k:end,:) = [];
end

% =========================================================================
% HR:
%
% =========================================================================