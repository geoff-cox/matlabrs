function [DiagSum,OffDiagSum] = DiagonalSums_Key(A)
[m,n]=size(A);
DiagSum = 0;
OffDiagSum = 0;
for i=1:n
    DiagSum = DiagSum + A(i,i);
    OffDiagSum = OffDiagSum + A(m-i+1,i);
end
end

