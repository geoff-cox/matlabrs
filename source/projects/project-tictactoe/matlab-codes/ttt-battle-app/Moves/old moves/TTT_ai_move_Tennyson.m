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
function move_to = TTT_ai_move_Tennyson(game_state,player)
    player_status = TTT_detect_winning_move_Tennyson(game_state);
    corners=([1,3,7,9]);
   
    
    if player==1
       if player_status(1)~=0
           move_to=player_status(1);
       elseif player_status(2)~=0
           move_to=player_status(2);
       elseif game_state(5)==0
           move_to=5;
       elseif corners(1)==0
           move_to=corners(1);
       elseif corners(2)==0
           move_to=corners(1);
       elseif corners(3)==0
           move_to=corners(3);
       elseif corners(4)==0
           move_to=corners(4);
       else
           move_to = TTT44_ai_move_1_tennyson(game_state);
       end
    end
   
     %
    
     if player==-1
       if player_status(2)~=0
           move_to=player_status(2);
       elseif player_status(1)~=0
           move_to=player_status(1);
       elseif game_state(5)==0
           move_to=5;
       elseif corners(1)==0
           move_to=corners(1);
       elseif corners(2)==0
           move_to=corners(1);
       elseif corners(3)==0
           move_to=corners(3);
       elseif corners(4)==0
           move_to=corners(4);
       else
           move_to = TTT44_ai_move_1_tennyson(game_state);
       end
     end
end

%%
function move_to = TTT44_ai_move_1_tennyson(game_state)
    move_to=[];
    locations = TTT42_get_open_spaces_tennyson(game_state);
    n=numel(locations);
    if n~=0
    n=numel(locations);
    i=randi(n);
    move_to=locations(i);
    end
end
%
function locations = TTT42_get_open_spaces_tennyson(game_state);
    index=[1:9];
    locations=[];
    k=1;
    for i=1:9
        if game_state(i)==0
        locations(k)=index(i);
        k=k+1;
        end
    end
end
%
function winner = TTT41_winner_check_tennyson(game_state)
    game_state;
    winner=0;
    if game_state(1)==game_state(2) &&game_state(2)==game_state(3) && game_state(1)~=0
        winner=game_state(1);
        %left column
    elseif game_state(1,1)==game_state(1,2) &&game_state(1,2)==game_state(1,3) && game_state(1,1)~=0
        winner=game_state(1);
        %top row
    elseif game_state(2,1)==game_state(2,2) &&game_state(2,2)==game_state(2,3) && game_state(2,1)~=0
        winner=game_state(2,1);
        %mid row
    elseif game_state(3,1)==game_state(3,2) &&game_state(3,2)==game_state(3,3) && game_state(3,1)~=0
        winner=game_state(3,1);
        %bottom row
    elseif game_state(1,2)==game_state(2,2) && game_state(2,2)==game_state(3,2) &&game_state(1,2)~=0
        winner=game_state(1,2);
        %mid column
    elseif game_state(1,3)==game_state(2,3) && game_state(2,3)==game_state(3,3) &&game_state(1,3)~=0
        winner=game_state(1,3);
        %right column
    elseif game_state(1,1)==game_state(2,2) && game_state(2,2)==game_state(3,3) &&game_state(1,1)~=0
        winner=game_state(1,1);
        elseif game_state(1,3)==game_state(2,2) && game_state(2,2)==game_state(3,1) &&game_state(1,3)~=0
        winner=game_state(1,3);
    end
end
%
% =========================================================================
% HR: None
% Colby Tennyson
% =========================================================================
