function set_up_the_gameboard()
    close all
    %Set up the game board
    figure(1);
    hold on
    ax = gca;
    ax.XAxis.Visible = 'off';
    ax.YAxis.Visible = 'off';
    
    %Fill the top boxes with dark grey since to indicate the secret code
    %   is covered up:
        fill([0 4 4 0],[10 10 11 11],[0.5 0.5 0.5]);

    %Create the boxes
    for i = 0:11
        plot([0 4],[i i],'k','LineWidth',4)
    end
    for j = 0:4
        plot([j j],[0 11],'k','LineWidth',4)
    end
    title('Color Decoder','FontSize',16)
    text(-0.8,0.5,'1st guess')
    text(-0.8,1.5,'2nd guess')
    text(-0.8,2.5,'3rd guess')
    text(-0.8,3.5,'4th guess')
    text(-0.8,4.5,'5th guess')
    text(-0.8,5.5,'6th guess')
    text(-0.8,6.5,'7th guess')
    text(-0.8,7.5,'8th guess')
    text(-0.8,8.5,'9th guess')
    text(-0.8,9.5,'Final guess')
    text(-0.8,10.5,'Secret Code')
    axis([-1 8 0 12])
    set(gca,'color','#f0f0f0')
    
    %Color Choice boxes
    text(6,8.5,'Color Choices','FontSize',14)
    fill([6 7 7 6],[7 7 8 8],'b')
    fill([6 7 7 6],[5.5 5.5 6.5 6.5],'r')
    fill([6 7 7 6],[4 4 5 5],'g')
    fill([6 7 7 6],[2.5 2.5 3.5 3.5],'y')
end