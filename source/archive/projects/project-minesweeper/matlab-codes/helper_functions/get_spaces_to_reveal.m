function reveal_list = get_spaces_to_reveal(x, y, state)

    % Write this function
    if state.data(x, y) ~= 0

        reveal_list = [x, y];

    else

        temp = state;
        reveal_list = zeros(state.n*state.n, 2);

        n = state.n;
        n_reveals = 1;

        explore_list = [x, y];
        temp.revealed(x, y) = true;

        while ~isempty(explore_list)

            x = explore_list(1, 1);
            y = explore_list(1, 2);

            if temp.data(x, y) == 0

                neighbors = get_neighbors(x, y, n);

                for r = 1:length(neighbors)
                    new_x = neighbors(r, 1);
                    new_y = neighbors(r, 2);

                    if ~temp.revealed(new_x, new_y)

                        explore_list = [explore_list; new_x new_y];
                        temp.revealed(new_x, new_y) = true;

                    end

                end

            end

            if ~temp.flags(x, y)
                reveal_list(n_reveals,:) = [x y];
                n_reveals = n_reveals + 1;
            end

            explore_list(1,:) = [];

        end

        reveal_list(n_reveals:end,:) = [];

    end

end