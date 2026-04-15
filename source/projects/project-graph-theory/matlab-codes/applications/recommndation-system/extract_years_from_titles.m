function movies = extract_years_from_titles(movies)
    titles = movies.title;
    n_titles = height(titles);
    years = nan(n_titles,1);
    
    for k = 1:n_titles

        year = extractBetween(titles(k), '(', ')');
        if ~isempty(year)
            years(k) = str2double(year(end));
        end
        titles(k) = strip(erase(titles(k),"(" + year + ")"));

    end
    movies.title = titles;
    movies.year = years;
end