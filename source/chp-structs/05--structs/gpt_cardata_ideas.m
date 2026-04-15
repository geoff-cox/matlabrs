%% *Programming Assignment: Practice with Struct Objects using |carbig.mat| Dataset*
% In this assignment, you'll practice working with MATLAB's |struct| object 
% using the built-in car dataset |carbig.mat|. The dataset contains various fields 
% related to the specifications of cars, such as model, origin, MPG, and more. 
% You will be writing three functions, each with increasing complexity, to manipulate 
% and analyze this dataset.
%% 
% In this assignment, you'll practice working with MATLAB's |struct| object 
% using the built-in car dataset |carbig.mat|. The dataset contains various fields 
% related to car specifications, such as model, origin, MPG, and more. You will 
% write three functions to manipulate and analyze this dataset using basic struct 
% operations and loops.
% 
% Start by loading the dataset using:

car_data = load('carbig.mat');
%% *Problem 1: Find Cars by Origin*
% *Difficulty*: Easy
% 
% *Function Name*: |filter_cars|
% 
% *Problem Statement*:
% 
% Write a function that returns  . The function should search the |Origin| field 
% for cars from the given country and return the corresponding models from the 
% |Model| field as a character array (not a cell array).
% 
% *Inputs*:
%% 
% * |car_data|: The struct loaded from |carbig.mat|.
% * |origin|: A string representing the country of origin (e.g., |'USA'|, |'Japan'|, 
% |'Germany'|).
%% 
% *Outputs*:
%% 
% * A character array containing the names of car models from the specified 
% origin. Concatenate them into a single string where each model is separated 
% by a comma.
%% 
% *Function Signature*:

function models = findCarsByOrigin(car_data, origin)
%% 
% *Hints*:
%% 
% * Use a loop to go through the |Origin| field.
% * For each match, concatenate the corresponding |Model| field to a single 
% string.
%% 
% *Example*:

models = findCarsByOrigin(car_data, 'USA');
% Expected output: A single string containing the names of all car models from the USA, separated by commas.

%% 
% *Tips:*
% 
% You need to loop through the |Origin| field and check if the |origin| input 
% matches the current car's |Origin|. If it matches, add the corresponding |Model| 
% to a string.
% 
% *Example solution logic:*

function models = findCarsByOrigin(car_data, origin)
    models = '';
    for i = 1:length(car_data.Origin)
        if strcmp(strtrim(car_data.Origin(i, :)), origin)
            models = [models, strtrim(car_data.Model(i, :)), ', '];
        end
    end
    % Remove the trailing comma and space
    if ~isempty(models)
        models(end-1:end) = [];
    end
end
%% *Problem 2: Calculate Average MPG for a Given Year*
% *Difficulty*: Medium
% 
% *Function Name*: |averageMPGByYear|
% 
% *Problem Statement*:
% 
% Write a function that calculates the average miles per gallon (MPG) for all 
% cars from a specific model year. The function should search the |Model_Year| 
% field, find all cars from the given year, and compute the average MPG from the 
% |MPG| field.
% 
% *Inputs*:
%% 
% * |car_data|: The struct loaded from |carbig.mat|.
% * |year|: A scalar integer representing the model year (e.g., |1970|, |1980|).
%% 
% *Outputs*:
%% 
% * A scalar double representing the average MPG of all cars from the specified 
% year. If no cars are found from that year, the function should return |NaN|.
%% 
% *Function Signature*:

function avgMPG = averageMPGByYear(car_data, year)
%% 
% *Hints*:
%% 
% * Use a loop to iterate over the |Model_Year| field.
% * Accumulate the MPG values for cars that match the given year.
% * Keep track of how many cars match the year and use this count to compute 
% the average.
%% 
% *Example*:

avgMPG = averageMPGByYear(car_data, 1970);
% Expected output: A scalar double representing the average MPG for cars from the year 1970.

%% 
% *Tips:*
% 
% You need to loop through the |Model_Year| field, collect the |MPG| values 
% for cars that match the given year, and compute the average.
% 
% *Example solution logic:*

function avgMPG = averageMPGByYear(car_data, year)
    totalMPG = 0;
    count = 0;
    for i = 1:length(car_data.Model_Year)
        if car_data.Model_Year(i) == year
            totalMPG = totalMPG + car_data.MPG(i);
            count = count + 1;
        end
    end
    
    if count == 0
        avgMPG = NaN;  % No cars from that year
    else
        avgMPG = totalMPG / count;
    end
end
%% *Problem 3: Find the Lightest Car by Origin and Year*
% *Difficulty*: Hard
% 
% *Function Name*: |lightestCar|
% 
% *Problem Statement*:
% 
% Write a function that finds the lightest car for a specific origin and model 
% year. The function should search the |Origin| field for cars from the given 
% country, filter them by the specified year in the |Model_Year| field, and then 
% find the car with the lowest weight (from the |Weight| field). The function 
% should return the car's model name and its weight.
% 
% *Inputs*:
%% 
% * |car_data|: The struct loaded from |carbig.mat|.
% * |origin|: A string representing the country of origin (e.g., |'USA'|, |'Japan'|, 
% |'Germany'|).
% * |year|: A scalar integer representing the model year (e.g., |1970|, |1980|).
%% 
% *Outputs*:
%% 
% * A string representing the model name of the lightest car from the specified 
% origin and year.
% * A scalar double representing the weight of the lightest car.
%% 
% *Function Signature*:

