% =========================================================================
% This program detects if either player has an immediate winning move.
%
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   player_status (1 x 2) locations of winning moves for both players
% =========================================================================
function player_status = TTT_detect_winning_move_tennyson(game_state)
       player_status=[0,0];
    locations = TTT42_get_open_spaces_tennyson(game_state);
   % values = P32_matrix_sums_tennyson(game_state);
    check=0;
    %
    i=1;
    while i>=1 && i<=numel(locations) && check==0
        test_state=game_state;
        k=locations(i);
        test_state(k)=1;
        winner = TTT41_winner_check_tennyson(test_state);
        if winner==1
            player_status(1)=k;
            check=1;
        end
        i=i+1;
        
    end
    i=1;
    check=0;
    while i>=1 && i<=numel(locations) && check==0
        test_state=game_state;
        k=locations(i);
        test_state(k)=-1;
        winner = TTT41_winner_check_tennyson(test_state);
        if winner==-1
            player_status(2)=k;
            check=1;
        end
        i=i+1;
        
    end
end

%%
function values = P32_matrix_sums_tennyson(A)
col_sums=sum(A);
row_sums=sum(A');
diag_sums = P31_diagonal_sums_tennyson(A);
a=numel(col_sums);
b=numel(row_sums);
values(1:a)=col_sums;
values(a+1:a+b)=row_sums;
values(a+b+1:a+b+2)=diag_sums;
values=values';
end
%
function diag_sums = P31_diagonal_sums_tennyson(A)
diag_sums=[0;0];
S=size(A);

i=1;
while i<=S(1) && i<=S(2)
    a=i+1;
    diag_sums(1)=diag_sums(1)+A(i,i);
    a=S(1)+1-i;
    diag_sums(2)=diag_sums(2)+A(a,i);
    i=i+1;
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
% =========================================================================
% HR:None
% Colby Tennyson
% =========================================================================