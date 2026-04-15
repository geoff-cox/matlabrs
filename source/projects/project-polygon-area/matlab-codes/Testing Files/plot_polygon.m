% =========================================================================
% Helper Function for debugging
function plot_polygon(v,axis_info)
    close all
    figure
    hold on
    plot([v.x],[v.y],'o-')
    fill([v.x],[v.y],'red','FaceAlpha',0.3)
    axis(axis_info);
    axis equal;
    grid on;
    exact_area = polyarea([v.x],[v.y]);
    title(['AREA = ' num2str(exact_area)]);
    hold off
end