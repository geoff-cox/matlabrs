clear; clc;
dataset_size = "small";
%% 
db = load("movie-data/movie_db_" + dataset_size + ".mat");
user_preferences

user_id = 1;
user_genre_ranking = get_user_genre_ranking(user_id, movies, ratings, genres);
%% 
my_movies = fields(preferences.rated_movies);
my_rating = [5; 5; 5];

% Get top movie ids
titles = movies.title;
ids = movies.movieId;
% my_mids = ids(contains(titles, my_movies));
% my_mids = [110; 2826; 3578; 5040; 4993];
my_mids = [110; 3578; 4993];
user_ratings_of_my_movies = ratings(ismember(ratings.movieId, my_mids), :);
n_titles = height(titles);

[similarity, uids] = compute_similarity(my_mids, user_ratings_of_my_movies, my_rating, movies, genres);

[similarity, index] = sort(similarity,'descend');
uids = uids(index);
% table(similarity(1:16),uids(1:16));

for k = 1:10
    uid = uids(k);
    mids = ratings.movieId(ratings.userId == uid);
    movies.title(ismember(movies.movieId, mids));
    genre_ranking = get_user_genre_ranking(uid, movies, ratings, genres);  
    five_star_movie_ids = ratings.movieId(ratings.userId == uid & ratings.rating == 5);
    movies.title(ismember(movies.movieId, five_star_movie_ids))
end

%% 

top_movie_data(1:length(my_movies)) = struct( ...
    'title', '', ...
    'id', 0, ...
    'avg_rating', 0, ...
    'n_raters', 0, ...
    'raters', [], ...
    'stars_50', [], ...
    'stars_45', [], ...
    'stars_40', [] ...
    );
avg_rating = zeros(1, length(my_movies));

for i = 1:length(my_movies)
    title = my_movies(i);
    movie_id = ids(contains(titles, title));

    assert(isscalar(movie_id), 'Movie Ambiguity Detected');

    movie_ratings = ratings(ratings.movieId == movie_id,:);
    raters = movie_ratings.userId;
    ratings_50stars = movie_ratings(movie_ratings.rating == 5.0,:);
    ratings_45stars = movie_ratings(movie_ratings.rating == 4.5,:);
    ratings_40stars = movie_ratings(movie_ratings.rating == 4.0,:);

    top_movie_data(i) = struct( ...
        'title', title, ...
        'id', movie_id, ...
        'avg_rating', mean(movie_ratings.rating), ...
        'n_raters', height(movie_ratings), ...
        'raters', raters, ...
        'stars_50', ratings_50stars.userId, ...
        'stars_45', ratings_45stars.userId, ...
        'stars_40', ratings_40stars.userId ...
        );
end

ratings(ismember(ratings.movieId, top_movie_ids), :)

function genre_ranking = get_user_genre_ranking(user_id, movies, ratings, genres)
    user_data = ratings(ratings.userId == user_id, ["movieId","rating"]);
    user_data = [user_data movies(ismember(movies.movieId, user_data.movieId), ["title","genres"])];
    n_ratings = height(user_data);
    count = zeros(size(genres));
    sum_rating = zeros(size(genres));
    for k = 1:n_ratings
        movie_genres = split(user_data.genres(k),'|');
        genres_to_count = ismember(genres, movie_genres);
        count(genres_to_count) = count(genres_to_count) + 1;
        sum_rating(genres_to_count) = sum_rating(genres_to_count) + user_data.rating(k);

    end
    
    top_num_to_keep = 10;

    pct = round(count / n_ratings * 100);
    avg_rating = round(sum_rating ./ count, 1);
    avg_rating(isnan(avg_rating)) = 0;

    [~, I_pct] = sort(pct, "descend");
    genre = genres(I_pct(1:top_num_to_keep));
    pct = pct(I_pct(1:top_num_to_keep));
    avg_rating = avg_rating(I_pct(1:top_num_to_keep));

    temp_tbl = table(genre, pct, avg_rating);
    by_pct = temp_tbl.genre + " (" + temp_tbl.pct + ")";

    temp_tbl = sortrows(temp_tbl,{'avg_rating','pct'},{'descend','descend'});
    by_avg_rating = temp_tbl.genre + " (" + temp_tbl.avg_rating + ")";

    genre_ranking = table(by_pct, by_avg_rating);
    
