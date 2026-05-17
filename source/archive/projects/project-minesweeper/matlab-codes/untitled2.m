N = 15;
D = 'easy';


fig = figure('Position',[1,1,N,N+2]*52);
    
ax = gca;
axis([1 N+1 1 N+1])
ax.XColor = 'none'; ax.YColor = 'none'; 
axis square;
grid on
xticks(1:N); yticks(1:N)
set(fig, 'ToolBar', 'none')
set(fig, 'MenuBar', 'none')
title(['Jerksweeper (' D ')'], 'FontSize', 18)
