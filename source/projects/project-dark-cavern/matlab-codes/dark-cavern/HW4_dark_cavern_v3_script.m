% Dark Cavern Game version 3

HW4_dark_cavern_v3

function maze = generate_maze(m, n)
    % Ensure m and n are odd to simplify path carving
    if mod(m, 2) == 0, m = m + 1; end
    if mod(n, 2) == 0, n = n + 1; end

    % Initialize maze with all walls (1)
    maze = ones(m, n);

    % Set player start position as a path (0)
    playerStart = [2, 2];
    maze(playerStart(1), playerStart(2)) = 0;

    % Initialize a stack with the starting point
    stack = playerStart;

    % Direction vectors for up, down, left, right
    directions = [-2 0; 2 0; 0 -2; 0 2];

    % Recursive carving loop
    while ~isempty(stack)
        % Get current cell from the top of the stack
        [currentRow, currentCol] = deal(stack(end, 1), stack(end, 2));
        stack(end, :) = []; % Pop the top of the stack

        % Randomly shuffle the directions to ensure random carving
        directions = directions(randperm(4), :);

        % Try each direction
        for i = 1:4
            % Compute new position based on the direction
            newRow = currentRow + directions(i, 1);
            newCol = currentCol + directions(i, 2);

            % Check if the new position is within bounds and is a wall
            if newRow > 1 && newRow < m && newCol > 1 && newCol < n && maze(newRow, newCol) == 1
                % Check if the position has at least 3 adjacent walls
                if sum(maze(newRow-1:newRow+1, newCol-1:newCol+1), 'all') >= 7
                    % Set the wall between current position and new position to path
                    maze((currentRow + newRow) / 2, (currentCol + newCol) / 2) = 0;
                    % Set the new position as path
                    maze(newRow, newCol) = 0;
                    % Push the new position onto the stack
                    stack = [stack; newRow, newCol];
                end
            end
        end
    end
end

