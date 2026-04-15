function TTT_Move3_Pessognelli(gameBoard, player)
DisplayBoard(gameBoard) %Starting gameBoard 1
sumVals = SumVals_Pessognelli(gameBoard);

        if player == 1 %person moves first
            loc = input('Player X please select an open space:');
            gameBoard(loc) = 1;
            DisplayBoard(gameBoard)
            fprintf('CPU Move:')
                for u = 1:8
                    if sumVals(u) == -2 %CPU WINNING MOVE
                        gameBoard = CPUWinningMove(gameBoard);
                        DisplayBoard(gameBoard)
                        break
                    
               
                 
                    elseif sumVals(u) == 2 %CPU BLOCK
                        gameBoard = CPUBlockPlayerX(gameBoard);
                        DisplayBoard(gameBoard)
                        break
                    
                    elseif gameBoard(5) == 0 %CPU takes center position
                        gameBoard(5) = -1;
                        break
                    end
                 end
                  
                    if sumVals(1) ~= 2 && sumVals(1) ~= -2 &&  sumVals(2) ~= 2 && sumVals(2) ~= -2 && sumVals(3) ~= 2 && sumVals(3) ~= -2 && sumVals(4) ~= 2 && sumVals(4) ~= -2 && sumVals(5) ~= 2 && sumVals(5) ~= -2 && sumVals(6) ~= 2 && sumVals(6) ~= -2 && sumVals(7) ~= 2 && sumVals(7) ~= -2 && sumVals(8) ~= 2 && sumVals(8) ~= -2 %CPU RANDOM MOVE
                    TTT_Move1_Pessognelli(gameBoard)
                    DisplayBoard(gameBoard)
                    end
                 
        elseif player == -1 %cpu moves first
            fprintf('CPU Move:')
            for u = 1:8
                    if sumVals(u) == -2 %CPU WINNING MOVE
                        gameBoard = CPUWinningMove(gameBoard);
                        DisplayBoard(gameBoard)
                        break
                    
               
                 
                    elseif sumVals(u) == 2 %CPU BLOCK
                        gameBoard = CPUBlockPlayerX(gameBoard);
                        DisplayBoard(gameBoard)
                        break
                    
                         
                    elseif gameBoard(5) == 0 %CPU takes center position
                        gameBoard(5) = -1;
                        break
                    end
                 end
                  
                    if sumVals(1) ~= 2 && sumVals(1) ~= -2 &&  sumVals(2) ~= 2 && sumVals(2) ~= -2 && sumVals(3) ~= 2 && sumVals(3) ~= -2 && sumVals(4) ~= 2 && sumVals(4) ~= -2 && sumVals(5) ~= 2 && sumVals(5) ~= -2 && sumVals(6) ~= 2 && sumVals(6) ~= -2 && sumVals(7) ~= 2 && sumVals(7) ~= -2 && sumVals(8) ~= 2 && sumVals(8) ~= -2 %CPU RANDOM MOVE
                    TTT_Move1_Pessognelli(gameBoard)
                    DisplayBoard(gameBoard)
                    end
            loc = input('Player X please select an open space:');
            gameBoard(loc) = 1;
            DisplayBoard(gameBoard)
        end
        
        
   
end