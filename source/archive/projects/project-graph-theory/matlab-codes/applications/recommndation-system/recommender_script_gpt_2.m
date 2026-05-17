clear; clc;
dataset_size = "small";
addpath("graph_theory_code")

%% 
% Load datasets and display a summary
movies = readtable('movies.csv');
ratings = readtable('ratings.csv');

% Extract unique genres
unique_genres = unique(split(join(movies.genres, '|'), '|'));

disp('Unique Genres:');
disp(unique_genres);

% Filter movies by a given year and genre
min_year = 2000;
selected_genre = 'Action';
filtered_movies = movies(movies.year >= min_year & contains(movies.genres, selected_genre), :);

disp('Filtered Movies:');
disp(filtered_movies(1:5, :)); % Display first 5 movies

% Create a bipartite graph
user_ids = unique(ratings.userId);
movie_ids = unique(ratings.movieId);

% Create adjacency matrix
num_users = length(user_ids);
num_movies = length(movie_ids);
adj_matrix = zeros(num_users + num_movies);

% Populate adjacency matrix with ratings
for i = 1:height(ratings)
    user_idx = find(user_ids == ratings.userId(i));
    movie_idx = find(movie_ids == ratings.movieId(i)) + num_users;
    adj_matrix(user_idx, movie_idx) = ratings.rating(i);
end

% Visualize the bipartite graph
G = graph(adj_matrix, 'OmitSelfLoops');
plot(G);

% Example usage
alpha = 0.85;
tol = 1e-6;
target_user = 1;
personalized_scores = personalized_pagerank(G, target_user, alpha, tol);

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
