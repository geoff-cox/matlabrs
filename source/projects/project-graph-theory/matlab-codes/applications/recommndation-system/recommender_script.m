clear; clc;
dataset_size = "small";
addpath("graph_theory_code")

%% 
db = load("movie-data/movie_db_" + dataset_size + ".mat");

preferences = get_user_preferences;

n_movies = height(db.movies);
n_ratings = height(db.ratings);

%% Similarity Edges

% Get top movie ids
titles = db.movies.title;
ids = db.movies.movieId;

preferences.movie_ids = get_movie_ids(preferences, db.movies);

% Filter movies that have been rated by the users movies
% common_movies = db.movies(ismember(db.movies.movieId, other_movies_ids), :);

db.users.similarity = compute_similarity(preferences, db);

function similarity = compute_similarity(preferences, db)

    % Filter movies table based on preferences
    % dont_like_filter = ~contains(db.movies.genres, preferences.dont_like);
    % min_year_filter = db.movies.year >= preferences.min_year;
    % movies = db.movies(dont_like_filter & min_year_filter, :);

    % Get all userIds that rated my rated movies

    was_rated = ismember(db.ratings.movieId, preferences.movie_ids);
    rated_ids = db.ratings.movieId(was_rated);
    only_rated_table = db.ratings(rated_ids, :);
    disp(only_rated_table(only_rated_table.userId == 1,:))

    movie_ids_of_rated_movies = db.ratings.movieId(rated_movies);
    user_ids_that_rated_movies = db.ratings.userId(rated_movies);
    
    m_titles = db.movies.title(ismember(db.movies.movieId, movie_ids_of_rated_movies));

    % Filter users that have rated the users movies
    common_users = unique(db.ratings.userId(ismember(db.ratings.movieId, preferences.movie_ids)))';
    other_ratings = db.ratings(ismember(db.ratings.userId, common_users), :);
    other_movies_ids = other_ratings.movieId;
    other_movies = db.movies(ismember(db.movies.movieId, other_movies_ids), :);

    m = length(preferences.movie_ids);
    n_users = length(common_users);
    similarity = zeros(db.n_users, 1);
    for cu = common_users
        user_rating_table = other_ratings(other_ratings.userId == cu,:);
        user_ratings = user_rating_table.rating;
        movies_rated = ismember(preferences.movie_ids, user_rating_table.movieId);
        user_common_ratings = user_ratings(ismember(user_rating_table.movieId, preferences.movie_ids));
        my_common_ratings = preferences.ratings(movies_rated);
        % genre_ranking = get_user_genre_ranking(cu, other_movies, other_ratings, db.genres);
        % top_genre_rank = find(contains(genre_ranking.by_avg_rating, "Fantasy"));
        % if isempty(top_genre_rank)
            genre_boost = 0;
        % else
        %     genre_boost = (height(db.genres) - top_genre_rank)/height(db.genres);
        % end
        distance = sum(abs(user_common_ratings - my_common_ratings)) + (m - length(user_common_ratings))^2 - genre_boost;
        similarity(cu) = 1 / (1 + distance);
    end
end

db.users.similarity = similarity;
% table(similarity(1:16),uids(1:16));

for k = 1:10
    uid = uids(k);
    mids = ratings.movieId(ratings.userId == uid);
    movies.title(ismember(movies.movieId, mids));
    genre_ranking = get_user_genre_ranking(uid, movies, ratings, genres);  
    five_star_movie_ids = ratings.movieId(ratings.userId == uid & ratings.rating == 5);
    movies.title(ismember(movies.movieId, five_star_movie_ids))
end

%% Rating Edges

edges = [db.ratings.userId db.ratings.movieId db.ratings.rating];
vertices = 1:db.users(end);
G = HW5P11_construct_graph(vertices, edges, 'movie_ratings');

rmpath("graph_theory_code")



function ids = get_movie_ids(preferences, movies)
    
    if isfield(preferences,'movie_ids')
        ids = preferences.movie_ids;
        return
    end

    ids = zeros(1,length(preferences.titles));
    for k = 1:length(preferences.titles)

        match = movies(contains(movies.title, preferences.titles(k)),:);
        matched_id = match.movieId;
        if isempty(match)
            fprintf("The movie " + + " was not found. Update the preference file.\n");
        elseif ~isscalar(matched_id)
            fprintf('Movie Ambiguity Detected.\n');
            disp(match);
            ids(k) = input("Type in the desired movieId for " + preferences.titles(k) + ": ");
        else
            ids(k) = matched_id;
        end

    end

end


function genre_ranking = get_user_genre_ranking(user_id, movies, ratings, genres)
    user_data = ratings(ratings.userId == user_id, ["movieId","rating"]);
    user_data = [user_data movies(ismember(movies.movieId, user_data.movieId), ["title","genres"])];
    n_ratings = height(user_data);
    count = zeros(height(genres), 1);
    sum_rating = zeros(height(genres), 1);
    for k = 1:n_ratings
        movie_genres = split(user_data.genres(k),'|');
        genres_to_count = ismember(genres.name, movie_genres);
        count(genres_to_count) = count(genres_to_count) + 1;
        sum_rating(genres_to_count) = sum_rating(genres_to_count) + user_data.rating(k);

    end
    
    top_num_to_keep = 10;

    pct = round(count / n_ratings * 100);
    avg_rating = round(sum_rating ./ count, 1);
    avg_rating(isnan(avg_rating)) = 0;

    [~, I_pct] = sort(pct, "descend");
    genre = genres.name(I_pct(1:top_num_to_keep));
    pct = pct(I_pct(1:top_num_to_keep));
    avg_rating = avg_rating(I_pct(1:top_num_to_keep));

    temp_tbl = table(genre, pct, avg_rating);
    by_pct = temp_tbl.genre + " (" + temp_tbl.pct + ")";

    temp_tbl = sortrows(temp_tbl,{'avg_rating','pct'},{'descend','descend'});
    by_avg_rating = temp_tbl.genre + " (" + temp_tbl.avg_rating + ")";

    genre_ranking = table(by_pct, by_avg_rating);
    
end