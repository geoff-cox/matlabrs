function visual_feedback(num_correct_in_position, num_correct_color_only, ...
                            guess_num)

    feedback_counter = 1;
    ymin = guess_num - 1;
    ymax = guess_num;
    small_xvals = [4.2 4.5 4.5 4.2];
    large_xvals = small_xvals + 0.4;
    small_yvals = [(ymin + 0.1) (ymin + 0.1) (ymin + 0.4) (ymin + 0.4)];
    large_yvals = small_yvals + 0.4;
    if num_correct_in_position+ num_correct_color_only == 0
        plot([4.2 4.9],[ymin ymax],'k',[4.2 4.9],[ymax ymin],'k')
    else
        for i = 1:num_correct_in_position
            if feedback_counter == 1
                fill(small_xvals, large_yvals, 'k');
                feedback_counter = feedback_counter + 1;
            elseif feedback_counter == 2
                fill(large_xvals, large_yvals, 'k');
                feedback_counter = feedback_counter + 1;
            elseif feedback_counter == 3
                fill(small_xvals, small_yvals, 'k');
                feedback_counter = feedback_counter + 1;
            else
                fill(large_xvals, small_yvals, 'k');
                feedback_counter = feedback_counter + 1;
            end
        end

        for i = 1:num_correct_color_only
            if feedback_counter == 1
                fill(small_xvals, large_yvals, 'w');
                feedback_counter = feedback_counter + 1;
            elseif feedback_counter == 2
                fill(large_xvals, large_yvals, 'w');
                feedback_counter = feedback_counter + 1;
            elseif feedback_counter == 3
                fill(small_xvals, small_yvals, 'w');
                feedback_counter = feedback_counter + 1;
            else
                fill(large_xvals, small_yvals, 'w');
                feedback_counter = feedback_counter + 1;
            end
        end
    end
    

end