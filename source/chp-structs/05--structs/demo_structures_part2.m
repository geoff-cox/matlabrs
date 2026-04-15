%% Structures
%% 
% A structure in MATLAB is a data type that allows us to store data of different 
% types, like numbers, strings, and arrays, all under one object. We access the 
% data by referencing the field names.
% 
% For further information see MATLAB's documentation page here:     <https://www.mathworks.com/help/matlab/ref/struct.html 
% https://www.mathworks.com/help/matlab/ref/struct.html>
%% Part 2: Structure Arrays
% Introduction
% As an example, suppose we wanted to design a program that tracks a library's 
% collection of books. Each book can be categorized with sub-variables specific 
% to the book.
% 
% The following figure shows a collection of N books, as well as a sample of 
% the information you may wish to track for each book.
% 
% 
% 
% All of this information can be contained in a MATLAB |struct| variable. 
% 
% |Notes:|
%% 
% * |struct| variables follow this "top-down" hierarchy where |collection| is 
% the main variable. The |books| variable is called a field of the |collection| 
% variable. 
% * |books(1)|, |books(2)|, ... , |books(N)| are also |struct| variables since 
% they contain the fields: |title|, |author|, |released|, |genre|, |loaned|, and 
% |loaned_to|.
% * Since |books| is indexed, we call it a |1 x N| |struct| array (i.e. vector).
% * You must use periods to access values contained in the |struct|. For example, 
% if you want to know the genre of the 504th book in the collection, you would 
% need to type:
%%
% 
%   collection.book(504).genre
%
% Introduction
% In this demonstration, we will explore how to use structures in MATLAB. Structures 
% allow us to group related data of different types into one object, making it 
% easy to organize and manage complex data.
% Example 1
% Create a struct variable that contains the following information:
% 
% 
% 
% There are two options for adding book to this |collection| |struct|.
% 
% Option 1: add |book(1)| to |collection| using the period notation.

collection.books(1).title = 'Frankenstein';
collection.books(1).author = 'Shelly';
collection.books(1).released = 1818;
collection.books(1).genre = 'horror';
collection.books(1).loaned = true;
collection.books(1).loaned_to = 'Smith';

collection
display(collection.books)
%% 
% Option 2: add |book(2)| to |collection| using the |struct| command.

collection.books(2) = struct( ...
    'title', 'Dubliners', ...
    'author', 'Joyce', ...
    'released', 1914, ...
    'genre', 'short story', ...
    'loaned', false, ...
    'loaned_to', '');

collection
display(collection.books)
% Part 2: What is a Structure Array?
% A structure array is an array of structures. Each element in the array is 
% a structure with the same field names, but the field values can differ.
% 
% Let's create an array of 3 students with fields: Name, ID, and GPA.

students(1).Name = 'Alice';
students(1).ID = 101;
students(1).GPA = 3.8;

students(2).Name = 'Bob';
students(2).ID = 102;
students(2).GPA = 3.5;

students(3).Name = 'Charlie';
students(3).ID = 103;
students(3).GPA = 3.9;
%% 
% Display the array of structures

disp('Structure array "students":')
disp(students)
%% 
% Accessing fields in a structure array

disp('Accessing data from the structure array:')
disp(['Student 1 Name: ', students(1).Name])
disp(['Student 2 GPA: ', num2str(students(2).GPA)])
%% 
% Looping through a structure array

disp('Looping through the structure array to display all names:')
for i = 1:length(students)
    disp(['Student ', num2str(i), ' Name: ', students(i).Name])
end
% Coding Problem 2: Create a Struct Array for Employees
% Define a structure array 'employees' with the following fields:
%% 
% # Name (e.g., 'John Doe')
% # ID (e.g., 12345)
% # Position (e.g., 'Engineer')
% # Salary (e.g., 60000)
%% 
% Add data for at least 3 employees. Then, write a loop to display the names 
% and positions of all employees.
% 
% Solution:

employees(1).Name = 'John Doe';
employees(1).ID = 12345;
employees(1).Position = 'Engineer';
employees(1).Salary = 60000;

employees(2).Name = 'Jane Smith';
employees(2).ID = 12346;
employees(2).Position = 'Manager';
employees(2).Salary = 75000;

employees(3).Name = 'Alice Johnson';
employees(3).ID = 12347;
employees(3).Position = 'Analyst';
employees(3).Salary = 50000;
%% 
% Display the employee names and positions

disp('Employee names and positions:')
for i = 1:length(employees)
    disp([employees(i).Name, ' - ', employees(i).Position])
end
%% 
% Problem: Polygon Collection
% Recall: A polygon is a shape formed by connecting a set of (x,y) points with 
% striaght lines (these lines cannot intersect).  See figure below for 3 examples.
% 
% Create a 1x3 |struct| variable called polygon with the following fields:
%% 
% * |location| - a |struct| that contains the fields: |x_vals| and |y_vals| 
% (list of x and y values of the corners of the polygon)
% * |color| - fill color
% * |center| - the x and y value of the center of the polygon. 
%% 
% Use this figure to define your |location| and |color| fields:
% 
% 
% 
% TASK 1: Preallocate the 1x3 |polygon| struct with some default values for 
% the fields.

polygon(1:3) = struct('location',[],'color','w','center',[]);
%% 
% TASK 2: define |polygon(1)|'s |location| and |color| values.

polygon(1).location.x_vals = [-2 0 1 -2 -2];
polygon(1).location.y_vals = [ 1 1 2  2  1];
polygon(1).color = 'm';
%% 
% TASK 3: define |polygon(2)|'s |location| and |color| values.

