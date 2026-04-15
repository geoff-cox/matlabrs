%% Tic-Tac-Toe Full Game with Graphical Interface
clc; close all;
%% ------ Set initial game variables






%% ------ Display welcome message
fprintf('\n INSERT MESSAGE HERE\n\n');

% ------ Ask pre-game questions using the "input" command
% Q: How many players (0,1,2)
% if A = 0: 
%   Q1: What is the AI level of player, X? (1,2,3)
%   Q2: What is the AI level of player, O? (1,2,3)
% if A = 1: 
%   Q1: Would you like to be player X (move 1st) or O?
%   Q2: What AI level would you like to play against? (1,2,3)
% if A = 2 or any other value: 
%   no questions, just start the game.


















%% ------ Display blank game GUI
figure('Position',[100,100,650,600]);
axis([0 5 0 5]); 
axis equal;
plot([2 2],[1 4],'k',[3 3],[1 4],'k',[1 4],[2 2],'k',[1 4],[3 3],'k','LineWidth',3); hold on;
ax = gca; ax.XColor = 'none'; ax.YColor = 'none';
        
%% ------ Game loop










%% ------ Display result in title of the figure


%% END OF SCRIPT

%% ------------------------------------------------------
%  ---------- PASTE ALL HELPER FUNCTIONS BELOW ----------
