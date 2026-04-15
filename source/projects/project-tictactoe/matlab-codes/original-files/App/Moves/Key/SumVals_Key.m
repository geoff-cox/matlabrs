function values = SumVals_Key(A)
values = zeros(8,1);
i=1;
for r=1:3
    values(i) = sum(A(r,:));
    i=i+1;
end
for c=1:3
    values(i) = sum(A(:,c));
    i=i+1;
end
[values(i),values(i+1)] = DiagonalSums_Key(A);
end