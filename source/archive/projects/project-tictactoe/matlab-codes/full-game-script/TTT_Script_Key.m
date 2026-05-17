%% Tic-Tac-Toe Full Game with GUI
clc; close all;
%% ------ Set general variables
player_names = 'XO';
winner = 0;
game_state = zeros(3);
player = 1;
moves = 0;
X_level = 0;
O_level = 0;

%% ------ Display welcome message
fprintf('\n Hello, let''s play Tic-Tac-Toe!\n\n');

% ------ Ask pre-game questions
% Q: How many players (0,1,2)
% if A = 0: 
%   Q1: What is the AI level of player, X? (1,2,3)
%   Q2: What is the AI level of player, O? (1,2,3)
% if A = 1: 
%   Q1: Would you like to be player X (move 1st) or O?
%   Q2: What AI level would you like to play against? (1,2,3)
% if A = 2 or any other value: 
%   no questions, just start the game.

while true
    num_of_players = str2double(input('\nHow many players?  (Type 0, 1, or 2 and hit enter.) ','s'));
    if isnumeric(num_of_players)
        if sum(num_of_players == [0 1 2]) == 1
            break
        end
    end
end    

switch num_of_players
    case 0
        while true
            X_level = str2double(input('Select player X''s ability level.  (Type 1, 2, or 3 and hit enter.) ','s'));
            if isnumeric(X_level)
                if sum(X_level == [1 2 3]) == 1; break; end;
            end
        end    
        while true
            O_level = str2double(input('Select player O''s ability level.  (Type 1, 2, or 3 and hit enter.) ','s'));
            if isnumeric(O_level)
                if sum(O_level == [1 2 3]) == 1; break; end;
            end
        end   
    case 1
        while true
            player_choice = input('Would you like to play X or O?  (X moves first) ','s');
            if lower(player_choice) == 'x'
                X_level = 0;
                O_level = input('Select player O''s ability level.  (Type 1, 2, or 3 and hit enter.) ');
                break
            elseif lower(player_choice) == 'o'
                X_level = input('Select player X''s ability level.  (Type 1, 2, or 3 and hit enter.) ');
                O_level = 0;
                break
            end
        end 
end

%% ------ Display blank game GUI
figure('Position',[100,100,650,600]);
plot([2 2],[1 4],'k',[3 3],[1 4],'k',[1 4],[2 2],'k',[1 4],[3 3],'k','LineWidth',3); hold on;
axis([0 5 0 5]); 
axis equal;
ax = gca; ax.XColor = 'none'; ax.YColor = 'none';
        
%% ------ Game loop
while winner == 0 && moves < 9
    if player == 1
        switch X_level
            case 0
                space = TTT_player_move_Key(game_state,player);
            case 1
                space = TTT_ai_move_1_Key(game_state);
            case 2
                space = TTT_ai_move_2_Key(game_state,player);
            otherwise
                space = TTT_ai_move_3_Key(game_state,player);
        end
    else
        switch O_level
            case 0
                space = TTT_player_move_Key(game_state,player);
            case 1
                space = TTT_ai_move_1_Key(game_state);
            case 2
                space = TTT_ai_move_2_Key(game_state,player);
            otherwise
                space = TTT_ai_move_3_Key(game_state,player);
        end
    end
    game_state(space) = player;
    TTT_add_move_Key(space,player);
    pause(0.2);
    moves = moves+1;
    winner = TTT_winner_check_Key(game_state);
    player = -player;
end
%% ------ Display result in title of the figure
if winner ~= 0
    title(['Player ',player_names(1-(winner-1)/2),' wins!'],'FontSize',24);
else
    title('Tie Game','FontSize',24);
end

%% END OF SCRIPT

%% ------------------------------------------------------
%  ---------- PASTE ALL HELPER FUNCTIONS BELOW ----------
function move_to = TTT_ai_move_1_Key(game_state)
    open_spaces = TTT_get_open_spaces_Key(game_state);
    num_open_spaces = length(open_spaces);
    randomIndex = randi(num_open_spaces);
    move_to = open_spaces(randomIndex);
end
function move_to = TTT_ai_move_2_Key(game_state,player)

    % check for winning moves
    player_status = TTT_detect_winning_move_Key(game_state);
    if player_status(1) ~= 0         % make a winning move
        move_to = player_status(1);
    elseif player_status(2) ~= 0     % block a winning move
        move_to = player_status(2);
    else
        move_to = TTT_ai_move_1_Key(game_state);
    end 
end