function [ch, tim] = getkey(N, nonascii)
    % GETKEY - get a keypress
    %   CH = GETKEY waits for a single keypress and returns the ASCII code. It
    %   accepts all ascii characters, including backspace (8), space (32),
    %   enter (13), etc, that can be typed on the keyboard.
    %   Non-ascii keys (ctrl, alt, ..) return a NaN. CH is a double.
    %
    %   CH = GETKEY(N) waits for N keypresses and returns their ASCII codes.
    %   GETKEY(1) is the same as GETKEY without arguments.
    %
    %   GETKEY('non-ascii') or GETKEY(N, 'non-ascii') uses non-documented
    %   matlab features to return a string describing the key pressed.
    %   In this way, keys like ctrl, alt, tab etc. can also distinguished.
    %   The return is a string (when N = 1) or a cell array of strings.
    %
    %   [CH, T] = GETKEY(...) also returns the time between the start of the
    %   function and each keypress. This is, however, not very accurate.
    %
    %   This function is kind of a workaround for "getch" in C. It uses a modal,
    %   but non-visible window, which does show up in the taskbar.
    %   C-language keywords: KBHIT, KEYPRESS, GETKEY, GETCH
    %  
    %   Example 1 - get a single ascii key
    %      fprintf('\nPress any key: ') ;
    %      ch = getkey ;
    %      fprintf('%c\n',ch) ;
    %
    %   Example 2 - wait for a specific key
    %      fprintf('\nPress the Ctrl-key within 3 presses: ') ;
    %      ch = getkey(3,'non-ascii')
    %      if ismember('control', ch), fprintf('OK\n') ;
    %      else fprintf(' ... wrong keys ...\n') ; end
    %    
    %   Example 3 - Typing game
    %       S = 'abcdefghjiklm' ; 
    %       fprintf('Type "%s" as fast as possible ...\n', S) ;
    %       [C, T] = getkey(numel(S)) ;
    %       C = char(C) ; T = T(end)-T(1) ;
    %       if ~isequal(S, C), fprintf('OOPS!!! ') ; end
    %       fprintf('You typed "%s" in %.2f seconds.\n', C, T) ;
    %
    %  See also INPUT, UIWAIT
    %           GETKEYWAIT (File Exchange)
    % for Matlab 6.5 and higher
    % version 2.1 (feb 2019)
    % author : Jos van der Geest
    % email  : samelinoa@gmail.com
    %
    % History
    % 1.0 2005 - creation
    % 1.1 dec 2006 - modified lay-out and help
    % 1.2 apr 2009 - tested for more recent MatLab releases
    % 1.3 jan 2012 - modified a few properties, included check is figure still
    %            exists (after comment on FEX by Andrew).
    % 2.0 jun 2012 - added functionality to accept multiple key presses
    % 2.1 feb 2019 - mondernised, added timing example
    t00 = tic ; % start time of this function
    % check the input arguments
    narginchk(0,2)
    switch nargin
        case 0
            nonascii = '' ;
            N = 1 ;
        case 1
            if ischar(N)
                nonascii = N ;
                N = 1 ;
            else
                nonascii = '' ;
            end
    end
    if numel(N) ~= 1 || ~isnumeric(N) || N < 1 || fix(N) ~= N
        error('N should be a positive integer scalar.') ;
    end
    % Determine the callback string to use
    if strcmpi(nonascii,'non-ascii')
        % non-ascii characters are accepted
        nonascii = true ;
        callstr = 'set(gcbf, ''Userdata'', get(gcbf, ''Currentkey'')) ; uiresume ' ;
    elseif isempty(nonascii)
        nonascii = false ;
        % only standard ascii characters are accepted
        callstr = 'set(gcbf, ''Userdata'', double(get(gcbf, ''Currentcharacter''))) ; uiresume ' ;
    else
        error('String argument should be the string ''non-ascii''') ;
    end
    % Set up the figure
    % May be the position property  should be individually tweaked to avoid visibility
    fh = figure(...
        'name', 'Press a key', ...
        'keypressfcn', callstr, ...
        'windowstyle', 'modal', ...
        'numbertitle', 'off', ...
        'position', [0 0 1 1], ... % really small in the corner
        'userdata', 'timeout') ;
    try
        ch = cell(1,N) ;
        tim = zeros(1,N) ;
        
        % loop to get N keypresses
        for k=1:N
            % Wait for something to happen, usually a key press so uiresume is
            % executed
            uiwait ;
            tim(k) = toc(t00) ; % get the time of the key press
            ch{k} = get(fh,'Userdata') ;  % and the key itself
            if isempty(ch{k})
                if nonascii
                    ch{k} = NaN ;
                else
                    ch{k} = '' ;
                end
            end
        end
        if ~nonascii
            ch = [ch{:}] ;
        else
            if N==1
                ch = ch{1} ; % return as a string
            end
            % return as a cell array of strings
        end
     catch
        % Something went wrong, return empty matrices.
        ch = [] ;
        tim = [] ;
    end
    % clean up the figure, if it still exists
    if ishandle(fh)
        delete(fh) ;
    end
end

function [maze, player] = HW4_initialize_game_v3(height, width)
    
    reserved_spaces = [2 2];
    
    % Maze Structure
    maze.walls = generate_maze(height, width);
    maze.h = height;
    maze.w = width;
    maze.icons.wall = '▓';
    maze.icons.exit = '⛝';
    maze.icons.open = '⛆';
    maze.icons.player = '⛄';
    maze.icons.key = '⚿';
    maze.icons.torch = '✨';
    maze.icons.dark = '█';  % █
    
    maze.exit = HW4_select_random_location(maze, reserved_spaces);
    reserved_spaces = [reserved_spaces; maze.exit];
    maze.key = HW4_select_random_location(maze, reserved_spaces);
    reserved_spaces = [reserved_spaces; maze.key];
    maze.torch = HW4_select_random_location(maze, reserved_spaces);

    % Player structure
    player.position = [2, 2];
    player.moves = 0;
    player.direction = 's';
    player.has_key = false;
    player.has_torch = false;
    player = HW4_line_of_sight_v3(maze, player);
    
end

function location = HW4_select_random_location(maze, object_locations)
    
    reserved = maze.walls;
    for r = 1:height(object_locations)
        reserved(object_locations(r,1), object_locations(r,2)) = true;
    end

    location = [randi([1 height(reserved)]) randi([1 width(reserved)])];
    
    while reserved(location(1), location(2))
        location = [randi([1 height(reserved)]) randi([1 width(reserved)])];
    end

end

