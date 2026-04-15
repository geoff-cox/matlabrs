% Below are the functions (with pseudocode) that you will need in your 
% Whack-A-Mole Problem.
%
% =========== Helper Functions (Private) ===========
%
% ** Note: These functions should be added in the Code Browser Section of 
%          the App Designer under the Functions tab.
%          The function title and end lines will be added by default. You 
%          must adjust inputs and outputs as needed.
% 
% function playLoop(app)
    % level = get level
    % waves = get max number of waves
    % initialize current wave = 1
    % while wave <= waves
    	% display current wave
    	% MoleLocation = get random mole pop up spot
        % show Mole (function)
    	% give the playersome time to hit the mole
        % remove Mole (function);
    	% short break between pop ups
        % wave = add 1 to wave value
    % end while
% end playLoop
        
% function showMole(app,loc)
	% Enable Button @ loc (function)
    % Set Icon of Button @ loc to MoleFace Pic using a switch statement
% end showMole

% function removeMole(app,loc)
	% Remove Icon from Button @ loc using a switch statement
    % Disable Button @ loc (function)
% end removeMole
    
% function disableButtons(app)
    % Disable all 9 Buttons
% end disableButtons

% function enableAButton(app,loc)
    % Enable Button @ loc using a switch statement
% end enableAButton

% =========== App Interaction Codes ===========
%
% ** Note: These functions should be added in the App Designer. You can 
%          right-click the appropriate object to add the callback function 
%          to your code view.to generate under the Functions tab.

% Button pushed function: QuitButton
    % close app

% Button pushed function: PlayButton
    % Set default wave value on app = 1
    % Set default score value on app = 0
    % Disable all buttons
    % Put "Get Ready" message on the center button
    % Wait 2 seconds
    % Remove "Get Ready" message
    % Enter Play Loop
% end PlayButton code

% Button pushed function: Button_? (Same for all mole space buttons)
    % get current score
    % if Whack A Mole Face Icon is on this button
        % Increase score by 1
        % Dispay new score on App
    % end if
% end Button_? code