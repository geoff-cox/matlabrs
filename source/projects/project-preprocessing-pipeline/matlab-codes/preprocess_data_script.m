% Example dataset as a table
dataTable = table([1; 4; 7], NaN(3,1), [3; NaN; 9], {'red'; 'blue'; 'green'}, ...
    'VariableNames', {'Col1', 'Col2', 'Col3', 'Color'});

% Specify the categorical column names
categoricalCols = {'Color'}; 

% Call the preprocessing function
cleanedData = preprocess_data(dataTable, categoricalCols);

% Display the preprocessed data
disp(cleanedData);

function preprocessedData = preprocess_data(dataTable, categoricalCols, threshold)
    % Preprocesses the data in a table by handling missing values, removing outliers,
    % normalizing numeric data, and encoding categorical variables.

    if nargin < 3
        threshold = 3; % Default Z-score threshold for outlier removal
    end
    
    % Step 1: Handle missing values
    dataTable = fillMissingWithMean(dataTable);
    
    % Step 2: Remove outliers
    dataTable = removeOutliers(dataTable, threshold);
    
    % Step 3: Normalize numeric data
    numericCols = setdiff(dataTable.Properties.VariableNames, categoricalCols);
    dataTable(:, numericCols) = normalizeData(dataTable(:, numericCols));
    
    % Step 4: Encode categorical variables
    dataTable = encodeCategoricalData(dataTable, categoricalCols);
    
    % Return preprocessed data
    preprocessedData = dataTable;
end

function dataTable = fillMissingWithMean(dataTable)
    % Replaces missing values (NaN) in numeric columns with the column mean.
    
    varNames = dataTable.Properties.VariableNames;
    
    for i = 1:length(varNames)
        column = dataTable.(varNames{i});
        if isnumeric(column)  % Check if the column is numeric
            meanValue = mean(column, 'omitnan');
            column(isnan(column)) = meanValue;
            dataTable.(varNames{i}) = column;
        end
    end
end

function cleanedData = removeOutliers(data, threshold)
    % Removes rows that contain outliers based on Z-score threshold.
    
    if nargin < 2
        threshold = 3; % Default threshold
    end
    
    zScores = (data - mean(data, 'omitnan')) ./ std(data, 'omitnan');
    cleanedData = data(all(abs(zScores) < threshold, 2), :);
end

function normalizedData = normalizeData(data)
    % Normalizes numeric data using min-max normalization.
    
    minVal = min(data);
    maxVal = max(data);
    normalizedData = (data - minVal) ./ (maxVal - minVal);
end

function data = encodeCategoricalData(data, categoricalCols)
    % Encodes categorical data using one-hot encoding.
    
    for col = categoricalCols
        categoricalColumn = data(:, col);
        uniqueCategories = unique(categoricalColumn);
        
        % Create an empty array to hold the encoded data
        encodedCols = zeros(size(data, 1), length(uniqueCategories));
        
        % Perform one-hot encoding
        for i = 1:length(uniqueCategories)
            encodedCols(:, i) = strcmp(categoricalColumn, uniqueCategories{i});
        end
        
        % Remove the original categorical column and add the encoded columns
        data(:, col) = [];
        data = [data, encodedCols];
    end
end
