function result = HW5P8_is_eulerian(G)
    % Not eulerian if a single odd degree is found
    result = all(mod(G.degrees, 2) == 0);
end
