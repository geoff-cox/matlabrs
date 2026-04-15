function ids = get_movie_ids(titles, movies)

    ids = zeros(length(titles),1);
    for k = 1:length(titles)

        match = movies(contains(movies.title, titles(k)),:);
        matched_id = match.movieId;
        if isempty(match)
            fprintf("The movie " + + " was not found. Update the preference file.\n");
        elseif ~isscalar(matched_id)
            fprintf('Movie Ambiguity Detected.\n');
            
            htmlrows = ...
                "<tr><td>" + ["ID"; string(match.movieId)] + "</td><td>" + ["YEAR"; string(match.year)] + "</td><td>" + ["TITLE"; string(match.title)] + "</td></tr>";
            html = [
                "<p>Select the desired ID</p>";
                "<table><col width=""33%""><col width=""33%""><col width=""33%"">";
                htmlrows
                "</table>";
                ];

            ids(k) = str2double(uiconfirm(uifigure, ...
                html, ...
                "Movie Ambiguity Detected", ...
                "Options", string(match.movieId)', ...
                "Interpreter", "html" ...
                ));

        else
            ids(k) = matched_id;
        end

    end

end