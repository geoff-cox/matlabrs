function HW4P2_display_initial_board

    figure('Position',[100, 100, 650, 600]);
    hold on
    plot([2 2], [1 4], 'k', 'LineWidth', 3);
    plot([3 3], [1 4], 'k', 'LineWidth', 3);
    plot([1 4], [2 2], 'k', 'LineWidth', 3);
    plot([1 4], [3 3], 'k', 'LineWidth', 3);
    axis([0.5 4.5 0.5 4.5]);
    grid on
    axis equal;
%     ax = gca;
%     ax.XColor = 'none';
%     ax.YColor = 'none';
end


