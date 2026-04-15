function selection = HW5P2_my_ai_move_green(state)

selection = 0;
%% Check for valid moves
space = state.empty_space;  % Too lazy to use struct name

%% Make a better move

% Possibility matrix
P = [1 4 7; 2 5 8; 3 6 9; 1 2 3; 4 5 6; 7 8 9; 1 5 9; 3 5 7];

% Row and column sums
n = 3;
for i = 1:3
    sums(i) = sum(state.data(i,:));     % Row sum top to bottom
end
for j = 1:3
    i = i+1;
    sums(i) = sum(state.data(:,j));     % Column sum left to right
end

a = 0;
for k = 1:n
    a = a + state.data(k,k);            % Diagonal sum
end
sums(7) = a;

b = 0;
for k = 1:n
    b = b + state.data(n-k+1,n);        % Anti-Diagonal sum
end
sums(8) = b;

%% Find possible valid combos

% Winning combos
j = 1;
vec_win = zeros(1,3);
a = 2*state.player;
for i = 1:length(sums)
    if sums(i) == a
        vec_win(j,:) = P(i,:);
        j = j + 1;
    end
end

% Blocking combos
j = 1;
vec_block = zeros(1,3);
b = -2*state.player;
for i = 1:length(sums)
    if sums(i) == b
        vec_block(j,:) = P(i,:);
        j = j + 1;
    end
end

%% My Selection Method

% Start of game
z = sum(space);
if z == 9
    selection = 5;
elseif z == 8
    if space(5) == 1
    selection = 5;
    else
        selection = 4;
    end

% Second move
elseif z == 7
    if space(1) == 0 || space(4) == 0
        selection = 9;
    elseif space(3) == 0 || space(2) == 0
        selection = 7;
    elseif space(7) == 0 || space(8) == 0
        selection = 3;
    elseif space(9) == 0 || space(6) == 0
        selection = 1;
    end

% Rest of game
% Win condition
elseif vec_win > 0
[n, m] = size(vec_win);
count = 1;

for i = 1:n
    for j = 1:m
        for k = 1:length(space)
            if space(k)*k == vec_win(i,j)
                selection(count)  = vec_win(i,j);
                count = count + 1;
            end
        end
    end
end

selection = min(selection);

% Block condition
elseif vec_block > 0
[n, m] = size(vec_block);
count = 1;

for i = 1:n
    for j = 1:m
        for k = 1:length(space)
            if space(k)*k == vec_block(i,j)
                selection(count)  = vec_block(i,j);
                count = count + 1;
            end
        end
    end
end

selection = min(selection);

% Pick an empty space
else
    while true
        c = randi(9,1);
    
        if space(c) ~= 0
            selection = c;
            break
        end
    end
end