function move_to = TTT_ai_move_3_Key(tttBoard,player)
    open_spaces = find(tttBoard(:)==0);
    spaces_left = length(open_spaces);
    firstplayer = player;
    if tttBoard(5) == 0 % Take center space
        move_to = 5;
        return
    elseif spaces_left == 8 && tttBoard(5) == 1
        move_to = 9;       % Take corner space if center is taken
        return
    end
    move_to = open_spaces(1); % default move
    for i=1:spaces_left
        scoreMove = TTT_move_score(tttBoard,player,9-spaces_left,open_spaces(i),firstplayer);   
        if scoreMove == 1  % Good move, take it
            move_to = open_spaces(i);
            return;
        elseif scoreMove == 0 % Neutral move, keep looking for better
            move_to = open_spaces(i);
        end
    end
end
function score = TTT_move_score(tttBoard,player,round,thisMove,firstplayer)
    tttBoard(thisMove) = player;
    if firstplayer*TTT_winner_check_Key(tttBoard) > 0
        score = 1;
        return;
    elseif firstplayer*TTT_winner_check_Key(tttBoard) < 0
        score = -1;
        return;
    else
        openSpaces = TTT_get_open_spaces_Key(tttBoard(1:end));
        spacesLeft = length(openSpaces);
        if spacesLeft == 0
            score = 0;
            return;
        end
        scores = nan(1,spacesLeft);
        i=1;
        if spacesLeft > 0
            while round <= 9 && length(find(~isnan(scores))) < spacesLeft
                next_move = openSpaces(i);
                score = TTT_move_score(tttBoard,-player,round+1,next_move,firstplayer);
                scores(i) = score;
                tttBoard(next_move) = 0;
                i=i+1;
            end
        end
        if firstplayer*player == 1
            score = min(scores);
        else
            score = max(scores);
        end
    end
end
function move = TTT_player_move_Key(game_state,player)
    coord2idx = [3 2 1;6 5 4;9 8 7];
    if player == 1
        title('Player X, pick a space','FontSize',24);
    else
        title('Player O, pick a space','FontSize',24);
    end
    need_click = 1;
    while need_click
        mouse_click = floor(ginput(1));
        if prod(abs(mouse_click-2) <= 1)
            move = coord2idx(mouse_click(1),mouse_click(2));
            if game_state(move) == 0
                need_click = 0;
            end
        end
    end
end
function TTT_add_move_Key(move,player)
    idx2coord = [1 3;1 2;1 1;2 3;2 2;2 1;3 3;3 2;3 1];   
             
    if player == 1
        text(idx2coord(move,1)+0.18,idx2coord(move,2)+0.525,'X','fontsize',70,'color','red')
    else
        text(idx2coord(move,1)+0.125,idx2coord(move,2)+0.525,'O','fontsize',70,'color','blue')
    end
end
function player_status = TTT_detect_winning_move_Key(game_state)
    player_status = zeros(1,2);
    tempBoard = game_state;
    spaces = TTT_get_open_spaces_Key(game_state);
    player = [1 -1];
    for p = 1:2
        k = 1;
        done = 0;
        while k <= numel(spaces) && ~done
            tempBoard(spaces(k)) = player(p);
            if TTT_winner_check_Key(tempBoard) == player(p)
                player_status(p) = spaces(k);
                done = 1;
            end
            tempBoard = game_state;
            k = k + 1;
        end
    end
end
function locations = TTT_get_open_spaces_Key(game_state)
    n = numel(game_state);
    locations = zeros(1,n);
    j = 1;
    for k = 1:n
        if game_state(k) == 0
            locations(j) = k;
            j = j+1;
        end
    end
    locations(j:end) = [];
end
function winner = TTT_winner_check_Key(game_state)
    path_sums = P32_matrix_sums_Key(game_state);
    winner = 0;
    k = 1;
    while winner == 0 && k <= numel(path_sums)
        if path_sums(k) == 3
            winner = 1;
        elseif path_sums(k) == -3
            winner = -1;
        end
        k = k + 1;
    end
end
function values = P32_matrix_sums_Key(A)
    row_sums = sum(A,2);
    col_sums = sum(A)';
    dia_sums = P31_diagonal_sums_Key(A);
    values = [row_sums;col_sums;dia_sums];
end
function diag_sums = P31_diagonal_sums_Key(A)
    [m,n]=size(A);

    if m < n  % get the min of m and n
        max_i = m;
    else
        max_i = n;
    end

    down_diagonal_sum = 0; % initialize the sums
    up_diagonal_sum = 0;

    for i = 1:max_i
        down_diagonal_sum = down_diagonal_sum + A(i,i);
        up_diagonal_sum = up_diagonal_sum + A(m-i+1,i);
    end

    diag_sums = [down_diagonal_sum;up_diagonal_sum];
end