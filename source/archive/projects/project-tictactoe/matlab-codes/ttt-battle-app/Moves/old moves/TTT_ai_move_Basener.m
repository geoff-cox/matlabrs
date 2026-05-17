% =========================================================================
% This program returns an AI move to an available space in a Tic-Tac-Toe
% game based on the set of priorities:
%
%  	1: If a winning move is available, it takes it. 
%
%   2: If a winning move for the opposing player is available, it takes it
%   (thus, blocking that move).
%
%   3: It chooses an available space at random from a uniform distribution (i.e., all spaces are equally likely
%  	to be selected).
%
% INPUT:
%   game_state (3 x 3) the current game state matrix
%   player (1 x 1) the current player ( 1 = X, -1 = O )
% OUTPUT:
%   move_to (1 x 1) absolute index of an available space on the gameboard.  
% =========================================================================
function move_to = TTT_ai_move_Basener(game_state,player)
    bar  = TTT_detect_winning_move_Basener(game_state);
    if bar == [0,0]             % No best move
        % Look for a corner trap
        if game_state(1) == player && game_state(9) == player
            if  game_state(2) == 0 && game_state(3) == 0 && game_state(6) == 0
                move_to = 3;
            end
            if  game_state(4) == 0 && game_state(7) == 0 && game_state(8) == 0
                move_to = 7;
            end
        elseif game_state(7) == player && game_state(3) == player
            if  game_state(2) == 0 && game_state(1) == 0 && game_state(4) == 0
                move_to = 1;
            end
            if  game_state(6) == 0 && game_state(9) == 0 && game_state(8) == 0
                move_to = 9;
            end
        % Make corner trap
        elseif game_state(1) == player && game_state(9) == 0
            move_to = 9;
        elseif game_state(1) == 0 && game_state(9) == player
            move_to = 1;
        elseif game_state(7) == player && game_state(3) == 0
            move_to = 3;
        elseif game_state(7) == 0 && game_state(3) == player
            move_to = 7;
        else
        % Look for empty next to player
        stop = 1;
        list = [1,4,7;2,5,8;3,6,9];
        for i = 1:3
            for j = 1:3
                if stop && game_state(i,j) == 0
                    % down
                    if i < 3 && game_state(i+1,j) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                    % down right
                    if i < 3 && j < 3 && game_state(i+1,j+1) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                    % rihgt
                    if j < 3 && game_state(i,j+1) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                    % right up
                    if i > 1 && j < 3 && game_state(i-1,j+1) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                    % up
                    if i > 1 && game_state(i-1,j) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                    % up left
                    if i > 1 && j > 1 && game_state(i-1,j-1) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                    % left
                    if j > 1 && game_state(i,j-1) == player
                        stop = 0;
                        move_to = list(i,j);
                    end
                end
            end
        end
        % Random
            if stop
                move_to = TTT44_ai_move_1_Basener(game_state);
            end
        end
    % Get win/stop win
    else
        if player == 1          % X is playing
            if bar(1) ~= 0
                move_to = bar(1);   % X wins
            else
                move_to = bar(2);   % X Blocks
            end
        else                    % O is playing
            if bar(2) ~= 0
                move_to = bar(2);   % O Wins
            else
                move_to = bar(1);   % O Blocks
            end
        end 
    end
end


function move_to = TTT44_ai_move_1_Basener(game_state)
    op = TTT42_get_open_spaces_Basener(game_state);
    [h,w] = size(op);
    if w >= 1
        r  = randi(w);
        move_to = op(r);
    else
        move_to = [];
    end
end
function locations = TTT42_get_open_spaces_Basener(game_state)
    locations = [];
    n = 1;
    for i = 1:9
        if game_state(i) == 0
            locations(n) = i;
            n = n+1;
        end
    end
end
% =========================================================================
% HR: Past HW
%
% =========================================================================