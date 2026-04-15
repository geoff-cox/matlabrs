%% Demo - Structures and Plotting
% MATLAB |struct (|short for structure) objects provide a nice way to group 
% multiple variables together that are related in some way.
% 
% For further information see MATLAB's documentation page here:     <https://www.mathworks.com/help/matlab/ref/struct.html 
% https://www.mathworks.com/help/matlab/ref/struct.html>
%% Defining a Structure Variable
% Let S be a structure variable. S contains "fields" and "values". Think of 
% a "field" as a variable inside S that contains information about S.  A "value" 
% of S is the actual information.
% 
% There are two common ways to create a structure. 
% 
% Method 1: Use the |struct| command.
%%
% 
%   
%
%% 
% _NOTE: The field names must be in quotes for this method_
% 
% Method 2: Use the "dot" separator
%%
% 
%   
%   
%   
%
%% 
% _NOTE: The field names are not in quotes for this method, but you can use 
% quotes as below. This method is useful when your field names are variable (e.g., 
% determined with a loop)._
%%
% 
%   
%   
%   
%
%% 
% All of these methods produce the exact same structure.
%% Example 1
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




%% 
% (c) Display these structures



%% Example 2
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
% Test your code by running the following command:

triangle_library = group_triangles([1 2 4; 4 5 3; 24 21 7])
%%
function triangle_library = group_triangles(side_lengths)

    % get the number of triangles

    % Loop over each triangle (i.e. row of side_lengths)

        % sort the current triangle side lengths (i.e. current row)
        
        % extract the side lengths into a, b, and c to simplify coding
        
        % perimeter calculation
        
        % area calculation
        
        % determine if triangle is a right triangle
        % if-statement version
        
        % no if-statement version (better)
        
        % determine if triangle is valid
        % if-statement version
        
        % no if-statement version (better)
        
        % add this triangle structure to the triangle library structure
    
end