close all; clear all; clc;
load carbig

filter_nan = find(...
      (~isnan(Horsepower))...
      .*...
      (~isnan(Acceleration))...
      .*...
      (~isnan(MPG))...
      .*...
      (~isnan(Weight))...
      .*...
      (~isnan(Cylinders))...
      .*...
      (~isnan(Displacement))...
    );

HP = Horsepower(filter_nan);
AC = Acceleration(filter_nan);
MPG = MPG(filter_nan);
WT = Weight(filter_nan);
CY = Cylinders(filter_nan);
DP = Displacement(filter_nan);

%data_features = [Horsepower Weight];
%data_features = [Horsepower MPG];
%data_features = [Horsepower Acceleration];
%data_features = [Weight MPG];
%data_features = [Weight Acceleration];
%data_features = [MPG Acceleration];
data_features = [HP AC MPG WT CY DP];
data_features = data_features(:,[1 6]);
data_labels = num2str(Cylinders(filter_nan,1));

% data_labels = data_labels(data_labels ~= 'E');
% data_features = data_features(data_labels ~= 'E');

% data_features = data_features(data_labels ~= 'U');
% data_labels = data_labels(data_labels ~= 'U');

N = size(data_features,1);
shuffle_index = randperm(N);

data_features = data_features(shuffle_index,:);
data_labels = data_labels(shuffle_index);

N_L = round(0.5*N);

X_L = data_features(1:N_L,:);
Y_L = data_labels(1:N_L);

X_U = data_features(N_L+1:end,:);
Y_U = data_labels(N_L+1:end);

k = 5; % k value to use (you can change this)

[new_labels_Key,label_map_Key] = KNN_Key(k,X_L,Y_L,X_U);

%---------------------------------------------------
% Replace "Key" with your last name here            
[Stud_labs,labels] = KNN_Key(k,X_L,Y_L,X_U);  
%---------------------------------------------------

results = table(Stud_labs,Y_U,Stud_labs==Y_U,...
            'VariableNames',{'P','A','result'});

fprintf('         Test Script for your KNN program\n')
fprintf('====================================================\n')
disp(results)

fprintf('The first and second columns should be identical.\n\n')

fprintf('The boxed labels in the graph are the predicted labels that\n')
fprintf('your code produced.\n\n')

if sum(new_labels_Key ~= Stud_labs) == 0
    fprintf('Good, your code output matches mine!\n\n')
else
    fprintf('Hmmm... Your code output doesn''t match with mine.\n')
end
correct = Y_U == Stud_labs;
incorrect = Y_U ~= Stud_labs;
score = sum(correct);
fprintf('Here is your score: %3.0f out of %3.0f = %3.2f %%\n\n',score,N-N_L,score/(N-N_L)*100)
fprintf('Incorrect: U -> E = %3.2f %%\n\n',sum(Stud_labs(Y_U == 'U') == 'E')/(N-N_L-score)*100)
fprintf('Incorrect: U -> J = %3.2f %%\n\n',sum(Stud_labs(Y_U == 'U') == 'J')/(N-N_L-score)*100)
fprintf('Incorrect: J -> U = %3.2f %%\n\n',sum(Stud_labs(Y_U == 'J') == 'U')/(N-N_L-score)*100)
fprintf('Incorrect: J -> E = %3.2f %%\n\n',sum(Stud_labs(Y_U == 'J') == 'E')/(N-N_L-score)*100)
fprintf('Incorrect: E -> U = %3.2f %%\n\n',sum(Stud_labs(Y_U == 'E') == 'U')/(N-N_L-score)*100)
fprintf('Incorrect: E -> J = %3.2f %%\n\n',sum(Stud_labs(Y_U == 'E') == 'J')/(N-N_L-score)*100)

% for k = 1:numel(labels)
%     x{k} = X_L(strcmp(cellstr(Y_L),labels(k)),1);
%     y{k} = X_L(strcmp(cellstr(Y_L),labels(k)),2);
%     s{k} = X_U(strcmp(cellstr(new_labels_Student),labels(k)),1);
%     t{k} = X_U(strcmp(cellstr(new_labels_Student),labels(k)),2);
% end
% 
% hold on;
% % plot(x{2},y{2},'bo');
% % plot(x{3},y{3},'rx');
% % plot(x{4},y{4},'k.','LineWidth',10);
% % plot(x{5},y{5},'rx');
% % plot(x{6},y{6},'rx');
% 
% label_map_Key
% colors = ['r' 'g' 'b' 'k'];
% for k = 1:numel(labels)
%     plot(x{k},y{k},'.','Color',colors(k),'MarkerSize',18);
% %     text(x{k},y{k},labels(k),'Color','b','HorizontalAlignment', 'center', ...
% %                              'VerticalAlignment', 'middle')
% %     
% %     text(s{k},t{k},Y_U(k),'Color','b','HorizontalAlignment', 'center', ...
% %                              'VerticalAlignment', 'middle')
% %     plot(s{k},t{k},'Square','MarkerSize',16,'Color','b');
% end
% legend(label_map_Key)
% hold off;
