function result = HW5P9_is_tree(G)
    result = HW5P7_is_connected(G) && ~HW5P6_has_cycle(G);
end
