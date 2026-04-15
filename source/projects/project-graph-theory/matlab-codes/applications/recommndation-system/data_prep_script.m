clear; clc;

data_size = "small";

% Load and preprocess data
movies = readtable("movie-data/movies_" + data_size + ".csv", "TextType", "string");
ratings = readtable("movie-data/ratings_" + data_size + ".csv", "TextType", "string");
n_movies = height(movies);
n_ratings = height(ratings);
users = unique(ratings.userId);
n_users = length(users);

ratings.timestamp = [];
movies = extract_years_from_titles(movies);
movies.avg_rating = nan(n_movies, 1);
movies.n_ratings = nan(n_movies, 1);
avg_rating_table = groupsummary(ratings, "movieId", "mean", "rating");
rows_to_update = ismember(movies.movieId, avg_rating_table.movieId);
movies.avg_rating(rows_to_update) = avg_rating_table.mean_rating;
movies.n_ratings(rows_to_update) = avg_rating_table.GroupCount;

% new_movie_ids = (1:n_movies)';
% max_movie_id = max(movies.movieId);
% movie_id_map = nan(max_movie_id, 1);
% movie_id_map(movies.movieId) = new_movie_ids;
% mapped_rating_movie_ids = movie_id_map(ratings.movieId);
% ratings.movieId = mapped_rating_movie_ids;
% movies.movieId = new_movie_ids;

% new_user_ids = (1:n_users)';
% max_user_id = max(users);
% user_id_map = nan(max_user_id, 1);
% user_id_map(users) = new_user_ids;
% mapped_rating_user_ids = user_id_map(ratings.userId);
% ratings.userId = mapped_rating_user_ids + n_movies;
% userId = new_user_ids + n_movies;

similarity = zeros(n_users,1);
userId = (1:n_users)';
users = table(userId, similarity);

[genres, movies] = extract_genre_table_update_movies(movies);

writetable(movies,"movie-data/movies_tbl_" + data_size + ".csv");
writetable(ratings,"movie-data/ratings_tbl_" + data_size + ".csv");
writetable(genres,"movie-data/genres_tbl_" + data_size + ".csv");

save("movie-data/movie_db_" + data_size + ".mat", ...
    "movies", ...
    "ratings", ...
    "genres", ...
    "users", ...
    "n_movies", ...
    "n_ratings", ...
    "n_users" ...
    );

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

function [genres, movies] = extract_genre_table_update_movies(movies)
    max_genres = 200;
    name(1:max_genres,1) = "";
    genreId = 1:max_genres;
    genreIDs = cell(height(movies), 1);

    genre_count = 0;
    for k = 1:height(movies)

        split_genres = split(movies.genres(k),'|');
        are_new_genres = ~ismember(split_genres, name);
        n_new_genres = sum(are_new_genres);
        name(genre_count + 1:genre_count + n_new_genres) = split_genres(are_new_genres);
        genre_count = genre_count + n_new_genres;
        genre_list = genreId(ismember(name, split_genres));
        genreIDs{k} = genre_list;

    end
    name(genre_count:end) = [];
    genreId(genre_count:end) = [];
    genreId = genreId';
    genres = table(genreId, name);

    movies.genreIDs = genreIDs;

end

