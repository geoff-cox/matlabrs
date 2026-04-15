function triangle_library = group_triangles(side_lengths)

    small_number = 10*eps;
    n_triangles = height(side_lengths);

    for k = 1:n_triangles

        side_lengths(k, :) = sort(side_lengths(k, :));

        % extract the side lengths
        a = side_lengths(k, 1);
        b = side_lengths(k, 2);
        c = side_lengths(k, 3);
        
        % perimeter calculation
        P = a + b + c;
        
        % area calculation
        s = 0.5*P;
        under_sqrt = s*( s-a )*( s-b )*( s-c );
        A = sqrt( under_sqrt );

        % determine if triangle is a right triangle
        % if-statement version
        if abs(a^2 + b^2 - c^2) < small_number
            right = true;
        else
            right = false;
        end
        % no if-statement version (better)
        right = abs(a^2 + b^2 - c^2) < small_number;

        % determine if triangle is valid
        % if-statement version
        if under_sqrt > 0
            valid = true;
        else
            valid = false;
        end
        % no if-statement version (better)
        valid = under_sqrt > 0;

        triangle_library.(['triangle_' num2str(k)]) = struct( ...
            'sides', [a b c], ...
            'perimeter', P, ...
            'area', A, ...
            'hypotenuse', c, ...
            'is_right', right, ...
            'is_valid', valid ...
            );

    end

end