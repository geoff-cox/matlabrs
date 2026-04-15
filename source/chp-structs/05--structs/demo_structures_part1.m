%% Structures
%% 
% A structure in MATLAB is a data type that allows us to store data of different 
% types, like numbers, strings, and arrays, all under one object. We access the 
% data by referencing the field names.
% 
% For further information see MATLAB's documentation page here:     <https://www.mathworks.com/help/matlab/ref/struct.html 
% https://www.mathworks.com/help/matlab/ref/struct.html>
%% Part 1: Structure Variables
% Creating a Structure Variable
% Let |S| be a structure variable. |S| contains "fields" and "values". Think 
% of a "field" as a variable inside |S| that contains information about |S|.  
% A "value" of |S| is the actual information.
% 
% There are two common ways to create a structure. 
% 
% Method 1: Use the |struct| command.
%%
% 
%   S = struct( 'field_1' , value_1 , 'field_2' , value_2 , 'field_3' , value_3)
%
%% 
% _NOTE: This method requires that the field names be in quotes._
% 
% Method 2: Use the "dot" separator.
%%
% 
%   S.field_1 = value_1
%   S.field_2 = value_2
%   S.field_3 = value_3
%
%% 
% _OR_
%%
% 
%   S.('field_1') = value_1
%   S.('field_2') = value_2
%   S.('field_3') = value_3
%
%% 
% _NOTE: You only need the second type (with quotes) when all or part of your 
% field names are contained in a variable. For example,_
%%
% 
%   fname = 'field_1'
%   i = 3;
%   S.(fname) = value_1 % <--------- same as S.field_1 = value_1
%   S.(['field_' num2str(i)]) = value_3 % <-- same as S.field_3 = value_3
%
%% 
% Each method produces the same structure.
% 
% Using different methods (described above), define the structures, |person_1|, 
% |person_2|, and |person_3| that contain the fields and values listed in the 
% table below.
%% 
% Variable
%% 
% Name
%% 
% Age (yrs)
%% 
% Height (ft)
%% 
% |person_1|
%% 
% Alice
%% 
% 25
%% 
% 5.68
%% 
% |person_2|
%% 
% Ben
%% 
% 32
%% 
% 4.90
%% 
% |person_3|
%% 
% Sunil
%% 
% 18
%% 
% 6.14

person_1 = struct('Name', 'Alice', 'Age', 25, 'Height', 5.68);

person_2.Name = 'Ben';         
person_2.Age = 32;               
person_2.Height = 4.90;

vars = ['Age'; 'Hei'; 'ght'];
person_3.('Name') = 'Sunil';
person_3.(vars(1,:)) = 18; % <---------------- same as person_3.('Age') = 18
person_3.([vars(2,:) vars(3,:)]) = 6.14; % <-- same as person_3.('Height') = 6.14
%% 
% Display |person_1|, |person_2|, and |person_3|.

disp(person_1)
disp(person_2)
disp(person_3)
% Accessing Structure Values
% You access the values in a structure using the dot separator.
% 
% Access the age of |person_1|, the name of |person_2|, and the height of |person_3|.

person_1.Age
person_2.Name
person_3.Height
% Coding Example 1: List Information
% Given a list of numbers, write a function returns a structure that contains 
% the following information about the list.
%% 
% 
%% 
% name
%% 
% size
%% 
% type
%% 
% description
%% 
% inputs:
%% 
% list
%% 
% 1xN
%% 
% double
%% 
% row vector of numbers
%% 
% outputs:
%% 
% list_info
%% 
% 1x1
%% 
% struct
%% 
% structure containing the fields:
%% 
% 
%% 
% 
%% 
% 
%% 
% 
%% 
% - |n| (int): number of values
%% 
% 
%% 
% 
%% 
% 
%% 
% 
%% 
% - |m| (double): min value
%% 
% 
%% 
% 
%% 
% 
%% 
% 
%% 
% - |M| (double): max value
%% 
% 
%% 
% 
%% 
% 
%% 
% 
%% 
% - |sorted| (bool): |true (1)| if the list is sorted. Otherwise, |false (0)|
%% 
% 

function list_info = get_list_info(list)
    % set n
    n = length(list);
    
    % initialize m, M, & sorted
    m = list(1);
    M = list(1);
    sorted = true;

    % determine m, M, & sorted
    for k = 2:length(list)
        % update m?
        if list(k) < m
            m = list(k);
        end
        % update M?
        if list(k) > M
            M = list(k);
        end
        % update sorted?
        if list(k-1) > list(k)
            sorted = false;
        end
    end

    % create the list_info structure
    list_info.n = n;
    list_info.m = m;
    list_info.M = M;
    list_info.sorted = sorted;
end
%% 
% Test the function.

list_info_1 = get_list_info([-11.02 5.3 -2.0 5.3 4.09 5.3])
list_info_2 = get_list_info([1 1 1 1 1 1 1 1])
% Coding Example 2: Car Data
% Task 1: Load the Data
% Load MATLAB's built-in car data:

car_data = load('carbig.mat');
% Task 2: Explore the Data
% What type of value is in the variable |car_data|?

class(car_data)
%% 
% What are the fields of |car_data|?

fields(car_data)
%% 
% Display the values in the model and year fields. 

disp([car_data.Model, num2str(car_data.Model_Year)])
%% 
% How many cars are in the data set?

n_cars = length(car_data.Model)
% Task 3: Print Out a List of Models
% Given the structure of car dataand a target miles per gallon (MPG) rating, 
% write a function that returns a character array containing the models of cars 
% from 1980 that an MPG rating less than the target value.
%% 
% 
%% 
% name
%% 
% size
%% 
% type
%% 
% description
%% 
% inputs:
%% 
% |car_data|
%% 
% |1x1|
%% 
% |struct|
%% 
% MATLAB's built-in car data set from |'carbig.mat'|.
%% 
% 
%% 
% |target_mpg|
%% 
% |1x1|
%% 
% |double|
%% 
% the maximum mpg rating for all cars from 1980.
%% 
% outputs:
%% 
% |models|
%% 
% |MxN|
%% 
% |char|
%% 
% character array containing the models of cars that had an mpg rating less 
% than |target_mpg|.
%% 
% 

function print_models_below_mpg(data, target_mpg)
    % Extract the model, year, and mpg data
    models = data.Model;
    years = data.Model_Year;
    mpgs = data.MPG;
    
    % Print a header statement
    fprintf('1980 Car Models with an MPG under: %i \n\n', target_mpg)
    % Print the desired models
    for k = 1:length(models)
        
        if years(k) == 80 && mpgs(k) < target_mpg
            fprintf('  Model: %20s  MPG: %6g \n', models(k,:), mpgs(k))
        end

    end
end
%% 
% Test the function.

car_data = load('carbig.mat');
print_models_below_mpg(car_data, 30);
print_models_below_mpg(car_data, 25);
print_models_below_mpg(car_data, 5);