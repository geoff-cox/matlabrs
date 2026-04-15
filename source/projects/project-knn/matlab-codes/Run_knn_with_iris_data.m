close all; clear all; clc;
load fisheriris

shuffle_data = randperm(150); % random shuffling of 1,2,3,...,150 

num_of_labeled_data = 130;  % pick the number of data points with labels
                            % must be between 1 and 149

labels(150,1) = ' ';
for k = 1:150
    if strcmp(species(k),'setosa')
        labels(k) = 'A';
    elseif strcmp(species(k),'virginica')
        labels(k) = 'B';
    else
        labels(k) = 'C';
    end
end

X_L = meas(shuffle_data(1:num_of_labeled_data),3);
Y_L = meas(shuffle_data(1:num_of_labeled_data),4);
L = labels(shuffle_data(1:num_of_labeled_data));

X_U = meas(shuffle_data(num_of_labeled_data+1:150),3);
Y_U = meas(shuffle_data(num_of_labeled_data+1:150),4);
U = labels(shuffle_data(num_of_labeled_data+1:150));

data_L = [X_L Y_L];
data_U = [X_U Y_U];

k = 5; % k value to use (you can change this)

new_labels_Key = KNN_Key(k,data_L,L,data_U);

%---------------------------------------------------
% Replace "Key" with your last name here            
new_labels_Student = KNN_Key(k,data_L,L,data_U);  
%---------------------------------------------------

results = table(new_labels_Key,new_labels_Student,U,...
            'VariableNames',{'predicted_Key','predicted_Student','actual'});

fprintf('         Test Script for your KNN program\n')
fprintf('====================================================\n')
disp(results)

fprintf('The first and second columns should be identical.\n\n')

fprintf('The boxed labels in the graph are the predicted labels that\n')
fprintf('your code produced.\n\n')

if sum(new_labels_Key ~= new_labels_Student) == 0
    fprintf('Good, your code output matches mine!\n\n')
else
    fprintf('Hmmm... Your code output doesn''t match with mine.\n')
end

x_1 = X_L(strcmp(cellstr(L),'A'));
y_1 = Y_L(strcmp(cellstr(L),'A'));
s_1 = X_U(strcmp(cellstr(new_labels_Student),'A'));
t_1 = Y_U(strcmp(cellstr(new_labels_Student),'A'));

x_2 = X_L(strcmp(cellstr(L),'B'));
y_2 = Y_L(strcmp(cellstr(L),'B'));
s_2 = X_U(strcmp(cellstr(new_labels_Student),'B'));
t_2 = Y_U(strcmp(cellstr(new_labels_Student),'B'));

x_3 = X_L(strcmp(cellstr(L),'C'));
y_3 = Y_L(strcmp(cellstr(L),'C'));
s_3 = X_U(strcmp(cellstr(new_labels_Student),'C'));
t_3 = Y_U(strcmp(cellstr(new_labels_Student),'C'));

plot(x_1,y_1,'w.');hold on;
plot(x_2,y_2,'w.');
plot(x_3,y_3,'w.');

text(x_1,y_1,'A','Color','b','HorizontalAlignment', 'center', ...
                             'VerticalAlignment', 'middle')
text(x_2,y_2,'B','Color','r','HorizontalAlignment', 'center', ...
                             'VerticalAlignment', 'middle')
text(x_3,y_3,'C','Color','k','HorizontalAlignment', 'center', ...
                             'VerticalAlignment', 'middle')
plot(s_1,t_1,'Square','MarkerSize',16,'Color','b');hold on;
text(s_1,t_1,'A','Color','b','HorizontalAlignment', 'center', ...
                             'VerticalAlignment', 'middle')
plot(s_2,t_2,'Square','MarkerSize',16,'Color','r');hold on;
text(s_2,t_2,'B','Color','r','HorizontalAlignment', 'center', ...
                             'VerticalAlignment', 'middle')
plot(s_3,t_3,'Square','MarkerSize',16,'Color','k');hold on;
text(s_3,t_3,'C','Color','k','HorizontalAlignment', 'center', ...
                             'VerticalAlignment', 'middle')
hold off;
