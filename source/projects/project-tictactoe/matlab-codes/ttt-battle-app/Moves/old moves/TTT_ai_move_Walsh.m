

function move_to = TTT_ai_move_Walsh(game_state,player)
    
visual_state = TTT43_display_board_walsh(game_state);
%disp(visual_state)

    move_to=[];
    play=0;
    anti_play=0;
    done=0; %set equal to 1 when move has been made
    
    %assign player value
    if player == 1
        play=1;
        anti_play=2;
    elseif player == -1
        play=2;
        anti_play=1;
    end
    
    
    %main move
    win = TTT_detect_winning_move_walsh(game_state);
    if win(play) ~= 0 %priority 1 - Take winning move
        move_to=win(play);
        done=1;
        %disp('Take Winning Move')
    elseif win(anti_play) ~= 0 %priority 2 - Take opponent winning move
        move_to=win(anti_play);
        done=1;
        %disp('Block Winning Move')
    end
    
    %move to center if possible
    if game_state(5)==0 && done == 0
        move_to=5;
        done=1;
        %disp('Take center space')
    end
    
    
    %strategy:
    %find corner, idealy opposite from opponent
    
    odd=@(x)rem(x,2); %eq if corner space, x is absolue index
    
    %move to opposite corner of opponent, if available
    ct=0;
    optimal=0;
    while done == 0 && ct < 9
        ct=ct+1;
        if game_state(ct)==(player*-1) && odd(ct)==1 && ct ~= 5 %open corner space
            optimal = is_corner(ct);
            if game_state(optimal)~=0
                move_to=optimal;
                done=1;
                %disp('Take opposite corner')
            end
        end
    end
    
    %move to alternative free corner
    corner=0;
    corner = rand_corner(game_state);
    if done == 0 && corner ~= 0
        move_to=corner;
        done=1;
        %disp('Move to random corner')
    end
    
    %revert to AI program 1
    if done == 0
        move_to = TTT44_ai_move_1_walsh(game_state);
    end
    
end
% =========================================================================
% HR: None
% Daniel Walsh
% =========================================================================


% ------ Helper Functions ------ %

% helper function 1
function player_status = TTT_detect_winning_move_walsh(game_state)
    player_status=[0,0];
    
    %initiate variables
    x_state=game_state;
    o_state=game_state;
    winnerx=0;
    winnero=0;
    
    for n=1:9
        if game_state(n) == 0
            game_state(n)=1;
            winnerx = TTT41_winner_check_walsh(game_state);
            game_state(n)=-1;
            winnero = TTT41_winner_check_walsh(game_state);
            game_state(n)=0;
            
            if winnerx == 1 && player_status(1) == 0
                player_status(1)=n;
            end
            if winnero == -1  && player_status(2) == 0
                player_status(2)=n;
            end
        end
    end
end

% helper function 2
function winner = TTT41_winner_check_walsh(game_state)
    winner=0;
    rows=sum(game_state,2);
    cols=sum(game_state);
    diag=P31_diagonal_sums_walsh(game_state);
    
    %check rows
    for n = 1:3
        if rows(n) == -3
            winner = -1;
        elseif rows(n) == 3
            winner = 1;
        end
    end
    
    %check columns
    for n = 1:3
        if cols(n) == -3
            winner = -1;
        elseif cols(n) == 3
            winner = 1;
        end
    end
    
    %check diagonals
    if diag(1) == -3
        winner = -1;
    elseif diag(1) == 3
        winner = 1;
    elseif diag(2) == -3
        winner = -1;
    elseif diag(2) == 3
        winner = 1;
    end
    
end

% helper function 3
function diag_sums = P31_diagonal_sums_walsh(A)
    diag_sums=[0 ; 0];
    mat=size(A);
    t=mat(1);
    for n = 1:mat(2)  
        diag_sums(1) = diag_sums(1)+ A(n,n);
        diag_sums(2) = diag_sums(2)+ A(t,n);
        t=t-1;
    end
end

% helper function 4
function optimal = is_corner(move)
    optimal=0;
    %check if move is in a corner
    %return 0 if not in corner
    if move == 1
        optimal=9;
    elseif move == 3
        optimal=7;
    elseif move == 7
        optimal=3;
    elseif move == 9
        optimal=1;
    end
end

% helper function 5
function move_to = TTT44_ai_move_1_walsh(game_state)
    move_to=[];
    index=[];           %lists open spaces in 'game_state'
    k=1;
    for n=1:9
        if game_state(n) == 0
            index(k)=n;
            k=k+1;
        end
    end
    k=k-1;
    %make random move
    move_to=index(randi(k)); %selects random element of 'index'
    
    %no open spaces
    if numel(index) ~=0
        move_to=index(randi(numel(index)));
    end
end

% helper function 6
function visual_state = TTT43_display_board_walsh(game_state)
    visual_state = [' 1 | 4 | 7 ';...  % Sample game board. 
                    '-----------';...  % You can use this or change it.
                    ' 2 | 5 | 8 ';...
                    '-----------';...
                    ' 3 | 6 | 9 '];
    
    index=[6,8,10,26,28,30,46,48,50];        
    for n=1:9
        if game_state(n) == 1
            visual_state(index(n))='X';
        elseif game_state(n) == -1
            visual_state(index(n))='O';
        end  
    end
      
end

% helper function 7
function move_to = rand_corner(game_state)
    move_to=0;
    index=[];           %lists open spaces in 'game_state'
    k=1;
    odd=@(x)rem(x,2);
    for n=1:9
        if game_state(n) == 0 && odd(n) == 1
            index(k)=n;
            k=k+1;
        end
    end
    k=k-1;
    
    %make random move
    if numel(index) ~=0
        move_to=index(randi(numel(index)));
    end
end

