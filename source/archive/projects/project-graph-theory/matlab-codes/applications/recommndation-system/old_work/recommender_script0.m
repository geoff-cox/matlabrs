% Load and preprocess data
movies = readtable('movie-data/movies_small.csv','TextType','string');
ratings = readtable('movie-data/ratings_small.csv','TextType','string');

movies = extract_years_from_titles(movies);
movies = extract_genres(movies);

movies.title(movies.fantasy)
% Gather user's age and calculate lifetime movie range
age = 40;%input('Enter your age: ');
start_year = 2023 - age + 5;
end_year = 2023;

% Ask for top 3 favorite movies
top_movies = cell(3, 1);
top_ratings = zeros(3, 1);
% for i = 1:3
%     top_movies{i} = input(['Enter title of favorite movie #' num2str(i) ': '], 's');
%     top_ratings(i) = input('Rate this movie (1-5): ');
% end
top_movies = ["Braveheart"; "13th Warrior"; "Beastmaster"];
top_ratings = [5; 5; 5];

% Filter movies by release year within the user's lifetime
user_lifetime_movies = movies.title((movies.year >= start_year) & ...
    (movies.year <= end_year), :);

% Randomly select movies the user has potentially seen
seen_movies = ["";"";""];
n_seen = 0;
% while n_seen < 3
%     candidate = user_lifetime_movies(randi(height(user_lifetime_movies)));
%     seen = input("Have you seen " + candidate + "? (y/n): ", 's');
%     if strcmpi(seen, 'y')
%         n_seen = n_seen + 1;
%         seen_movies(n_seen) = candidate;
%     end
% end

seen_movies = ["Lethal Weapon 2"; "Mulholland Dr."; "Hacksaw Ridge"];

for i = 1:3
    predicted_rating = predictRating(seen_movies(i), top_movies, top_ratings, ratings, movies);
    fprintf('Predicted rating for "%s" is %.1f\n', seen_movies(i).title, predicted_rating);
    actual_rating = input('Enter your actual rating (1-5): ');
end

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

function movies = extract_genres(movies)
    genres = movies.genres;
    n_genres = height(genres);

    for k = 1:n_genres

        movie_genres = split(genres(k),'|');

        for g = 1:height(movie_genres)
            this_genre = lower(movie_genres(g));
            if ~ismember(this_genre, movies.Properties.VariableNames)
                movies.(this_genre) = false(n_genres,1);
            end
            movies.(this_genre)(k) = true;
        end

    end
    movies.genres = [];
    movies.('(no genres listed)') = [];

end

function predicted_rating = predictRating(target_movie, top_movies, top_ratings, ratings, movies)
    % Predict the rating for a target movie based on user's top movies and ratings.
    % target_movie: table row containing movie info (title, movieId)
    % top_movies: cell array of user's top 3 movie titles
    % top_ratings: vector of user's ratings for their top 3 movies
    % ratings: table containing user ratings with columns userId, movieId, and rating
    
    % Step 1: Find similar users based on user's top movie ratings
    similar_users = findSimilarUsers(top_movies, top_ratings, ratings, movies);
    
    % Step 2: Predict rating for the target movie based on similar users' ratings
    predicted_rating = aggregateSimilarUserRatings(target_movie.movieId, similar_users, ratings);
end

function similar_users = findSimilarUsers(top_movies, top_ratings, ratings, movies)
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
            similarity = calculateSimilarity(top_ratings, user_ratings);
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

function similarity = calculateSimilarity(user_ratings, other_ratings)
    % Compute similarity score between two users based on their ratings
    similarity = 1 / (1 + sum(abs(user_ratings - other_ratings)));
end