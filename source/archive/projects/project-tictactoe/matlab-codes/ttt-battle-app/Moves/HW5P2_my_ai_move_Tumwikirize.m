% Author: Jonathan Tumwikirize 
% Date: 15th November 2023
% HR: none
% 
% Description: This program returns an AI move to an available space in Tic
% Tac Toe based on my own strategy: 
% 
%   - Priority 1: Snatch any winning move 
%   - Priority 2: Select the center to block opposing possible moves but 
%     to also gain advantage of having the most possibilities to win. 
%   - Priority 3: Snatch any corners for better advantage too. 
%
function my_move = HW5P2_my_ai_move_Tumwikirize(state)

%---------------------Snatch winning move-------------------------
temp_data = state.data;
% Modified to return all array of all available quadrants.
selection = HW4P9_dumb_ai_move_Tumwikirize(state);

for k = 1:length(selection)
[x, y] = HW4P6_index_2_click_Tumwikirize(selection(k));
temp_data(x,y) = 1;
% Prioritize winnning 
    if HW4P8_winner_check_Tumwikirize(temp_data) == -1
        my_move = selection(k);
        return
    end 
% Then look if opposition winning 
    if HW4P8_winner_check_Tumwikirize(temp_data)
        my_move = selection(k);
        return
    end
temp_data(x,y) = 0;
end

%-----------Snatch center quadrant if available------
for i = 1:length(selection)
    if selection(i) == 5
        my_move = 5;
        return
    end
end

%-------------Snatch corner quadrants----------------
for i = 1:length(selection)
    switch selection(i)
        case 1
            my_move = 1;
            return
        case 3
            my_move = 3;
            return
        case 7
            my_move = 7;
            return
        case 9 
            my_move = 9;
            return
        otherwise 
            my_move = selection(randi(length(selection)));
    end
end


%% Dumb AI Function 
function quadrants = HW4P9_dumb_ai_move_Tumwikirize(state)
%
[rows, cols] = size(state.data);
avl_qdrt = [];
vec = [];

mtx = [1 4 7;
       2 5 8;
       3 6 9];

for i = 1:rows
    for k = 1:cols
        if state.data(i, k) == 0
        avl_qdrt = [avl_qdrt; i k];
        end
    end
end

for i = 1:size(avl_qdrt)
    vec(i) = mtx(avl_qdrt(i, 1) , avl_qdrt(i, 2));
end

if ~isempty(vec)
    quadrants = vec;
else
    quadrants = [];
end


%% Index to Click Function
function [x,y] = HW4P6_index_2_click_Tumwikirize(abs_index)
% 
coordinate_matrix = [1 1;
                     2 1;
                     3 1;
                     1 2;
                     2 2;
                     3 2;
                     1 3;
                     2 3;
                     3 3];

temp = coordinate_matrix(abs_index,:);

x = temp(1);
y = temp(2);


%% Winner Check Function
function result = HW4P8_winner_check_Tumwikirize(data)
%
sum_list = HW3P10_row_col_diag_sums_Tumwikirize(data);
%
for i = 1:length(sum_list)
    if sum_list(i) == -3
        result = -1;
        break;
    elseif sum_list(i) == 3
        result = 1;
        break;
    else 
        result = 0;
    end
end


%% Sum rows etc Function
function sum_list = HW3P10_row_col_diag_sums_Tumwikirize(A)
%
% Initialize Values
[rows, cols] = size(A);
sum_list = [];

% Sum of Rows
for i = 1:rows 
    sum_list = [sum_list sum(A(i,:))];
end

% Sum of columns 
for i = 1:cols
    sum_list = [sum_list sum(A(:,i))];
end

% Diagnols
if rows < cols
    temp_sum_diag = 0;
    for i = 1:rows
       temp_sum_diag = temp_sum_diag + A(i,i);
    end
 
else 
    temp_sum_diag = 0;
    for i = 1:cols
       temp_sum_diag = temp_sum_diag + A(i,i);
    end
end
sum_list = [sum_list temp_sum_diag];

    
% Anti-Diagnol 
temp_sum_adiag = 0;
temp_sol = rows + 1;
for i = 1:rows
    for k = 1:cols
        if (i + k)  == temp_sol
            temp_sum_adiag = temp_sum_adiag + A(i,k);
        end
    end
end
sum_list = [sum_list temp_sum_adiag];
