clear; clc;
dataset_size = "small";
addpath("graph_theory_code")

%% 
% Load datasets
movies = readtable('movies.csv');
ratings = readtable('ratings.csv');

% Merge movies and ratings for easier filtering
merged_data = join(ratings, movies, 'Keys', 'movieId');
disp('Data Preview:');
disp(head(merged_data));

% Parse genres
genres = unique(split(join(movies.genres, '|'), '|')); % Extract unique genres
disp('Available Genres:');
disp(genres);

% Student input for personal profile
disp('Define your personal profile:');
favorite_movies = input('Enter 5 movie titles you would rate 5/5 (as a cell array): ');
least_favorite_genres = input('Enter 3 least favorite genres (as a cell array): ');
min_year = input('Enter the minimum year for recommended movies: ');

% Filter movies dataset for favorite movies
favorite_movie_ids = movies.movieId(contains(movies.title, favorite_movies));
if isempty(favorite_movie_ids)
    error('No matching movies found in the dataset for the provided titles.');
end
disp('Matched favorite movies:');
disp(movies(ismember(movies.movieId, favorite_movie_ids), :));

% Construct bipartite graph: users and movies
user_ids = unique(ratings.userId);
movie_ids = unique(ratings.movieId);
adj_matrix = zeros(length(user_ids) + length(movie_ids));

% Add user-movie edges based on ratings
for i = 1:height(ratings)
    user_idx = find(user_ids == ratings.userId(i));
    movie_idx = find(movie_ids == ratings.movieId(i)) + length(user_ids);
    adj_matrix(user_idx, movie_idx) = ratings.rating(i);
    adj_matrix(movie_idx, user_idx) = ratings.rating(i); % Symmetric for bipartite
end

% Add movie-movie edges for shared genres
for i = 1:height(movies)
    for j = i+1:height(movies)
        if ~isempty(intersect(split(movies.genres{i}, '|'), split(movies.genres{j}, '|')))
            adj_matrix(i + length(user_ids), j + length(user_ids)) = 1;
            adj_matrix(j + length(user_ids), i + length(user_ids)) = 1;
        end
    end
end

% Create MATLAB graph
G = graph(adj_matrix, 'OmitSelfLoops');
disp('Graph constructed.');

% Personalized PageRank
function scores = personalized_pagerank(G, start_nodes, alpha, tol)
    n = size(G.Nodes, 1);
    r = zeros(n, 1);
    r(start_nodes) = 1 / length(start_nodes); % Personalization vector

    % Transition matrix
    adj_mat = adjacency(G);
    P = adj_mat ./ sum(adj_mat, 2, 'omitnan');

    % Iterative computation
    scores = ones(n, 1) / n;
    diff = inf;
    while diff > tol
        new_scores = alpha * (P' * scores) + (1 - alpha) * r;
        diff = norm(new_scores - scores, 1);
        scores = new_scores;
    end
end

% Apply PageRank
favorite_indices = find(ismember(movie_ids, favorite_movie_ids)) + length(user_ids);
alpha = 0.85;
tol = 1e-6;
scores = personalized_pagerank(G, favorite_indices, alpha, tol);

% Filter out movies in least favorite genres or below the minimum year
recommended_movies = movies;
recommended_movies.scores = scores(length(user_ids)+1:end);
recommended_movies = recommended_movies(...
    ~contains(recommended_movies.genres, least_favorite_genres) & ...
    recommended_movies.year >= min_year, :);

% Recommend the top movie in the desired genre
desired_genre = input('Enter a genre for the recommendation: ', 's');
top_movie = recommended_movies(contains(recommended_movies.genres, desired_genre), :);
top_movie = sortrows(top_movie, 'scores', 'descend');
disp('Recommended Movie:');
disp(top_movie(1, :));

% Highlight recommended movie
figure;
h = plot(G, 'NodeLabel', {});
highlight(h, find(contains(movies.title, top_movie.title{1})), 'NodeColor', 'green');
title(sprintf('Recommended Movie: %s', top_movie.title{1}));
