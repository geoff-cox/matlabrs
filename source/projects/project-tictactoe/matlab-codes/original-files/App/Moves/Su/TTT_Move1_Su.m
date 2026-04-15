function move=TTT_Move1_Su(gameBoard,randomSeed)
switch nargin
    case 1
    randdomSeed=100;
    case 2
    rng(randomSeed);       
end
gameBoard1=gameBoard(1:9);
A=FindZeros_Su(gameBoard1);
n=length(FindZeros_Su(gameBoard1));
B=randi(n,1);
move=A(B);
end