end

function predicted_rating = predictRating(target_movie, top_movies, ratings, movies)
    % Predict the rating for a target movie based on user's top movies and ratings.
    % target_movie: table row containing movie info (title, movieId)
    % top_movies: cell array of user's top 3 movie titles
    % top_ratings: vector of user's ratings for their top 3 movies
    % ratings: table containing user ratings with columns userId, movieId, and rating
    
    % Step 1: Find similar users based on user's top movie ratings
    similar_users = findSimilarUsers(top_movies, ratings, movies);
    
    % Step 2: Predict rating for the target movie based on similar users' ratings
    predicted_rating = aggregateSimilarUserRatings(target_movie.movieId, similar_users, ratings);
end

function similar_users = findSimilarUsers(top_movies, ratings, movies)
    % Find users who have rated the same top movies as the current user
    % and calculate similarity scores based on those ratings.
    
    % Initialize an empty list for similar users
    similar_users = [];
    
    % Loop through each user in the ratings dataset
    unique_users = unique(ratings.userId);
    
    for i = 1:length(unique_users)
        user_id = unique_users(i);
        
        % Extract this user's ratings for the user's top movies
        user_ratings = [];
        for j = 1:length(top_movies)
            movie_id = findMovieId1(top_movies{j}, movies);
            if movie_id > 0
                rating = getUserMovieRating1(user_id, movie_id, ratings);
                if ~isempty(rating)
                    user_ratings = [user_ratings, rating];
                else
                    user_ratings = [user_ratings, NaN]; % No rating for this movie
                end
            end
        end
        
        % Only keep users who rated all of the user's top movies
        if all(~isnan(user_ratings))
            similarity = calculateSimilarity(user_ratings);
            similar_users = [similar_users; struct('userId', user_id, 'similarity', similarity)];
        end
    end
end

function movie_id = findMovieId1(movie_title, movies)
    % Helper function to find the movieId for a given movie title in the ratings table
    movie_id = -1; % Default to -1 if not found
    if any(strcmp(movies.title, movie_title))
        movie_id = movies.movieId(strcmp(movies.title, movie_title));
    end
end

function rating = getUserMovieRating1(user_id, movie_id, ratings)
    % Retrieve a specific rating for a user and movieId
    rating_row = ratings(ratings.userId == user_id & ratings.movieId == movie_id, :);
    if ~isempty(rating_row)
        rating = rating_row.rating;
    else
        rating = [];
    end
end

function [similarity, user_ids] = compute_similarity(movie_ids, ratings, my_ratings, movies, genres)
    m = length(movie_ids);
    user_ids = unique(ratings.userId);
    n_users = length(user_ids);
    similarity = zeros(n_users, 1);
    for k = 1:n_users
        user_rating_table = ratings(ratings.userId == user_ids(k),:);
        user_ratings = user_rating_table.rating;
        movies_rated = ismember(movie_ids, user_rating_table.movieId);
        my_common_ratings = my_ratings(movies_rated);
        genre_ranking = get_user_genre_ranking(user_ids(k), movies, ratings, genres);
        top_genre_rank = find(contains(genre_ranking.by_avg_rating,"Fantasy"));
        genre_boost = (length(genres) - top_genre_rank)/length(genres);
        distance = sum(abs(user_ratings - my_common_ratings)) + (m - length(user_ratings))^2 - genre_boost;
        similarity(k) = 1 / (1 + distance);
    end
end