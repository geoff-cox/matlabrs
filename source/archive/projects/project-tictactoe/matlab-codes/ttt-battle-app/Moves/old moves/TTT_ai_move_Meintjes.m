% =========================================================================
% This program returns an AI move to an available space in a Tic-Tac-Toe
% game based on the set of priorities:
%
%  	1: If a winning move is available, it takes it. 
%
%   2: If a winning move for the opposing player is available, it takes it
%   (thus, blocking that move).
%
%   3: It attempts to follow a pre determined strategy by assembling a
%   triangle in one of the corners.
%
% INPUT:
%   game_state (3 x 3) the current game state matrix
%   player (1 x 1) the current player ( 1 = X, -1 = O )
% OUTPUT:
%   move_to (1 x 1) absolute index of an available space on the gameboard.  
% =========================================================================

function move_to = TTT_ai_move_Meintjes(game_state,play)
    move_to = TTT_ai_move_2_Meintjes(game_state,play);
  h=TTT_detect_winning_move_Meintjes(game_state);
  if play==1
      ai=1;
      py=2;
  else
      ai=2;
      py=1;
  end
  c=1;
  if h(ai)~=0
      move_to=h(ai);
      c=10;
  end
  if h(py)~=0
      move_to=h(py);
      c=10;
  end
  os = TTT42_get_open_spaces_Meintjes(game_state);
  for t=1:numel(os)
  if os(t)==5
      move_to=5;
      c=10; %prevents next loop from starting
  end
  end
  while c<=numel(os)
      if mod(os(c),2) == 1
          move_to=os(c);
          c=10;
      end
      c=c+1;
  end
end

%
% If you called any programs from a previous HW assignment in this function,
% copy and paste them here.  Otherwise, delete this comment.
function player_status = TTT_detect_winning_move_Meintjes(game_state)
L=TTT42_get_open_spaces_Meintjes(game_state);
player_status=[0,0];
player=[1,-1];
k=1;
test_state=game_state;
while k<=2
p=player(k);
i=1;
f=1;
while f<=numel(L)
 test_state=game_state;
 test_state(L(i))=p;
 w=TTT41_winner_check_Meintjes(test_state); 
    if w==1
     player_status(1)=L(i);
     f=numel(L)+2;
    end
    if w==-1
     player_status(2)=L(i);
     f=numel(L)+2;
    end
 i=i+1;
 f=f+1;
end
k=k+1;
end
end
function locations = TTT42_get_open_spaces_Meintjes(game_state)
j=1;
locations=[];
    for i=1:numel(game_state)
        if game_state(i) == 0
            locations(j)=i;
            j=j+1;
        end
    end   
end
function winner = TTT41_winner_check_Meintjes(game_state)  
win_check=P32_matrix_sums_Meintjes(game_state);
tie_check = TTT42_get_open_spaces_Meintjes(game_state);
winner=3;
for i=1:numel(win_check)
    if win_check(i,1) == 3
        winner=1; % X
    end
    if win_check(i,1) == -3
        winner=-1; % O
    end
    if numel(tie_check)==0
        winner=0;
    end
end
end
function values = P32_matrix_sums_Meintjes(A)
L=size(A);
M=L(1); % # Rows
N=L(2);% # Columns 
values=zeros(M+N+2,1);
%ROWS
for i=1:M
    B=A(i,:);
    values(i,1)=sum(B); %
end
%COLUMNS
for i=1:N
    B=A(:,i);
    values(i+M,1)=sum(B);
end
%DIAGONALS
diag_sums=P31_diagonal_sums_Meintjes(A);
M=L(1);% M gets changed in diagonal sum f. Need to reset
values(M+N+1,1)=diag_sums(1,1);
values(M+N+2,1)=diag_sums(2,1);
end
function diag_sums = P31_diagonal_sums_Meintjes(A)
L=size(A);
M=L(1);
N=L(2);
m=1;
n=1;
diagonal=0;
adiagonal=0;
if M>N
    K=N;
else 
    K=M;
end
for i= 1:K
    diagonal=diagonal+A(m,n);    
    adiagonal=adiagonal+A(M,n);
    M=M-1;
    m=m+1;
    n=n+1;
end
diag_sums=[diagonal;adiagonal];
end

function move_to = TTT_ai_move_2_Meintjes(game_state,player)
  k=TTT_detect_winning_move_Meintjes(game_state);
  if player==1
      ai=1;
      p=2;
  else
      ai=2;
      p=1;
  end
  if k(ai)~=0
      move_to=k(ai);
  elseif k(p)~=0
      move_to=k(p);
  else
      move_to=TTT44_ai_move_1_Meintjes(game_state);
  end  
end

%
% If you called any programs from a previous HW assignment in this function,
% copy and paste them here.  Otherwise, delete this comment.
function move_to = TTT44_ai_move_1_Meintjes(game_state)
k=1;
locations=TTT42_get_open_spaces_Meintjes(game_state);
if numel(locations) == 0     
    k=2;
    move_to=[];
end
while k==1
move_to=locations(randi(numel(locations)));
k=2;
end
end
% =========================================================================
% HR: None
%
% =========================================================================