polygon(2).location.x_vals = [0 4 4 0];
polygon(2).location.y_vals = [0 0 2 0];
polygon(2).color = 'r';
%% 
% TASK 4: define |polygon(3)|'s |location| and |color| values.

polygon(3).location.x_vals = [-1  0 -1  4  3  4 -1];
polygon(3).location.y_vals = [ 3  4  5  5  4  3  3];
polygon(3).color = 'c';
%% 
% TASK 5: At the bottom of this script, complete the function called |plot_shapes|. 
%% 
% * This function should produce the figure above. 
% * You will also need to compute the center of each polygon in order to plot 
% the number in the center of each shape. 
% * The number in the center corresponds to the shape's index in |polygon|.
% * Use a |for| loop.
%% 
% TASK 6: Call |plot_shapes| to test your function.

plot_shapes(polygon)
%% 
% 

function plot_shapes(polygon)
    
    hold on
    % set axis range, force equal scaling, and turn grid on
    axis([-3 5 -1 6])
    axis equal
    grid on
    
    num_of_polygons = length(polygon);

    for k = 1:num_of_polygons
        % optional: set the x, y and color values for the current polygon
        x_vals = polygon(k).location.x_vals;
        y_vals = polygon(k).location.y_vals;
        color = polygon(k).color;
        
        % plot the polygon
        plot(x_vals, y_vals);
        
        % fill the polygon color
        fill(x_vals, y_vals,color)
        
        % compute the center coordinates of the polygon
        x_center = mean(x_vals(1:end-1));
        y_center = mean(y_vals(1:end-1));
        
        % display the index of the current polygon
        text(x_center,y_center,num2str(k))
    end
    
    hold off
end
% Coding Example 3: Triangle Library (part 1)

triangle_1 = struct('side_lengths', [3, 4, 5], 'area', 0, 'perimeter', 0, 'right', false, 'hypotenuse', 1)
triangle_2 = struct('side_lengths', [86, 44, 57], 'area', 0, 'perimeter', 0, 'right', false, 'hypotenuse', 1)
% Example 1
% Suppose we are writing a program that works with triangles in some way. In 
% this program, we want to be able to store many different properties for each 
% triangle. Rather than making a separate variable for all the properties of every 
% triangle, we create a triangle variable that contain all the values of all of 
% its properties.  
% 
% For example, 
% 
% (a) Create a structure called |triangle_1| using Method 1 that contains the 
% following properties with specified values:
%% 
% * sides (vector) : 3, 4, 5
% * perimeter (number) : 12
% * area (number) : 0
% * hypotenuse (number) : 5
% * is_right (logical) : true
% * is_valid (logical) : true

triangle_1 = struct( ...
    'sides', [3 4 5], ...
    'perimeter', 12, ...
    'area', 0, ...
    'hypotenuse', 5, ...
    'is_right', true, ...
    'is_valid', true ...
    );
%% 
% (b) Create a structure called |triangle_2| using Method 2 that contains the 
% following properties with specified values:
%% 
% * sides (vector) : 86, 44, 57
% * perimeter (number) : 187
% * area (number) : 0
% * hypotenuse (number) : 86
% * is_right (logical) : false
% * is_valid (logical) : true

triangle_2.sides = [86 44 57];
triangle_2.perimeter = 187;
triangle_2.area = 0;
triangle_2.hypotenuse = 86;
triangle_2.is_right = false;
triangle_2.is_valid = true
%% 
% (c) Display these structures

triangle_1
triangle_2
% Example 2
% At the bottom of this script, write a function called |group_triangles| that 
% takes a matrix that contains the side lengths of n triangles, computes the fields 
% specified above and returns the collection in a structure of triangle structures. 
% 
% _Hint: Use Heron's Formula to compute the area_
% 
% $$A=\sqrt{s\left(s-a\right)\left(s-b\right)\left(s-c\right)}$$
% 
% _where_ $a,b,c$_, are the side lengths of the triangle and_ $s$ _is the semi-perimeter:_ 
% $s=\frac{a+b+c}{2}$
% 
% Test your code by typing the following into MATLABs command line.
%%
% 
%   triangle_library = group_triangles([1 2 4; 4 5 3; 24 21 7])
%

triangle_library = group_triangles([1 2 4; 4 5 3; 24 21 7])
triangle_library.triangle_1
triangle_library.triangle_2
triangle_library.triangle_3

function triangle_library = group_triangles(side_lengths)

    small_number = 10*eps;
    n_triangles = height(side_lengths);

    for k = 1:n_triangles

        side_lengths(k, :) = sort(side_lengths(k, :));

        % extract the side lengths
        a = side_lengths(k, 1);
        b = side_lengths(k, 2);
        c = side_lengths(k, 3);
        
        % perimeter calculation
        P = a + b + c;
        
        % area calculation
        s = 0.5*P;
        under_sqrt = s*( s-a )*( s-b )*( s-c );
        A = sqrt( under_sqrt );

        % determine if triangle is a right triangle
        % if-statement version
        if abs(a^2 + b^2 - c^2) < small_number
            right = true;
        else
            right = false;
        end
        % no if-statement version (better)
        right = abs(a^2 + b^2 - c^2) < small_number;

        % determine if triangle is valid
        % if-statement version
        if under_sqrt > 0
            valid = true;
        else
            valid = false;
        end
        % no if-statement version (better)
        valid = under_sqrt > 0;

        triangle_library.(['triangle_' num2str(k)]) = struct( ...
            'sides', [a b c], ...
            'perimeter', P, ...
            'area', A, ...
            'hypotenuse', c, ...
            'is_right', right, ...
            'is_valid', valid ...
            );

    end

end
%% 
%