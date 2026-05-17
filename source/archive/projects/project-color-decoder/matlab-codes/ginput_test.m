% 
% close all
% %Set up the game board
%     figure(1);
%     hold on
%     ax = gca;
%     %ax.XAxis.Visible = 'off';
%     %ax.YAxis.Visible = 'off';
%     
%     %Fill the top boxes with dark grey since to indicate the secret code
%     %   is covered up:
%         fill([0 4 4 0],[10 10 11 11],[0.5 0.5 0.5]);
% 
%     %Create the boxes
%     for i = 0:11
%         plot([0 4],[i i],'k','LineWidth',4)
%     end
%     for j = 0:4
%         plot([j j],[0 11],'k','LineWidth',4)
%     end
%     title('Color Decoder','FontSize',16)
%     text(-0.8,0.5,'1st guess')
%     text(-0.8,1.5,'2nd guess')
%     text(-0.8,2.5,'3rd guess')
%     text(-0.8,3.5,'4th guess')
%     text(-0.8,4.5,'5th guess')
%     text(-0.8,5.5,'6th guess')
%     text(-0.8,6.5,'7th guess')
%     text(-0.8,7.5,'8th guess')
%     text(-0.8,8.5,'9th guess')
%     text(-0.8,9.5,'Final guess')
%     text(-0.8,10.5,'Secret Code')
%     axis([-1 8 0 12])
%     set(gca,'color','#f0f0f0')
%     
%     %Color Choice boxes
%     text(6,8.5,'Color Choices','FontSize',14)
%     fill([6 7 7 6],[7 7 8 8],'b')
%     fill([6 7 7 6],[5.5 5.5 6.5 6.5],'r')
%     fill([6 7 7 6],[4 4 5 5],'w')
%     fill([6 7 7 6],[2.5 2.5 3.5 3.5],'y')

        
%Now the user chooses the four colors for their guess:
    %Start by making sure all 4 targets are available.
    target1_available = true;
    target2_available = true;
    target3_available = true;
    target4_available = true;
    guess_num = 1;
    for i = 1:4
        %Choose the desired color:
        x = 0;
        y = 0;
        while (x<=6) || (x>=7) ...
                     || (y<=2.5) ...
                     || (y>=3.5 && y<=4) ...
                     || (y>=5 && y<=5.5) ...
                     || (y>=6.5 && y<=7) ...
                     || (y>=8)
            [x, y] = ginput(1);
        end
        if y>=7
            color = 'b';
        elseif y >= 5.5
            color = 'r';
        elseif y >= 4
            color = 'w';
        elseif y >= 2.5
            color = 'y';
        end
    
        %Then user chooses target:
            ymin = guess_num - 1;
            ymax = guess_num;
            x = 0;
            y = 0;
            while (y<=ymin || y >= ymax || x <= 0 || x >= 4) ...
                        || (x >0 && x<=1 && ~target1_available) ...
                        || (x >1 && x<=2 && ~target2_available) ...
                        || (x >2 && x<=3 && ~target3_available) ...
                        || (x >3 && x<=4 && ~target4_available)
                [x, y] = ginput(1);
            end
            if x<=1
                fill([0 1 1 0],[ymin ymin ymax ymax],color);
                target1_available = false;
            elseif x<=2
                fill([1 2 2 1],[ymin ymin ymax ymax],color)
                target2_available = false;
            elseif x<=3
                fill([2 3 3 2],[ymin ymin ymax ymax],color);
                target3_available = false;
            else 
                fill([3 4 4 3],[ymin ymin ymax ymax],color);
                target4_available = false;
            end
    end
        
    %Feedback boxes:
    fill([4.2 4.5 4.5 4.2], ...
        [(ymin + 0.1) (ymin + 0.1) (ymin + 0.4) (ymin + 0.4)],'k'); %3
    fill([4.2 4.5 4.5 4.2], ...
        [(ymin + 0.5) (ymin + 0.5) (ymin + 0.8) (ymin + 0.8)],'k'); %1
    fill([4.6 4.9 4.9 4.6], ...
        [(ymin + 0.1) (ymin + 0.1) (ymin + 0.4) (ymin + 0.4)],'k'); %4
    fill([4.6 4.9 4.9 4.6], ...
        [(ymin + 0.5) (ymin + 0.5) (ymin + 0.8) (ymin + 0.8)],'k'); %2