%% Tic-Tac-Toe Full Game with GUI
clc; close all;

% ------ Display welcome message
fprintf('\nHello, let''s play Tic-Tac-Toe!\n\n');

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
levels = [0 0];
num_of_players = input('\nHow many players?  (Type 0, 1, or 2 and hit enter.) ');
if num_of_players == 0
    levels(1) = input('Select player X''s ability level. (Type 1, 2, or 3 and hit enter.) ');
    levels(2) = input('Select player O''s ability level. (Type 1, 2, or 3 and hit enter.) ');
elseif num_of_players == 1
    player_choice = input('Would you like to play X or O?  (X moves first) ','s');
    if lower(player_choice) == 'x'
        levels(2) = input('Select player O''s ability level.  (Type 1, 2, or 3 and hit enter.) ');
    else
        levels(1) = input('Select player X''s ability level.  (Type 1, 2, or 3 and hit enter.) ');
    end
end

% ------ Set game state variables
game_state = zeros(3);
winner = 0;
player = 1;
moves = 0;

% ------ Display blank game GUI
figure('Position',[100,100,650,600]);
plot([0 5],[0 5],'w.'); hold on;
plot([2 2],[1 4],'k',[3 3],[1 4],'k',[1 4],[2 2],'k',[1 4],[3 3],'k','LineWidth',3)
ax = gca; ax.XColor = 'none'; ax.YColor = 'none'; axis image;

if levels(1) == 0
    X_move = @TTT_player_move_Key;
else
    X_move = str2func(['TTT_ai_move_',num2str(levels(1)),'_Key']);
    X_pause = 1;
end
if levels(2) == 0
    O_move = @TTT_player_move_Key;
else
    O_move = str2func(['TTT_ai_move_',num2str(levels(2)),'_Key']);
    O_pause = 1;
end
% ------ Game loop
while winner == 0 && moves < 9
    if player == 1
        space = X_move(game_state,player);
    else
        space = O_move(game_state,player);
    end
    game_state(space) = player;
    TTT_add_move_Key(space,player);
    pause(0.1);
    moves = moves+1;
    winner = TTT_winner_check_Key(game_state);
    player = -player;
end
if winner == 0
    title('Tie Game','FontSize',24);
elseif winner == 1
    title('Player X wins!','FontSize',24);
else
    title('Player O wins!','FontSize',24);
end

%% HELPER FUNCTIONS
function move_to = TTT_ai_move_1_Key(game_state,~)
    open_spaces = TTT_get_open_spaces_Key(game_state);
    num_open_spaces = length(open_spaces);
    randomIndex = randi(num_open_spaces);
    move_to = open_spaces(randomIndex);
end
function move_to = TTT_ai_move_2_Key(game_state,player)
    % check for winning moves
    player_status = TTT_detect_winning_move_Key(game_state);
    if player == 1 && player_status(1) ~= 0   
        move_to = player_status(1);             % X takes winning move
    elseif player == 1 && player_status(2) ~= 0 % X blocks winning move
        move_to = player_status(2);
    elseif player == -1 && player_status(2) ~= 0   
        move_to = player_status(2);              % O takes winning move
    elseif player == -1 && player_status(1) ~= 0 % O blocks winning move
        move_to = player_status(1);
    else
        move_to = TTT_ai_move_1_Key(game_state);
    end 
end
function move_to = TTT_ai_move_3_Key(tttBoard,player)
    openSpaces = find(tttBoard(:)==0);
    spacesLeft = length(openSpaces);
    firstplayer = player;
    if tttBoard(5) == 0 % Take center space
        move_to = 5;
        return
    elseif spacesLeft == 8 && tttBoard(5) == 1
        move_to = 9;       % Take corner space if center is taken
        return
    end
    move_to = openSpaces(1); % default move
    for i=1:spacesLeft
        scoreMove = TTT_MoveScore(tttBoard,player,9-spacesLeft,openSpaces(i),firstplayer);   
        if scoreMove == 1  % Good move, take it
            move_to = openSpaces(i);
            return;
        elseif scoreMove == 0 % Neutral move, keep looking for better
            move_to = openSpaces(i);
        end
    end
end
% Unbeatable TicTacToe AI 
function score = TTT_MoveScore(tttBoard,player,round,thisMove,firstplayer)
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
                nextMove = openSpaces(i);
                score = TTT_MoveScore(tttBoard,-player,round+1,nextMove,firstplayer);
                scores(i) = score;
                tttBoard(nextMove) = 0;
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
    click = floor(ginput(1));
    click = min([click;3 3]);
    click = max([click;1 1]);
    move = coord2idx(click(1),click(2));
    while game_state(move) ~= 0
        title('Not a valid space.','FontSize',24);
        click = floor(ginput(1));
        click = min([click;3 3]);
        click = max([click;1 1]);
        move = coord2idx(click(1),click(2));
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