function [lightestModel, lightestWeight] = lightestCar(car_data, origin, year)
%% 
% *Hints*:
%% 
% * Use a loop to search both the |Origin| and |Model_Year| fields.
% * Keep track of the current lightest car as you go through the list. Update 
% the lightest car and its weight whenever you find a lighter car that matches 
% the criteria.
%% 
% *Example*:

[lightestModel, lightestWeight] = lightestCar(car_data, 'Japan', 1975);
% Expected output: A string representing the model of the lightest car from Japan in 1975,
% and its corresponding weight as a scalar double.

%% 
% *Tips:*
% 
% You need to loop through both the |Origin| and |Model_Year| fields, keeping 
% track of the lightest car that matches both the origin and year. Compare the 
% weights to find the minimum.
% 
% *Example solution logic:*

function [lightestModel, lightestWeight] = lightestCar(car_data, origin, year)
    lightestWeight = inf;
    lightestModel = '';
    
    for i = 1:length(car_data.Origin)
        if strcmp(strtrim(car_data.Origin(i, :)), origin) && car_data.Model_Year(i) == year
            if car_data.Weight(i) < lightestWeight
                lightestWeight = car_data.Weight(i);
                lightestModel = strtrim(car_data.Model(i, :));
            end
        end
    end
    
    if isempty(lightestModel)
        lightestModel = 'No car found';  % Handle case where no car matches the criteria
        lightestWeight = NaN;
    end
end
%% *Problem 4*: Aggregate Structure
% Write a function that creates a new structure that summarizes the car data 
% based on the country of origin. For each origin (e.g., |'USA'|, |'Japan'|, |'Germany'|), 
% the function should create a field in the new structure with the following aggregated 
% information:
%% 
% * |AverageMPG|: The average MPG of all cars from that country.
% * |TotalCars|: The total number of cars from that country.
% * |AverageWeight|: The average weight of all cars from that country.
%% 
% The structure should be organized by the country of origin, with each country's 
% name as a field. Each field contains a sub-structure with the three aggregated 
% fields mentioned above.*Inputs:*
%% 
% * |car_data|: The struct loaded from |carbig.mat|.
%% 
% *Outputs:*
%% 
% * A structure where each field is named after a country of origin, and each 
% field contains another structure with fields:
% * |AverageMPG|: Average miles per gallon for that country.
% * |TotalCars|: Total number of cars from that country.
% * |AverageWeight|: Average weight of cars from that country.
%% 
% *Function Signature:*

    function summary = summarizeByOrigin(car_data)
%% 
% *Example Output Structure:*
% 
% The returned structure will have a form similar to:
%%
% 
%   summary = 
%   
%     struct with fields:
%   
%       USA: [1×1 struct]
%       Japan: [1×1 struct]
%       Germany: [1×1 struct]
%       ...
%
%% 
% Where each field (e.g., |summary.USA|) contains a structure like:
%%
% 
%   summary.USA =
%   
%     struct with fields:
%   
%       AverageMPG: 20.5
%       TotalCars: 150
%       AverageWeight: 3000
%
%% 
% *Hints:*
%% 
% * Use a loop to iterate through all entries in the |Origin| field of the |car_data| 
% structure.
% * Use a simple string comparison (|strcmp|) to match origins.
% * Maintain running totals for MPG, weight, and count of cars for each country.
% * After the loop, compute the average MPG and weight for each origin.
%% 
% *Expected Solution Outline:*

function summary = summarizeByOrigin(car_data)
    % Initialize unique origins (hard-coded for simplicity, or could be extracted dynamically)
    origins = {'USA', 'Japan', 'Germany', 'France', 'Italy', 'Sweden', 'England'};
    
    % Initialize summary structure
    summary = struct();
    
    % Loop through each origin
    for j = 1:length(origins)
        origin = origins{j};
        
        % Initialize variables to aggregate data
        totalMPG = 0;
        totalWeight = 0;
        count = 0;
        
        % Loop through the car data to find matches for this origin
        for i = 1:length(car_data.Origin)
            if strcmp(strtrim(car_data.Origin(i, :)), origin)
                totalMPG = totalMPG + car_data.MPG(i);
                totalWeight = totalWeight + car_data.Weight(i);
                count = count + 1;
            end
        end
        
        % Calculate the averages if there are cars from this origin
        if count > 0
            avgMPG = totalMPG / count;
            avgWeight = totalWeight / count;
        else
            avgMPG = NaN;
            avgWeight = NaN;
        end
        
        % Store the results in the summary structure
        summary.(origin) = struct('AverageMPG', avgMPG, 'TotalCars', count, 'AverageWeight', avgWeight);
    end
end
%% 
% *Explanation:*
%% 
% # *Origins List*: We start by defining a list of unique car origins. This 
% could be dynamically extracted from the data, but for simplicity, it's hard-coded.
% # *Loop Through Origins*: For each origin (e.g., |'USA'|, |'Japan'|), we loop 
% through all the cars in |car_data.Origin| and check if the current car matches 
% the origin.
% # *Aggregation*: As we loop through the cars, we accumulate the total |MPG|, 
% total |Weight|, and count the number of cars for each origin.
% # *Average Calculations*: After looping through all cars, we compute the average 
% MPG and average weight for each country.
% # *Structure Assignment*: The computed values (average MPG, total number of 
% cars, and average weight) are stored in a sub-structure for each country.