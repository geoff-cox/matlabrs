function locations = FindZeros_Key(nums)
n=length(nums);
locations = [];
j=1;
for i =1:n
    if nums(i) == 0
        locations(j) = i;
        j=j+1;
    end
end
end

