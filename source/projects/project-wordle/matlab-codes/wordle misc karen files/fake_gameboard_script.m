%fake gameboard for testing
fig = figure('Position',[100,100,600,600]);
plot([-2 22],[-2 34],'w.')
xticks(-2:2:22)
yticks(-2:2:34)
axis equal
grid on;
hold on;
for i = 8:4:32
    plot([0 20],[i i],'k')
end
for i = 0:4:20
    plot([i i],[8 32],'k')
end
plot([0 20],[6 6],'k')
plot([20 20],[4 6],'k')
plot([19 20],[4 4],'k')
plot([19 19],[2 4],'k')
plot([17 19],[2 2],'k')
plot([17 17],[0 2],'k')
plot([3 17],[0 0],'k')
plot([3 3],[0 2],'k')
plot([1 3],[2 2],'k')
plot([1 1],[2 4],'k')
plot([0 1],[4 4],'k')
plot([0 0],[4 6],'k')

axis([-2 22 -2 34])
    