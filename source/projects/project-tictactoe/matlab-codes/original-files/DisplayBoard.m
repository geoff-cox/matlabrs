function DisplayBoard(Board)
%displayBoard = ['   |   |   ';'-----------';'   |   |   ';'-----------';'   |   |   '];
displayBoard = [' 1 | 4 | 7 ';'-----------';' 2 | 5 | 8 ';'-----------';' 3 | 6 | 9 '];
for r = 1:3
    for c = 1:3
        if Board(r,c) == 1
            displayBoard(2*r-1,4*c-2) = 'X';
        elseif Board(r,c) == -1
            displayBoard(2*r-1,4*c-2) = 'O';
        end
    end
end
fprintf('\n')
disp(displayBoard);
fprintf('\n')
end

