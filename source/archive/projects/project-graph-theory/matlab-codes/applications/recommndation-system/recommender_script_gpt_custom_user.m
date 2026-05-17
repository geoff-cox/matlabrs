%% Movie Recommender: Custom User

%% Load and Preprocess Data

% Clean up
clear; clc;

addpath("graph_theory_code")

% Load datasets and display a summary
dataset_size = "small";
movies = readtable("movie-data/movies_" + dataset_size + ".csv");
ratings = readtable("movie-data/ratings_" + dataset_size + ".csv");

movies = extract_years_from_titles(movies);

% Extract unique genres
unique_genres = unique(split(join(movies.genres, '|'), '|'));
disp('Unique Genres:\n');
disp(unique_genres);

%% User Profile: Custom

favorite_movies = [
        "Braveheart"; 
        "13th Warrior";
        "Gladiator";
        "Conan the Destroyer";
        "Lord of the Rings: The Fellowship of the Ring, The"
        ];

least_favorite_genres =  [
        "Children";
        "Romance";
        "Musical";
        ];

min_year = 1970;
selected_genre = 'Action';

% movieId = get_movie_ids(favorite_movies, movies);
movieId = [ 110; 2826; 3578; 5040; 4993];
rating = 5*ones(height(movieId), 1);
user_ratings = table(movieId, rating);

%% Filter datasets based on Preferences

% Filter movies: exclude already rated, least favorite genres, and old movies
unrated_movies = setdiff(movies.movieId, user_ratings.movieId);
is_unrated = ismember(movies.movieId, unrated_movies);
is_good_genre = ~contains(movies.genres, least_favorite_genres);
is_after_min_yr = movies.year >= min_year;
is_selected_genre = contains(movies.genres, selected_genre);

filtered_movies = movies(is_unrated & is_good_genre & is_after_min_yr & is_selected_genre, :);

disp('Filtered Movies:');
disp(filtered_movies(1:5, :)); % Display first 5 movies

%% Construct Graph

% Create a bipartite graph
user_ids = unique(ratings.userId);
movie_ids = unique(ratings.movieId);

num_users = length(user_ids);
num_movies = length(movie_ids);
num_vertices = num_users + num_movies;

vertex_ids = [user_ids;movie_ids];
vertices = 1:num_vertices;

edges = [ratings.userId ratings.movieId - num_users ratings.rating];

% G = HW6Px_construct_directed_graph(vertices, edges, "movie ratings");

% Create adjacency matrix
adj_matrix = zeros(num_vertices);

% Populate adjacency matrix with ratings
for i = 1:height(ratings)
    user_idx = find(user_ids == ratings.userId(i));
    movie_idx = find(movie_ids == ratings.movieId(i)) + num_users;
    adj_matrix(user_idx, movie_idx) = ratings.rating(i);
end

fav_movie_idx = find(ismember(movie_ids, user_ratings.movieId)) + num_users;

% Visualize the bipartite graph
G = digraph(adj_matrix, 'OmitSelfLoops');

% G = HW6Px_construct_directed_graph(vertices, edges, 'Movie Recommender');

% Example usage
alpha = 0.85;
tol = 1e-6;
target_user = 1;
personalized_scores = personalized_pagerank(G, fav_movie_idx, alpha, tol);

% Recommend movies with top scores
top_movies = sortrows(movies, 'scores', 'descend');
disp('Top Recommended Movies:');
disp(top_movies(1:5, :));

% Define user profile
favorite_movies = input('Enter your 5 favorite movies (as a cell array): ');
least_favorite_genres = input('Enter your 3 least favorite genres (as a cell array): ');
min_year = input('Enter the minimum year for recommendations: ');

% Filter movies
filtered_movies = movies(...
    ~contains(movies.genres, least_favorite_genres) & ...
    movies.year >= min_year, :);

disp('Filtered Movies Based on Profile:');
disp(filtered_movies(1:5, :));

% Highlight recommended movies
recommended_movie_ids = [1, 2, 3]; % Example movie IDs
highlight(G, recommended_movie_ids, 'NodeColor', 'green');
title('Recommended Movies');

% Code Templates
% Step 1: Load and preprocess data
% TODO: Load the 'movies.csv' and 'ratings.csv' files.
% TODO: Extract unique movie genres.

% Step 2: Construct a graph
% TODO: Create an adjacency matrix for users and movies.
% TODO: Add edges between movies with shared genres.

% Step 3: Implement recommendation logic
% TODO: Write a function to compute personalized PageRank scores.
% TODO: Use the scores to recommend top movies.

% Step 4: Visualize the graph
% TODO: Highlight the recommended movies in the graph.