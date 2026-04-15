% Key Concepts Covered in the Tutorial
% Introduction to Cell Arrays:
% 
% Demonstrates how to create and use cell arrays with mixed data types.
% Differences Between Cell Arrays and Numeric Arrays:
% 
% Highlights the limitations of numeric arrays and the flexibility of cell arrays.
% Indexing in Cell Arrays:
% 
% Explains how {} and () indexing differ when working with cell arrays.
% Operations on Cell Arrays:
% 
% Shows common operations like concatenation and type conversion.
% Practical Examples:
% 
% Demonstrates real-world use cases, such as storing heterogeneous data and working with matrices of different sizes.

% MATLAB Tutorial: Cell Arrays vs. Vectors and Matrices
clc; clear; close all;

%% Part 1: What Are Cell Arrays?
% Cell arrays are containers that can hold data of varying types and sizes.
% Unlike numeric vectors and matrices, cell arrays can store strings, numbers,
% other arrays, or even complex objects in the same structure.

disp('--- Cell Arrays: Introduction ---');

% Create a cell array
C = {'Hello', 42, [1, 2, 3; 4, 5, 6], pi};
disp('Example of a cell array:');
disp(C);

% Access elements in a cell array
disp('Accessing elements:');
disp(['First element (a string): ', C{1}]);
disp(['Second element (a number): ', num2str(C{2})]);
disp('Third element (a matrix):');
disp(C{3});
disp(['Fourth element (a number): ', num2str(C{4})]);

% Compare with numeric matrix
A = [1, 2, 3; 4, 5, 6];
disp('Numeric matrix (cannot store mixed types):');
disp(A);

%% Part 2: Key Differences Between Cell Arrays and Numeric Vectors/Matrices

disp('--- Differences Between Cell Arrays and Numeric Arrays ---');

% Numeric Arrays:
% - Store only numeric data of the same size and type.
% - Perform mathematical operations directly.

% Cell Arrays:
% - Can store mixed data types.
% - Use curly braces {} to access data (unlike parentheses for numeric arrays).

% Example: Numeric Vector
vec = [1, 2, 3];
disp('Numeric vector:');
disp(vec);

% Example: Cell Array with Mixed Types
cell_vec = {1, 'two', [3, 3, 3]};
disp('Cell array with mixed types:');
disp(cell_vec);

% Attempting arithmetic on a cell array (will fail)
try
    result = cell_vec + 1;
catch ME
    disp('Arithmetic on cell arrays is not directly allowed:');
    disp(ME.message);
end

%% Part 3: Indexing in Cell Arrays
disp('--- Indexing in Cell Arrays ---');

% Access data using {} to extract the content
value = C{2}; % Get the content of the second cell
disp(['Content of the second cell: ', num2str(value)]);

% Access data using () to extract a cell (returns a cell array)
cell_value = C(2); % Get the second cell itself
disp('Second cell as a cell array:');
disp(cell_value);

% Modify elements in a cell array
C{2} = 100; % Change the value in the second cell
disp('Modified cell array:');
disp(C);

%% Part 4: Operations on Cell Arrays
disp('--- Operations on Cell Arrays ---');

% Cell arrays support specialized functions for manipulation
% Concatenate cell arrays
C2 = {'New', 99};
C_combined = [C, C2];
disp('Concatenated cell array:');
disp(C_combined);

% Convert cell array to numeric array (if possible)
C_numeric = {1, 2, 3; 4, 5, 6};
disp('Cell array of numbers:');
disp(C_numeric);

numeric_array = cell2mat(C_numeric); % Convert to numeric array
disp('Converted to numeric array:');
disp(numeric_array);

% Convert numeric array to cell array
matrix = [7, 8, 9; 10, 11, 12];
cell_array = num2cell(matrix);
disp('Converted numeric matrix to cell array:');
disp(cell_array);

%% Part 5: Practical Examples
disp('--- Practical Examples of Cell Arrays ---');

% Example 1: Storing Strings and Numbers Together
data = {'Alice', 85; 'Bob', 92; 'Charlie', 78};
disp('Student data stored in a cell array:');
disp(data);

% Access specific elements
disp(['Name of first student: ', data{1, 1}]);
disp(['Score of second student: ', num2str(data{2, 2})]);

% Example 2: Storing Matrices of Different Sizes
matrices = {rand(2, 2), rand(3, 3), rand(4, 4)};
disp('Cell array containing matrices of different sizes:');
disp(matrices);

% Access and manipulate specific matrix
matrix_2x2 = matrices{1};
disp('First matrix (2x2):');
disp(matrix_2x2);

%% Part 6: Summary
disp('--- Summary ---');
disp('Cell arrays are versatile containers for mixed data types.');
disp('Use cell arrays when you need to handle heterogenous data or objects.');
disp('Key features:');
disp('- Store mixed data types.');
disp('- Access with {} to extract content, () to reference cells.');
disp('- Specialized functions like cell2mat and num2cell for conversions.');

disp('--- End of Tutorial ---');