function HW4_display_maze_v3(maze,player)

    clc

    p_r = player.position(1);
    p_c = player.position(2);
    sight = player.sight;
    
    [rows, cols] = size(maze.walls);
    for i = 1:rows
        for j = 1:cols
            if sight(i,j)
                if i == p_r && j == p_c
                    fprintf(maze.icons.player);
                elseif maze.walls(i,j) == 1
                    fprintf(maze.icons.wall);
                elseif maze.exit(1) == i && maze.exit(2) == j
                    fprintf(maze.icons.exit);
                elseif maze.key(1) == i && maze.key(2) == j && ~player.has_key
                    fprintf(maze.icons.key);
                elseif maze.torch(1) == i && maze.torch(2) == j && ...
                        ~player.has_key && ~player.has_torch
                    fprintf(maze.icons.torch);
                else
                    fprintf(maze.icons.open);
                end
            else
                fprintf(maze.icons.dark);
            end
        end
        fprintf('\n');
    end
end

function player = HW4_move_player_v3(maze, player, direction)

    % Get the current position
    x = player.position(1);
    y = player.position(2);

    % Determine new position based on direction
    if direction == 'w'
        x = x - 1;
    elseif direction == 's'
        x = x + 1;
    elseif direction == 'a'
        y = y - 1;
    elseif direction == 'd'
        y = y + 1;
    end
    player.direction = direction;
    
    % Apply move only if the new location is not a wall
    if maze.walls(x,y) == 0

        % Update player state
        player.position = [x y];
        player.moves = player.moves + 1;
        if x == maze.key(1) && y == maze.key(2)
            player.has_key = true;
        end
        if x == maze.torch(1) && y == maze.torch(2)
            player.has_torch = true;
        end
        %new_sight = HW4_get_line_of_sight_v3(maze, player);
        player = HW4_line_of_sight_v3(maze, player);
        
    end

end

function player = HW4_line_of_sight_v3(maze, player)

    line_of_sight = false(maze.h, maze.w);
    p = player;

    % Get the start row and column
    p_r = p.position(1);
    p_c = p.position(2);
    
    % Add current position to line of sight
    line_of_sight(p_r,p_c) = true;

    % Set r and c and look left
    r = p_r;
    c = p_c;
    while maze.walls(r, c) == 0
        c = c - 1;
        line_of_sight(r-1:r+1,c) = true;
        if ~p.has_torch && abs(p_c - c) >= 1
            break
        end
    end

    % Reset c and look right
    c = p_c;
    while maze.walls(r, c) == 0
        c = c + 1;
        line_of_sight(r-1:r+1,c) = true;
        if ~p.has_torch && abs(p_c - c) >= 1
            break
        end
    end

    % Reset c and look up
    c = p_c;
    while maze.walls(r, c) == 0
        r = r - 1;
        line_of_sight(r,c-1:c+1) = true;
        if ~p.has_torch && abs(p_r - r) >= 1
            break
        end
    end

    % Reset r and look down
    r = p_r;
    while maze.walls(r, c) == 0
        r = r + 1;
        line_of_sight(r,c-1:c+1) = true;
        if ~p.has_torch && abs(p_r - r) >= 1
            break
        end
    end

    player.sight = line_of_sight;

end

function HW4_dark_cavern_v3()

    % Initialize the game
    [maze, player] = HW4_initialize_game_v3(11,13);
    
    tic

    message = '';
    
    % Game loops
    while true
    
        HW4_display_maze_v3(maze, player)
    
        fprintf('\n')
        fprintf('Elapsed time: %g seconds\n', round(toc,2))
        fprintf('Number of Moves: %i\n', player.moves)
        fprintf('Inventory:\n')
        if player.has_key
            fprintf(' > Key\n');
        end
        if player.has_torch
            fprintf(' > Torch\n');
        end
        fprintf('%s\n', message)
        message = '';
        
        % Get player's move
        fprintf('Enter move (up/down/left/right): ') ;
        direction = lower(char(getkey));
    
        % Exit game
        if direction == 'x'
            clc;
            return
        end

        % Move the player
        player = HW4_move_player_v3(maze, player, direction);
    
        % If the player has the key and reached the goal, end game loop
        if isequal(player.position, maze.exit) 
            if player.has_key
                break
            else
                message = 'You need the Key!';
            end
        end
    
    end
    
    HW4_display_maze_v3(maze, player)
    fprintf( [...
        '\nCongratulations! You made it out!\n\n' ...
        'Elapsed time: %g seconds\n' ...
        'Number of Moves: %i\n' ...
        ], round(toc,2), player.moves);

end