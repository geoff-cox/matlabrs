%% 
% *Problem 1: Student Gradebook Manager*
% 
% *Objective*: Create a MATLAB program to manage a simple student gradebook 
% using structures.
% 
% *Problem Statement*:
% 
% You are tasked with developing a gradebook for a class. Each student has a 
% name, a student ID, and grades for 3 different assignments. Your job is to:
%% 
% # Create a structure |student| with the following fields:
%% 
% * |Name|: A string representing the student's name.
% * |StudentID|: An integer representing the student's ID.
% * |Grades|: A vector of 3 integers representing the student's grades for the 
% assignments.
%% 
% # Initialize a structure array containing the information of 5 students.
% # Write a function |displayGrades| that takes the structure array as input 
% and prints each student's name, ID, and average grade.
% # Write a function |updateGrade| that allows updating the grade of a particular 
% assignment for a specific student. The function signature should be:
%%
% 
%   function updatedStruct = updateGrade(students, studentID, assignmentNumber, newGrade)
%
%% 
% * |students|: The structure array of students.
% * |studentID|: The ID of the student whose grade needs to be updated.
% * |assignmentNumber|: An integer (1-3) representing which assignment's grade 
% is to be updated.
% * |newGrade|: The new grade for that assignment.

students(1).Name = 'Alice';
students(1).StudentID = 101;
students(1).Grades = [85, 90, 88];

students(2).Name = 'Bob';
students(2).StudentID = 102;
students(2).Grades = [75, 80, 78];

% Use display_grades(students) to show grades
% Use update_grade(students, 102, 2, 85) to update Bob's second assignment
%% 
% *Problem 2: Company Employee Records*
% 
% *Objective*: Develop a structure-based system to manage employee records in 
% a company.
% 
% *Problem Statement*:
% 
% You need to build an employee record management system where each employee 
% has the following information:
%% 
% * |Name|: A string representing the employee's name.
% * |ID|: A unique integer representing the employee's ID.
% * |Position|: A string representing the employee's position (e.g., 'Manager', 
% 'Engineer').
% * |Salary|: A numeric value representing the employee's salary.
% * |YearsOfService|: A numeric value representing how long the employee has 
% been at the company.
%% 
% # Create a structure |employee| with the above fields.
% # Initialize a structure array for at least 4 employees.
% # Write a function |averageSalary| that takes in the structure array of employees 
% and returns the average salary of all employees in the company.
% # Write a function |findEmployeeByID| that takes in the structure array and 
% a specific employee ID, and returns the record (structure) for that employee. 
% If the employee is not found, return an empty structure.
% # Write a function |salaryRaise| that takes the structure array, a specific 
% employee ID, and a percentage, then applies that percentage raise to the employee's 
% salary. The function should return the updated structure array.
%% 
% *Example*:

employee(1).Name = 'John Doe';
employee(1).ID = 123;
employee(1).Position = 'Engineer';
employee(1).Salary = 70000;
employee(1).YearsOfService = 5;

% Use findEmployeeByID(employee, 123) to find John Doe's record
% Use salaryRaise(employee, 123, 10) to raise John's salary by 10%
%% 
% *Problem 3: Weather Data Logger*
% 
% *Objective*: Implement a weather data logger using MATLAB structures to store 
% and manipulate information.
% 
% *Problem Statement*:
% 
% You are designing a system to store and manage weather data for different 
% cities. The data for each city includes:
%% 
% * |City|: A string representing the city name.
% * |Date|: A string in the format |'DD-MM-YYYY'|.
% * |Temperature|: A numeric value representing the average temperature for 
% the day.
% * |Humidity|: A numeric value representing the humidity percentage.
%% 
% # Create a structure |weatherData| with the above fields.
% # Write a function |addEntry| that takes in the structure array, a new city 
% name, date, temperature, and humidity, and adds a new entry to the structure 
% array. The function should return the updated structure array.
% # Write a function |findCityData| that takes in the structure array and a 
% city name, and returns all entries for that city as a structure array.
% # Write a function |maxTemperature| that takes the structure array and returns 
% the city and date with the highest recorded temperature.
%% 
% *Example*:

weatherData(1).City = 'New York';
weatherData(1).Date = '14-09-2024';
weatherData(1).Temperature = 22.5;
weatherData(1).Humidity = 60;

% Use findCityData(weatherData, 'New York') to retrieve all weather entries for New York
% Use maxTemperature(weatherData) to find the city and date with the highest temperature