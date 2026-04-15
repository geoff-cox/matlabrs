% Here we discuss a way to clean up the code by adding an 
% app object (property) that stores the mole space buttons in an array.
% This will allow us to remove all the swtich statements.
%
% The first step is to add this new object to the app. Go to "Code View".
% Then click on the "Properties" tab in the "Code Broswer". Click the "+"
% to add an array called "MoleButtons".
%
% We then store the buttons into MoleButtons in a special function that
% gets called when the App is run. To add this special function to your code
% view, right-click on the App background and 
% select > Callbacks > Add StartupFcn
%
% =========== Helper Functions (Private) ===========
% 
% function playLoop(app) 
    % NO CHANGE
        
% function showMole(app,loc)
	% Enable Button @ loc (function)
    % Set Icon of Button @ loc to MoleFace Pic using MoleButtons Array
% end showMole

% function removeMole(app,loc)
	% Remove Icon from Button @ loc using MoleButtons Array
    % Disable Button @ loc (function)
% end removeMole
    
% function disableButtons(app,loc)
    % Use nargin to make the 2nd input optional.
    % If 2 inputs are entered, disable only the Button @ loc
    % Else disable all 9 Buttons
% end disableButtons

% function enableAButton(app,loc)
    % Enable Button @ loc using MoleButtons Array
% end enableAButton

% =========== App Interaction Codes ===========
%
% ** Note: The startupFcn should now be present in this section if followed
%          the directions above. 

% function startupFcn(app)
%     Add each Button to MoleButtons Array using
%               app.MoleButtons{i}=app.Button_i; for all 9 buttons
% end startupFnc Code

% Button pushed function: QuitButton
    % NO CHANGE

% Button pushed function: PlayButton
    % NO CHANGE
% end PlayButton code

% Button pushed function: Button_? (Same for all mole space buttons)
    % NO CHANGE
% end Button_? code