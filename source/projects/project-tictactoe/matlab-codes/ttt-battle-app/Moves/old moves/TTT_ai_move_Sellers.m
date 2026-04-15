% =========================================================================
% This program returns an AI move to an available space in a Tic-Tac-Toe
% game based on the set of priorities:
%
% INPUT:
%   game_state (3 x 3) the current game state matrix
%   player (1 x 1) the current player ( 1 = X, -1 = O )
% OUTPUT:
%   move_to (1 x 1) absolute index of an available space on the gameboard.  
% =========================================================================
function move_to = TTT_ai_move_3_Sellers(game_state,player)
    player_status = TTT_detect_winning_move_Sellers(game_state);
    last_resort = TTT_detect_lastResort_Sellers(game_state);
    
    if player == 1
        if player_status(2) ~= 0
            move_to = player_status(2);
        elseif player_status(1) ~= 0
            move_to = player_status(1);
        elseif last_resort(2) ~= 0
            move_to = last_resort(2);
        elseif last_resort(1) ~= 0
            move_to = last_resort(1);
        elseif last_resort(4) ~= 0
            move_to = last_resort(4);
        elseif last_resort(3) ~= 0
            move_to = last_resort(3);
        else
            move_to = TTT44_ai_move_1_Sellers(game_state);
        end
    elseif player == -1
        if player_status(1) ~= 0
            move_to = player_status(1);
        elseif player_status(2) ~= 0
            move_to = player_status(2);
        elseif last_resort(1) ~= 0
            move_to = last_resort(1);
        elseif last_resort(2) ~= 0
            move_to = last_resort(2);
        elseif last_resort(3) ~= 0
            move_to = last_resort(3);
        elseif last_resort(4) ~= 0
            move_to = last_resort(4);
        else
            move_to = TTT44_ai_move_1_Sellers(game_state);
        end
    end
  
end

%
function player_status = TTT_detect_winning_move_Sellers(game_state)
  player_status = zeros(1,2);
  sums = P32_matrix_sums_Sellers(game_state);
  o = [0 0 0];
  x = [0 0 0];
  doneo = 0;
  donex = 0;
  
  for i = 1:8
      if sums(i) == 2 && donex == 0
          donex = 1;
          if i == 1 || i == 2 || i == 3 %ISROW
              if i == 1 
                  x = [1 4 7];
              elseif i == 2
                  x = [2 5 8];
              elseif i == 3
                  x = [3 6 9];
              end
          elseif i == 4 || i ==5 || i == 6 %ISCOLUMN
               if i == 4
                  x = [1 2 3];
               elseif i == 5
                  x = [4 5 6];
               elseif i == 6
                  x = [7 8 9];
               end
          elseif i == 7 || i == 8 %ISDIAG
                if i == 7       %DIAG
                  x = [1 5 9];
                elseif i == 8   %ANTIDIAG
                  x = [3 5 7];
                end
          end
      elseif sums(i) == -2 && doneo == 0
          doneo =1;
          if i == 1 || i == 2 || i == 3 %ISROW
              if i == 1
                  o = [1 4 7];
              elseif i == 2
                  o = [2 5 8];
              elseif i == 3
                  o = [3 6 9];
              end
          elseif i == 4 || i == 5 || i == 6 %ISCOLUMN
               if i == 4
                  o = [1 2 3];
               elseif i == 5
                  o = [4 5 6];
               elseif i == 6
                  o = [7 8 9];
               end
          elseif i == 7 || i == 8 %ISDIAG
               if i == 7         %DIAG
                  o = [1 5 9];
               elseif i == 8     %ANTIDIAG
                  o = [3 5 7];
               end
              
          end

      end
  end
  
   doneo = 0;
  donex = 0;
  
  for i = 1:3
      if o(i) ~= 0 && doneo == 0
          if game_state(o(i)) == 0
          player_status(2) = o(i);
          end
      end
      if x(i) ~= 0 && donex == 0
          if game_state(x(i)) == 0
          player_status(1) = x(i);
          end
      end
  end
  
end

function last_resort = TTT_detect_lastResort_Sellers(game_state)
 last_resort = zeros(1,4);
  sums = P32_matrix_sums_Sellers(game_state);
  o = [0 0 0];
  x = [0 0 0];
  doneo = 0;
  donex = 0;
  
  for i = 1:8
      if sums(i) == 1 && donex == 0
          donex = 1;
          if i == 1 || i == 2 || i == 3 %ISROW
              if i == 1 
                  x = [1 4 7];
              elseif i == 2
                  x = [2 5 8];
              elseif i == 3
                  x = [3 6 9];
              end
          elseif i == 4 || i ==5 || i == 6 %ISCOLUMN
               if i == 4
                  x = [1 2 3];
               elseif i == 5
                  x = [4 5 6];
               elseif i == 6
                  x = [7 8 9];
               end
          elseif i == 7 || i == 8 %ISDIAG
                if i == 7       %DIAG
                  x = [1 5 9];
                elseif i == 8   %ANTIDIAG
                  x = [3 5 7];
                end
          end
      elseif sums(i) == -1 && doneo == 0
          doneo =1;
          if i == 1 || i == 2 || i == 3 %ISROW
              if i == 1
                  o = [1 4 7];
              elseif i == 2
                  o = [2 5 8];
              elseif i == 3
                  o = [3 6 9];
              end
          elseif i == 4 || i == 5 || i == 6 %ISCOLUMN
               if i == 4
                  o = [1 2 3];
               elseif i == 5
                  o = [4 5 6];
               elseif i == 6
                  o = [7 8 9];
               end
          elseif i == 7 || i == 8 %ISDIAG
               if i == 7         %DIAG
                  o = [1 5 9];
               elseif i == 8     %ANTIDIAG
                  o = [3 5 7];
               end
              
          end

      end
  end
  
   doneo = 0;
  donex = 0;
  
  for i = 1:3
      if o(i) ~= 0 && doneo == 0
          if game_state(o(i)) == 0
          last_resort(2) = o(i);
          end
      elseif o(i) ~= 0
          if game_state(o(i)) ==  0
              last_resort(4) = o(i);
          end
      end
      if x(i) ~= 0 && donex == 0
          if game_state(x(i)) == 0
          last_resort(1) = x(i);
          end
      elseif x(i) ~= 0
          if game_state(o(i)) == 0
              last_resort(3) = o(i);
          end
      end
  end

end
function diag_sums = P31_diagonal_sums_Sellers(A)


x_max = width(A);
y_max = height(A);

diag_sums = [0; 0];

for i = 1:y_max
if  i <= x_max
    diag_sums(1) = diag_sums(1) + A(i, i);
    k = i-1;
    diag_sums(2) = diag_sums(2) + A(y_max - k, i);
end
end

end
function matrix_sums = P32_matrix_sums_Sellers(A)
B = P31_diagonal_sums_Sellers(A);
m = height(A);
n = width(A);
Y = m + n + 2;
C = B(1);
D = B(2);

matrix_sums = zeros(Y,1);

for i = 1:m 
    matrix_sums(i) = sum(A(i, 1:end));
end

for i = 1:n
    matrix_sums(i+m)= sum(A(1:end, i));
end

matrix_sums(Y-1) = C;
matrix_sums(Y) = D;

end


%
% =========================================================================
% HR: NONE
%
% =========================================================================
