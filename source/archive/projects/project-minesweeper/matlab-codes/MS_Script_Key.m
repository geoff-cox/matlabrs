%--------------------------------------------------------------------------
%------------------------ Minesweeper Game Script -------------------------
close all;

% ---- Ask player for grid size and number of mines
N = input('\nSelect the size of the N x N grid: N = ');
M = input('\nSelect the number of mines: M = ');

% ---- Initialize game matrices: mine_field, revealed, flagged 
mine_field = zeros(N);
mine_field(randperm(numel(mine_field),M)) = -1;
board = MS_create_field_Key(mine_field);
rectangles = MS_display_interface_Key(N);
revealed = zeros(size(board));
flagged = zeros(size(board));

% ---- Game Loop
game_over = 0;
while game_over == 0
    mouse_click = ginput(1);
    sw_corner = floor(mouse_click);
    m_row = N-sw_corner(2)+1;
    m_col = sw_corner(1);
    if norm(mouse_click-[N/2+1,N/2+1],inf) <= N/2
        if round(mouse_click) == sw_corner
            if flagged(m_row,m_col) == 1
                flagged(m_row,m_col) = 0;
                rectangles(m_row,m_col) = rectangle('Position',[m_col N-m_row+1 1 1],'FaceColor',[0.3 0.7 0.4]);
            elseif revealed(m_row,m_col) == 0
                flagged(m_row,m_col) = 1;
                text(sw_corner(1)+0.2,sw_corner(2)+0.55,char(9873),'FontSize',27);
            end
        elseif flagged(m_row,m_col) == 0
            if board(m_row,m_col) == -1
                rectangles(m_row,m_col).FaceColor = [1 1 1];
                text(sw_corner(1)+0.025,sw_corner(2)+0.55,char(9760),'FontSize',27);
                game_over = 1;
                title('You Lose!','FontSize',24)
            elseif board(m_row,m_col) == 0
                spaces = MS_to_reveal_blank_click_Key(m_row,m_col,board,revealed);
                for k = 1:size(spaces,1)
                    if board(spaces(k,1), spaces(k,2)) ~= 0
                        text(spaces(k,2)+0.25,N-spaces(k,1)+1.55,num2str(board(spaces(k,1), spaces(k,2))),'FontSize',27)
                    end
                    revealed(spaces(k,1), spaces(k,2)) = 1;
                    rectangles(spaces(k,1), spaces(k,2)).FaceColor = [1 1 1];
                end
            else
                rectangles(m_row,m_col).FaceColor = [1 1 1];
                text(sw_corner(1)+0.25,sw_corner(2)+0.55,num2str(board(m_row,m_col)),'FontSize',27)
                revealed(m_row,m_col) = 1;
            end
        end
    end
    if prod((revealed == (board ~= -1)) .* (flagged == (board == -1)),'all')
        game_over = 1;
        title('You Win!','FontSize',24)
    end
end

%--------------------------------------------------------------------------
%---------------------- Minesweeper helper functions ----------------------

function play_field = MS_create_field_Key(mines)
    N = length(mines);
    mines_buffer = zeros(N+2);
    mines_buffer(2:end-1,2:end-1) = mines;
    for r = 2:N+1
        for c = 2:N+1
            if mines_buffer(r,c) ~= -1
                sub_field = mines_buffer(r-1:r+1,c-1:c+1);
                for k = 1:9
                    if sub_field(k) == -1
                        mines_buffer(r,c) = mines_buffer(r,c) + 1;
                    end
                end
            end
        end
    end
    play_field = mines_buffer(2:end-1,2:end-1);
end

function adj_spaces = MS_adj_unrevealed_safe_spaces_Key(row,col,field,revealed)
    N = size(field,1);
    buffed_field = -1*ones(N+2);
    buffed_field(2:end-1,2:end-1) = field;
    adj_spaces = zeros(8,2);
    space_count = 1;
    for r = row-1:row+1
        for c = col-1:col+1
            if buffed_field(r+1,c+1) ~= -1 && revealed(r,c) == 0
                adj_spaces(space_count,:) = [r,c];
                space_count = space_count + 1;
            end
        end
    end
    adj_spaces(space_count:end,:) = [];
end

function to_reveal = MS_to_reveal_blank_click_Key(row,col,field,revealed)
    explore = [row,col];
    explored = revealed;
    explored(row,col) = 1;
    to_reveal = zeros(numel(revealed),2);
    k = 1;
    while size(explore,1) > 0
        to_reveal(k,:) = explore(1,:);
        row = explore(1,1);
        col = explore(1,2);
        if field(row,col) == 0
            adj_spaces = MS_adj_unrevealed_safe_spaces_Key(row,col,field,explored);
            for m = 1:size(adj_spaces)
                explored(adj_spaces(m,1),adj_spaces(m,2)) = 1;
            end
            explore = [explore;adj_spaces];
        end
        explore(1,:) = [];
        k = k + 1;
    end
    to_reveal(k:end,:) = [];
end

function rects = MS_display_interface_Key(N)
    fig = figure('Position',[10,10,N*50+100,N*50+100]);
    ax = gca;
    axis([0 N+2 0 N+2])
    ax.XColor = 'none'; ax.YColor = 'none'; axis equal;
    set(fig, 'ToolBar', 'none')
    set(fig, 'MenuBar', 'none')
    for i = 1:N
        for j = 1:N
            rects(j,i) = rectangle('Position',[i N-j+1 1 1],'FaceColor',[0.3 0.7 0.4]);
        end
    end
end