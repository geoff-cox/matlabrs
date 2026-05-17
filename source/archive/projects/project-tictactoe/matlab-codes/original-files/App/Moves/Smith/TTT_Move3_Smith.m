%David Smith
%11/5/18
%MA 310 HW 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Help Received: I copied over my code from TTT_Move2_Smith and then
%modified it for this program. I used my TTT_Move1_Smith and
%TTT_Move2_Smith programs as functions in this program. I used my
%FindZeros_Smith function. I used my TTT_WinnerCheck_Smith function.
%See general HR on DistanceBetweenPts_Smith code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pseudocode
%1. For this problem, I chose to modify my TTT_Move2_Smith function. I
%began by copying over the code. Then I recognized that the cde had
%basically four paths and that each had three move choice recommendation
%tools. I removed the thir option from each of the four sections which was
%the TTT_Move1_Smith function. In its place, I put in a section with a
%double for loop that followed a for loop. The initial for loop took each
%of the options for open spaces in the game board and placed the proper
%player value there. Then TTT_Move2_Smith is used to choose a move from
%this point. The moves are compiled in a vector and then another for loop
%is used to sort the values and find any repeated move choices. If a move
%choice is detected, it is added to the moves vector p. The code finishes
%by choosing the first value from the p vector as the move choice.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function move=TTT_Move3_Smith(gameBoard,player)
win=0;
q=1;
if nargin==3
    if player==1
        a=FindZeros_Smith(gameBoard);
        b=length(a);
        for i=1:b
            gb=gameBoard;
            c=a(i);
            gb(c)=1;
            move=c;
            win=TTT_WinnerCheck_Smith(gb);
            if win==1
                p(q)=move;
                q=q+1;
            end
        end
        for j=1:b
            gb=gameBoard;
            d=a(j);
            gb(d)=-1;
            move=d;
            win=TTT_WinnerCheck_Smith(gb);
            if win==-1
                p(q)=move;
                q=q+1;
            end
        end
        move=10;
        gb=gameBoard
        for nn=1:b
            gb(nn)=1;
            mv(nn)=TTT_Move2_Smith(gb,1);
            gb=gameBoard;
        end
        for hh=1:length(mv)
            for jj=2:length(mv)
                res=((mv(hh)-mv(jj))^2);
                if res==0
                    move=mv(hh);
                    break;
                    break;
                end
            end
        end
        if move==10
            qqj=randi(length(a));
            move=qqj;
        else
            move=move;
        end

        p(q)=move;
    else
        a=FindZeros_Smith(gameBoard);
        b=length(a);
        for i=1:b
            gb=gameBoard;
            c=a(i);
            gb(c)=-1;
            move=c;
            win=TTT_WinnerCheck_Smith(gb);
            if win==-1
                p(q)=move;
                q=q+1;
            end
        end
        for j=1:b
            gb=gameBoard;
            d=a(j);
            gb(d)=1;
            move=d;
            win=TTT_WinnerCheck_Smith(gb);
            if win==1
                p(q)=move;
                q=q+1;
            end
        end
         move=10;
        gb=gameBoard;
        for nn=1:b
            gb(nn)=-1;
            mv(nn)=TTT_Move2_Smith(gb,-1);
            gb=gameBoard;
        end
        for hh=1:length(mv)
            for jj=2:length(mv)
                res=((mv(hh)-mv(jj))^2);
                if res==0
                    move=mv(hh);
                    break;
                    break;
                end
            end
        end
        if move==10;
            qqj=randi(length(a));
            move=qqj;
        else
            move=move;
        end

        
        p(q)=move;
    end
    move=p(1);
else
    if player==1
         a=FindZeros_Smith(gameBoard);
         b=length(a);
         for i=1:b
             gb=gameBoard;
             c=a(i);
             gb(c)=1;
             move=c;
             win=TTT_WinnerCheck_Smith(gb);
             if win==1
                 p(q)=move;
                 q=q+1;
             end
         end
         for j=1:b
             gb=gameBoard;
             d=a(j);
             gb(d)=-1;
             move=d;
             win=TTT_WinnerCheck_Smith(gb);
             if win==-1
                 p(q)=move;
                 q=q+1;
             end
         end
          move=10;
        gb=gameBoard;
        for nn=1:b
            gb(nn)=1;
            mv(nn)=TTT_Move2_Smith(gb,1);
            gb=gameBoard;
        end
        for hh=1:length(mv)
            for jj=2:length(mv)
                res=((mv(hh)-mv(jj))^2);
                if res==0
                    move=mv(hh);
                    break;
                    break;
                end
            end
        end
        if move==10
            qqj=randi(length(a));
            move=qqj;
        else
            move=move;
        end

         
         p(q)=move;
    else
         a=FindZeros_Smith(gameBoard);
         b=length(a);
         for i=1:b;
             gb=gameBoard;
             c=a(i);
             gb(c)=-1;
             move=c;
             win=TTT_WinnerCheck_Smith(gb);
             if win==-1
                 p(q)=move;
                 q=q+1;
             end
         end
         for j=1:b
             gb=gameBoard;
             d=a(j);
             gb(d)=1;
             move=d;
             win=TTT_WinnerCheck_Smith(gb);
             if win==1
                 p(q)=move;
                 q=q+1;
             end
         end
          move=10;
        gb=gameBoard;
        for nn=1:b
            gb(nn)=-1;
            mv(nn)=TTT_Move2_Smith(gb,-1);
            gb=gameBoard;
        end
        for hh=1:length(mv)
            for jj=2:length(mv)
                res=((mv(hh)-mv(jj))^2);
                if res==0
                    move=mv(hh);
                    break;
                    break;
                end
            end
        end
        if move==10
            qqj=randi(length(a));
            move=qqj;
        else
            move=move;
        end

         p(q)=move;
    end
    move=p(1);
end
move=move;
end
