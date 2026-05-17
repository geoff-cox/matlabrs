function outcome = HW4P8_winner_check(game_board)
    checkSums = P3_matrix_path_sums_Key(game_board);
    n=length(checkSums);
    outcome = 0;
    for i = 1:n
        if checkSums(i) == 3
            outcome = 1;
            return
        elseif checkSums(i) == -3
            outcome = -1;
            return
        end
    end
end

function values = P3_matrix_path_sums_Key(A)
    values = zeros(8,1);
    i=1;
    for r=1:3
        values(i) = sum(A(r,:));
        i=i+1;
    end
    for c=1:3
        values(i) = sum(A(:,c));
        i=i+1;
    end
    [values(i),values(i+1)] = P2_cross_diagonal_sums_Key(A);
end

% =========================================================================
% Helper Function: cross_diagonal_sums
% =========================================================================

function [down_diagonal_sum,up_diagonal_sum] = P2_cross_diagonal_sums_Key(A)
    [m,n]=size(A);
    down_diagonal_sum = 0;
    up_diagonal_sum = 0;
    for i=1:n
        down_diagonal_sum = down_diagonal_sum + A(i,i);
        up_diagonal_sum = up_diagonal_sum + A(m-i+1,i);
    end
end