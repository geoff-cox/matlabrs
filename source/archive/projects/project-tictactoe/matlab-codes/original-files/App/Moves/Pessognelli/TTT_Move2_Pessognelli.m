function TTT_Move2_Pessognelli(gameBoard, player, randomSeed)
DisplayBoard(gameBoard) %Starting gameBoard 1
sumVals = SumVals_Pessognelli(gameBoard);
switch nargin
    case 2
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
        
        
    case 3
        rng(randomSeed);
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
end