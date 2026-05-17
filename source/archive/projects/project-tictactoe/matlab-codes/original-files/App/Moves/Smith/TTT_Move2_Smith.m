%David Smith
%10/15/18
%MA 310 HW 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Help Received: For the entire assignment: MATLAB to complete the
%assignment.Heard conversations in the class room about: 'Check input,'
%'how would it change,' 'values,' 'no you only need to know,' 'FindZeros,'
%'currently,' 'whay do you make move 1/Move1', 'length of 5' (I cannot remember whether I heard something
%about this or not but it was near my notes about things I heard in class
%so I wanted to cite it just in case even though I cannot remember for sure
%whether I heard this or if it was just from my notes to help me write the
%codes). I saw another cadets heading to a code as I was in the classroom,
%I did not see any specific actual coding just a heading or some
%formatting. Looked back at previous homework codes and saw formatting. I
%saw another cadet's screen during class I did't see anything specific that
%I could read I just saw some lines of what appeared to be code on the
%screen (I didn't see any specific code syntax that I could read but wanted
%to cite it just in case. Used information from class discussions about the
%assignment to help me.

%For this code: I used my FindZeros_Smith, TTT_Move1_Smith, and 
%TTT_WinnerCheck_Smith codes. I used the information from the class 
%dicussion about nargin and rng and random seeds to help me with writing
%my code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pseudocode
%1. Begin the function and allow for any inputs.
%2. Initialize any counting variables.
%3. Use nargin to allow for the two paths depending on whether a random
%   seed value is input.
%4. Use if statements to separate the paths even further based on which
%   player's turn it is.
%5. Find the available spaces and the size of the vector.
%6. Make a new game board and begin to try values to see if they produce a
%   winner.
%7. If a winner is produced, then that index value is saved in a vector for
%   later.
%8. Winner Check function and Move function will be needed to test for a
%   winner and to choose a move if a winner cannot be found using the
%   available moves.
%9. Display the final move option and end all loops and the function.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function move=TTT_Move2_Smith(gameBoard,player,randomSeed)
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
        move=TTT_Move1_Smith(gameBoard,randomSeed);
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
        move=TTT_Move1_Smith(gameBoard,randomSeed);
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
         move=TTT_Move1_Smith(gameBoard);
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
         move=TTT_Move1_Smith(gameBoard);
         p(q)=move;
    end
    move=p(1);
end
move=move
end
       
        
           

        
        
            