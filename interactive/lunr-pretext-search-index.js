var ptx_lunr_search_style = "textbook";
var ptx_lunr_docs = [
{
  "id": "preface",
  "level": "1",
  "url": "preface.html",
  "type": "Preface",
  "number": "",
  "title": "Preface",
  "body": "  HI    Textbook Aim & Scope  HI    Intended Audience  HI    Philosophy  HI    Textbook Structure and Approach  HI    Using this Book  Mention the interactive features and how to use and not to use them...  Other mentions...    "
},
{
  "id": "getting-matlab",
  "level": "1",
  "url": "getting-matlab.html",
  "type": "Section",
  "number": "1.1",
  "title": "Installing MATLAB",
  "body": " Installing MATLAB  MATLAB is a professional computing environment developed by MathWorks. Before you can begin using it, you must install MATLAB on your computer using a licensed MathWorks account.  The current version of MATLAB is R2025b . The steps below describe a typical installation process. Screens and options may vary slightly depending on your operating system.  Go to mathworks.com .  Click Sign In in the top-right corner.  If you do not already have an account, create one using your VMI email address.  After signing in, click MATLAB and then Install MATLAB .  Select your operating system from the dropdown menu.  Download and launch the installer.  When prompted, sign in using the same MathWorks account.  Accept the license agreement.  Select the VMI-issued license when it appears.  Use the default installation location and pre-selected products unless instructed otherwise.  Choose whether to create desktop shortcuts and allow data collection.  Click Begin Install and wait for the installation to complete.    Once installation is complete, you should be able to launch MATLAB from your applications menu or desktop shortcut. The first launch may ask you to sign in again to verify your license.  Once MATLAB is installed, you are ready to explore the MATLAB Desktop and begin working interactively. In the next section, you will see the panels that make up the desktop layout.   "
},
{
  "id": "desktop",
  "level": "1",
  "url": "desktop.html",
  "type": "Subsection",
  "number": "",
  "title": "Main Components",
  "body": " Main Components  When MATLAB opens, the screen is divided into panels. Each panel has a specific role in how you interact with MATLAB. Although the layout can be customized, the following components are essential.   Files  Shows the current working directory. Files you create or save are placed here by default.    Command Window  The Command Window is where you enter commands at the prompt >> . MATLAB evaluates each command when you press Enter .    Workspace  Displays variables currently stored in memory, including their names, sizes, and values.    Editor  Used to write, edit, and debug MATLAB programs and scripts.      Main components of the MATLAB Desktop.      Which MATLAB panel shows the variables currently stored in memory?    Files  Workspace  Editor  Command Window    "
},
{
  "id": "desktop-3",
  "level": "2",
  "url": "desktop.html#desktop-3",
  "type": "Figure",
  "number": "1.1",
  "title": "",
  "body": " Main components of the MATLAB Desktop.   "
},
{
  "id": "desktop-chkpt-1",
  "level": "2",
  "url": "desktop.html#desktop-chkpt-1",
  "type": "Checkpoint",
  "number": "1.2",
  "title": "",
  "body": "  Which MATLAB panel shows the variables currently stored in memory?    Files  Workspace  Editor  Command Window   "
},
{
  "id": "toggling-components",
  "level": "1",
  "url": "toggling-components.html",
  "type": "Subsection",
  "number": "",
  "title": "Modifying the Layout",
  "body": " Modifying the Layout  The MATLAB Desktop is customizable. Panels can be shown, hidden, or rearranged to suit your workflow.   Toggling panels on and off in the MATLAB Desktop.    The sidebars on the left, right, and bottom of the desktop display the tools docked there. Use them to show or hide panels, drag panel title bars to reposition them, and open additional tools with the Open more panels button.  In this chapter, you will work interactively in the Command Window. The next section introduces variables, which help you store and reuse the results of those commands.  "
},
{
  "id": "toggling-components-3",
  "level": "2",
  "url": "toggling-components.html#toggling-components-3",
  "type": "Figure",
  "number": "1.3",
  "title": "",
  "body": " Toggling panels on and off in the MATLAB Desktop.   "
},
{
  "id": "basic-calculations",
  "level": "1",
  "url": "basic-calculations.html",
  "type": "Subsection",
  "number": "",
  "title": "Basic Calculations",
  "body": " Basic Calculations  You can use the Command Window as a calculator by entering expressions and pressing Enter .   2 + 3   MATLAB displays the result using the default variable name ans . To keep a result for later, assign it to a variable (introduced next).  ans = 5  MATLAB also includes built-in mathematical constants and functions.   pi sin(pi\/2)   ans = 3.1416 ans = 1    When you enter an expression without assigning it to a variable, how does MATLAB store the result?     It stores the result in the variable ans .    It permanently saves the result to a file.    It discards the result immediately.    It replaces the contents of the workspace.     "
},
{
  "id": "cmdwin-chkpt-1",
  "level": "2",
  "url": "basic-calculations.html#cmdwin-chkpt-1",
  "type": "Checkpoint",
  "number": "1.4",
  "title": "",
  "body": "  When you enter an expression without assigning it to a variable, how does MATLAB store the result?     It stores the result in the variable ans .    It permanently saves the result to a file.    It discards the result immediately.    It replaces the contents of the workspace.    "
},
{
  "id": "command-window-utility",
  "level": "1",
  "url": "command-window-utility.html",
  "type": "Subsection",
  "number": "",
  "title": "Keeping the Command Window Organized",
  "body": " Keeping the Command Window Organized  As you work in the Command Window, MATLAB keeps a history of commands and output, and it stores variables in the workspace. Several built-in commands help you keep your session organized.   clear clc format short      clear removes all variables from the workspace.   clc clears the Command Window display.   format controls how numerical output is displayed (but not how it is stored).    These commands do not permanently undo work, but they do reset your current session. When results seem confusing, using clear and starting fresh is often helpful. As your work grows, you'll move repeated command sequences into scripts for easy reuse.    Which command clears variables from memory without closing MATLAB?    clear  clc  format  exit     "
},
{
  "id": "cmdwin-chkpt-2",
  "level": "2",
  "url": "command-window-utility.html#cmdwin-chkpt-2",
  "type": "Checkpoint",
  "number": "1.5",
  "title": "",
  "body": "  Which command clears variables from memory without closing MATLAB?    clear  clc  format  exit   "
},
{
  "id": "matlab-variables-defining",
  "level": "1",
  "url": "matlab-variables-defining.html",
  "type": "Subsection",
  "number": "",
  "title": "Creating Variables",
  "body": " Creating Variables  You create a variable using the assignment operator , written as = . The general form is   variableName = value   When MATLAB executes an assignment:  The expression on the right-hand side is evaluated first.  The resulting value is stored under the name on the left-hand side.  The variable name appears in the Workspace after the line runs.    Define the variables a and b with values 1 and 7.8 .   a = 1 b = 7.8   After running these commands:  The variables a and b exist in the workspace.  Their values are displayed in the Command Window.      Ending a command with a semicolon suppresses output in the Command Window, but still creates the variable. This keeps intermediate calculations from cluttering your screen.   c = -0.101 d = 88;   Both variables are stored in the workspace, but only c is displayed.    What effect does ending a MATLAB assignment with a semicolon have?     The variable is not created in the workspace.    The variable is created, but its value is not displayed in the Command Window.    The variable is created with no value.    The assignment only applies to the current line of code.     "
},
{
  "id": "matlab-variables-defining-2",
  "level": "2",
  "url": "matlab-variables-defining.html#matlab-variables-defining-2",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "assignment operator "
},
{
  "id": "matlab-variables-defining-5",
  "level": "2",
  "url": "matlab-variables-defining.html#matlab-variables-defining-5",
  "type": "🌌 Example",
  "number": "1.6",
  "title": "",
  "body": "  Define the variables a and b with values 1 and 7.8 .   a = 1 b = 7.8   After running these commands:  The variables a and b exist in the workspace.  Their values are displayed in the Command Window.     "
},
{
  "id": "vars-chkpt-1",
  "level": "2",
  "url": "matlab-variables-defining.html#vars-chkpt-1",
  "type": "Checkpoint",
  "number": "1.7",
  "title": "",
  "body": "  What effect does ending a MATLAB assignment with a semicolon have?     The variable is not created in the workspace.    The variable is created, but its value is not displayed in the Command Window.    The variable is created with no value.    The assignment only applies to the current line of code.    "
},
{
  "id": "matlab-variables-using",
  "level": "1",
  "url": "matlab-variables-using.html",
  "type": "Subsection",
  "number": "",
  "title": "Using and Reassigning Variables",
  "body": " Using and Reassigning Variables  Variables are typically used to build expressions that depend on previously defined values. This lets you update one input and quickly recompute the output.    Suppose a triangle has base length 4 and height 10 . Define variables for the base and height, and then compute the area.   base = 4; height = 10; area = 0.5 * base * height;   The variable area is created with value 20 .    Variables can be reassigned at any time. When this happens, the previous value is overwritten.   base = height;   This command copies the current value of height into base . The value of height itself is unchanged.  In MATLAB, the symbol = does not represent a mathematical equation. It represents an instruction to store a computed value:   VARIABLE_NAME = EXPRESSION     After computing a variable using other variables, why does changing one of those original variables not automatically update the result?     MATLAB stores the computed value, not the formula used to compute it.    MATLAB only updates variables when semicolons are omitted.    MATLAB prevents dependent variables from changing.    MATLAB assumes variables represent algebraic equations.       Suppose you run the following commands in MATLAB:   base = 4; height = 10; area = 0.5 * base * height;   Next, you run the commands:   height = base; height = 6;   Give the resulting value of each variable:    base =   height =   area =         .* Incorrect     .* Incorrect     .* Incorrect     "
},
{
  "id": "matlab-variables-using-3",
  "level": "2",
  "url": "matlab-variables-using.html#matlab-variables-using-3",
  "type": "🌌 Example",
  "number": "1.8",
  "title": "",
  "body": "  Suppose a triangle has base length 4 and height 10 . Define variables for the base and height, and then compute the area.   base = 4; height = 10; area = 0.5 * base * height;   The variable area is created with value 20 .   "
},
{
  "id": "vars-chkpt-2",
  "level": "2",
  "url": "matlab-variables-using.html#vars-chkpt-2",
  "type": "Checkpoint",
  "number": "1.9",
  "title": "",
  "body": "  After computing a variable using other variables, why does changing one of those original variables not automatically update the result?     MATLAB stores the computed value, not the formula used to compute it.    MATLAB only updates variables when semicolons are omitted.    MATLAB prevents dependent variables from changing.    MATLAB assumes variables represent algebraic equations.    "
},
{
  "id": "vars-chkpt-3",
  "level": "2",
  "url": "matlab-variables-using.html#vars-chkpt-3",
  "type": "Checkpoint",
  "number": "1.10",
  "title": "",
  "body": "  Suppose you run the following commands in MATLAB:   base = 4; height = 10; area = 0.5 * base * height;   Next, you run the commands:   height = base; height = 6;   Give the resulting value of each variable:    base =   height =   area =         .* Incorrect     .* Incorrect     .* Incorrect    "
},
{
  "id": "naming-variables",
  "level": "1",
  "url": "naming-variables.html",
  "type": "Subsection",
  "number": "",
  "title": "Naming Variables",
  "body": " Naming Variables   Valid Names  MATLAB imposes specific rules on variable names:  The name must start with a letter.  It may contain letters, digits, and underscores.  It cannot be a MATLAB keyword.  It cannot exceed 2048 characters.    Things to note about MATLAB variables:  Variable names are case sensitive, so A and a are different variables.  There are 20 keywords that can be listed with the iskeyword command.     MATLAB keywords listed from iskeyword    function  if  else  elseif  end    try  switch  case  otherwise  catch    for  while  break  continue  return    classdef  parfor  persistent  spmd  global       Select all the valid variable names.      x6   6x  x_6   x.6     _lastValue  lastValue_  n_factorial   n!    iskeyword  pi   end         Choosing Good Names  In practice, variable names should clearly describe the data they store. Descriptive names improve readability and reduce errors.  Once you begin writing scripts, good names make your code easier to read later and share with others.   price = 3.11; tankCapacity = 15; fullTankCost = price * tankCapacity;     What is the primary advantage of using descriptive variable names in MATLAB code?     They make code easier to read, understand, and debug.    They make MATLAB run faster.    They prevent variables from being overwritten.    They allow MATLAB to automatically document the code.      "
},
{
  "id": "matlab-keywords",
  "level": "2",
  "url": "naming-variables.html#matlab-keywords",
  "type": "Table",
  "number": "1.11",
  "title": "MATLAB keywords listed from <code class=\"code-inline tex2jax_ignore language-matlab\">iskeyword<\/code>",
  "body": " MATLAB keywords listed from iskeyword    function  if  else  elseif  end    try  switch  case  otherwise  catch    for  while  break  continue  return    classdef  parfor  persistent  spmd  global    "
},
{
  "id": "vars-chkpt-4",
  "level": "2",
  "url": "naming-variables.html#vars-chkpt-4",
  "type": "Checkpoint",
  "number": "1.12",
  "title": "",
  "body": "  Select all the valid variable names.      x6   6x  x_6   x.6     _lastValue  lastValue_  n_factorial   n!    iskeyword  pi   end      "
},
{
  "id": "vars-chkpt-5",
  "level": "2",
  "url": "naming-variables.html#vars-chkpt-5",
  "type": "Checkpoint",
  "number": "1.13",
  "title": "",
  "body": "  What is the primary advantage of using descriptive variable names in MATLAB code?     They make code easier to read, understand, and debug.    They make MATLAB run faster.    They prevent variables from being overwritten.    They allow MATLAB to automatically document the code.    "
},
{
  "id": "matlab-variables-6",
  "level": "1",
  "url": "matlab-variables-6.html",
  "type": "Subsection",
  "number": "",
  "title": "Common Beginner Mistakes",
  "body": " Common Beginner Mistakes  When first using MATLAB, it is common to encounter confusing results due to a few predictable mistakes.  Forgetting that MATLAB executes commands in the order they are run, not the order they appear on the screen.  Assuming MATLAB automatically updates previously computed values when a variable changes.  Leaving old variables in the workspace and unintentionally reusing them.  Interpreting the symbol = as a mathematical equation rather than an assignment.    Nearly all of these issues can be resolved by clearing the workspace and re-running commands in a logical order. The next section shows how scripts let you save that logical order as reusable code.  "
},
{
  "id": "programming-with-scripts",
  "level": "1",
  "url": "programming-with-scripts.html",
  "type": "Subsection",
  "number": "",
  "title": "Programming with Scripts",
  "body": " Programming with Scripts  Scripts are a first step toward thinking programmatically: instead of typing commands one at a time in the Command Window, you write a repeatable recipe that you can run again and again to get the same results. This also helps you organize work into clear stages: define inputs, perform computations, and display results.   A Generic MATLAB Script   % Script: example_script.m % Purpose: Demonstrate a repeatable sequence of commands. % 1) Set up a clean run clc; clear; % 2) Define inputs (numbers you choose) input1 = 10; input2 = 3; % 3) Compute results result = input1^2 + 2*input2; % 4) Display final results fprintf('Result = %g\\n', result);     Running a Script  When you run a script, MATLAB executes the commands in order, starting at the top and skipping over comments (i.e., lines that begin with % ). This is why the order of your commands matters.   A script shares the same workspace as the Command Window. That means variables created in the script appear in the Workspace after the script runs, and existing variables in the Workspace can affect a script if you rely on them. This is why scripts often begin with clear to avoid old values.  Later, we will introduce functions , which take inputs and produce outputs in separate workspaces. For now, scripts help us practice building a correct sequence of commands.  "
},
{
  "id": "programming-with-scripts-3",
  "level": "2",
  "url": "programming-with-scripts.html#programming-with-scripts-3",
  "type": "Listing",
  "number": "2.1",
  "title": "A Generic MATLAB Script",
  "body": " A Generic MATLAB Script   % Script: example_script.m % Purpose: Demonstrate a repeatable sequence of commands. % 1) Set up a clean run clc; clear; % 2) Define inputs (numbers you choose) input1 = 10; input2 = 3; % 3) Compute results result = input1^2 + 2*input2; % 4) Display final results fprintf('Result = %g\\n', result);   "
},
{
  "id": "programming-with-scripts-6",
  "level": "2",
  "url": "programming-with-scripts.html#programming-with-scripts-6",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "functions "
},
{
  "id": "matlab-fprintf",
  "level": "1",
  "url": "matlab-fprintf.html",
  "type": "Subsection",
  "number": "",
  "title": "Printing Results with <code class=\"code-inline tex2jax_ignore language-matlab\">fprintf<\/code>",
  "body": " Printing Results with fprintf  Scripts often need to communicate results to a user. The simplest way to do this is to type a variable name or use disp . For more polished output, use the fprintf command.  The fprintf command is a very useful tool for sending messages to the Command Window from your program. The general pattern is:   fprintf('text with placeholders', value1, value2, ...);   The placeholders start with a percent sign and indicate how MATLAB should display each value. Here are the most common ones:  %i for integers (whole numbers)  %f for decimal (fixed-point) numbers  %g for a compact numeric format (often a good default)  %s for text    You can control rounding by specifying the number of digits after the decimal point. For example, %.2f prints two digits after the decimal.   r = 4.5; C = 2*pi*r; A = pi*r^2; fprintf('Radius r = %.2f\\n', r); fprintf('Circumference C = %.3f\\n', C); fprintf('Area A = %.3f\\n', A);   Two special characters are especially common in formatted output:  \\n starts a new line  \\t inserts a tab     x = 12; y = 3.4567; fprintf('x:\\t%d\\n', x); fprintf('y:\\t%.2f\\n', y);   You can also control spacing with a field width . For example, %8.2f uses a field that is 8 characters wide. This helps align columns.   a = 2; b = -4; c = -6; fprintf('Coefficients:\\n'); fprintf('%8s %8s %8s\\n', 'a', 'b', 'c'); fprintf('%8d %8d %8d\\n', a, b, c);   To print a percent sign, use %% .   p = 0.237; fprintf('Success rate: %.1f%%\\n', 100*p);   The activities below use fprintf . Before moving on, paste these examples into MATLAB to become more familiar with the command.  "
},
{
  "id": "matlab-fprintf-10",
  "level": "2",
  "url": "matlab-fprintf.html#matlab-fprintf-10",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "field width "
},
{
  "id": "matlab-scripts-5",
  "level": "1",
  "url": "matlab-scripts-5.html",
  "type": "🧑🏻‍💻 Class Activities",
  "number": "",
  "title": "🧑🏻‍💻 Class Activities",
  "body": "  As you practice writing scripts, notice the repeated pattern: choose inputs, compute results, and report output. In the next step, functions will let us package that pattern into reusable tools that can accept inputs and return outputs.    Circle Report Script   Write a script that computes the circumference and area of a circle from its radius, then prints a formatted report.     Create a new script and add clc and clear at the top.     clc; clear;       Define a radius variable r (starting with ).     % Selected Value r = 4.5;       Compute the circumference and area .     % Computations C = 2*pi*r; A = pi*r^2;       Print a clean report with three decimal places.     % Display Results fprintf('Circle report\\n'); fprintf('Radius: %.3f\\n', r); fprintf('Circumference: %.3f\\n', C); fprintf('Area: %.3f\\n', A);       Change r to a new value (such as ) and run again.    Your script should automatically update the report whenever you change the input.      Temperature Conversion Script   The conversion formula between Fahrenheit and Celsius is: Write a script that converts a temperature from Fahrenheit to Celsius and use fprintf to print some relevant messages to the command window.     Create a new script and add clc and clear at the top.     clc; clear;       Define a variable tempF for the temperature in Fahrenheit and start it at F.     % Selected Values tempF = 77;       Compute the corresponding Celsius temperature and print both values using fprintf , rounding to one decimal place.     % Computation tempC = (tempF - 32) * (5\/9); % Display results fprintf('Temperature: %.1f F = %.1f C\\n', tempF, tempC);       Rerun the script with different temperatures (e.g., F, F).    Your output should show F corresponds to approximately C, and F corresponds to approximately C.      Projectile Height Script   A projectile's height at time seconds is given by the formula: , with parameters:  is the initial height (in meters),  is the initial velocity (in meters per second), and  m\/s 2 is the acceleration due to gravity.    Write a script that computes the height of a projectile at any given time.     Create a new script and add clc and clear at the top.     clc; clear;       Define the model parameters. Use an initial height of meters and an initial velocity of m\/s.     % Selected Values h0 = 1.5; v0 = 12; g = 9.81;       Compute the height h at time t = 0.8 .     % Computation (height formula) t = 0.8; h = h0 + v0*t - 0.5*g*t^2;       Compute the time of maximum height and the maximum height .  Recall that the peak occurs when the velocity is zero, i.e., when . Do the calculus to find the formula for .     % compute tPeak and h(tPeak) tPeak = v0\/g; hMax = h0 + v0*tPeak - 0.5*g*tPeak^2;       Print a report showing t , h , tPeak , and hMax (2-decimal places).     % Display Results fprintf('Projectile report\\n'); fprintf('At t = %.2f s, height h = %.2f m\\n', t, h); fprintf('Peak occurs at t = %.2f s, max height = %.2f m\\n', tPeak, hMax);   Running this should display the following in the Command Window:   Projectile report At t = 0.80 s, height h = 7.96 m Peak occurs at t = 1.22 s, max height = 8.84 m       Rerun your script with (i) t = 0 and (ii) t = tPeak .    Part (i) should display:   Projectile report At t = 0.00 s, height h = 1.50 m Peak occurs at t = 1.22 s, max height = 8.84 m   Part (ii) should display:   Projectile report At t = 1.22 s, height h = 8.84 m Peak occurs at t = 1.22 s, max height = 8.84 m       Piggy Bank Script   Create a script that performs the following tasks.     Create a new script. At the very top, add clc and clear so each run starts with a clean state.    Add the following lines to the top of your script:   % (a) Add clc and clear clc; % Clear the Command Window clear; % Clear the workspace       Suppose your piggy bank has the following number of coins:  87 pennies  113 nickels  13 dimes  233 quarters  Inside the script, define a variable for the quantity of each type of coin.    Add the following lines to your script:   % (b) Inputs: quantity of each type of coin nPennies = 87; nNickels = 113; nDimes = 13; nQuarters = 233;       In the same script, compute the worth (in cents) of each type of coin, and then compute the total value of all the coins.    Add the following lines to your script:   % (c) Computations: values in cents pValue = nPennies; % 1 cent each nValue = 5 * nNickels; dValue = 10 * nDimes; qValue = 25 * nQuarters; totalCents = pValue + nValue + dValue + qValue;       Display the total value of all the coins using the fprintf command.    Add the following lines to your script:   % (d) Display the total value in cents fprintf('Total value (in cents): %i cents\\n', totalCents);       Save the script as piggy_bank_counter.m . Run the script to test it and see the output.    The output in the Command Window should be:   Total value (in cents): 6607 cents       Finally, compute  the total value (in dollars)  the number of dollars  the left-over cents  and run the script again to display these values.   Hint: After getting the total value in dollars, use MATLAB's floor function to round the dollar amount down to the nearest whole number to get the number of dollars.     Add the following lines to your script:   % (f) Convert to dollars and print the dollars and cents totalDollars = totalCents\/100; nDollars = floor(totalDollars); nCents = totalCents - nDollars * 100; fprintf('Total value (in dollars): %i dollars and %i cents\\n', nDollars, nCents);   The output in the Command Window should be:   Total value (in dollars): 66 dollars and 7 cents       Solving a Quadratic Equation   The solution to the quadratic equation of the form: is given by the quadratic formula: .  An important part of this formula is the value under the square root, called the discriminant , given by: . Knowing the discriminant tells you the nature of the solutions:  If is positive, there are two distinct real solutions.  If is zero, there is exactly one real (repeated) solution.  If is negative, the solutions are complex numbers.  For example, the equation has  coefficients , , and , and  discriminant , which is positive.  So there are two distinct real solutions given by: . Write a script that uses the quadratic formula to solve a quadratic equation.     Create a new script file and add the following to the top:  % This script uses the quadratic formula to solve an equation of the form: % % a*x^2 + b*x + c = 0 % % where a, b, and c are given. clc; clear;  This ensures each run starts from a clean state.    Add the following lines to the top of your script:   % (a) Add clc and clear clc; % Clear the Command Window clear; % Clear the workspace       Define variables a , b , and c in your script to represent the coefficients of any possible quadratic equation.  As a starting point, use the values in the example above.    Add the following lines to your script:   % (b) Set a, b, and c (example: x^2 + x - 6 = 0) a = 1; b = 1; c = -6;       Using these variables, compute  the discriminant and  the solutions to the quadratic equation.      Add the following lines to your script:   % (c) Compute the discriminant and the two solutions discriminant = b^2 - 4*a*c; x1 = (-b + sqrt(discriminant)) \/ (2*a); x2 = (-b - sqrt(discriminant)) \/ (2*a);       Display the two solutions using fprintf and disp (for the solutions).    Add the following lines to your script:   % (d) Print a short report fprintf('\\n'); fprintf('Solving the equation:\\n'); fprintf(' %g x^2 + %g x + %g = 0\\n\\n', a, b, c); fprintf('Discriminant: %g\\n', discriminant); fprintf('Solutions:\\n'); fprintf(' x1 = '); disp(x1); fprintf(' x2 = '); disp(x2);       Save the script as quadratic_solver.m and run it to make sure it works.    The output in the Command Window should be:   Solutions: x1 = 2 x2 = -3       Change the values of a , b , and c to solve the equation . Run the script again to see the new solutions.    Update the coefficient definitions in your script as follows:   % (f) Update coefficients for new equation a = 2; b = -4; c = -6;   The output in the Command Window should be:   Solutions: x1 = 3 x2 = -1       Change the values of a , b , and c to solve the equation . Run the script again to see the new solutions.    Update the coefficient definitions in your script as follows:   % (g) Update coefficients for new equation a = 1; b = 2; c = 5;   The output in the Command Window should be:   Solutions: x1 = -1.0000 + 2.0000i x2 = -1.0000 - 2.0000i       The previous example shows that our script can handle complex solutions.  Are there any quadratic equations that our script cannot handle? If so, give an example and explain why the script fails.    The script fails when a = 0 , because the quadratic formula divides by . For example, the equation corresponds to a = 0 , and then the expressions (2*a) in the denominator become zero.  A more robust solver would first check whether a is zero, and if so, switch to solving a linear equation. Making that kind of decision requires flow control, which we will study later.     "
},
{
  "id": "script-circle-report",
  "level": "2",
  "url": "matlab-scripts-5.html#script-circle-report",
  "type": "Reading Question",
  "number": "1",
  "title": "Circle Report Script.",
  "body": " Circle Report Script   Write a script that computes the circumference and area of a circle from its radius, then prints a formatted report.     Create a new script and add clc and clear at the top.     clc; clear;       Define a radius variable r (starting with ).     % Selected Value r = 4.5;       Compute the circumference and area .     % Computations C = 2*pi*r; A = pi*r^2;       Print a clean report with three decimal places.     % Display Results fprintf('Circle report\\n'); fprintf('Radius: %.3f\\n', r); fprintf('Circumference: %.3f\\n', C); fprintf('Area: %.3f\\n', A);       Change r to a new value (such as ) and run again.    Your script should automatically update the report whenever you change the input.    "
},
{
  "id": "script-temp-converter",
  "level": "2",
  "url": "matlab-scripts-5.html#script-temp-converter",
  "type": "Reading Question",
  "number": "2",
  "title": "Temperature Conversion Script.",
  "body": " Temperature Conversion Script   The conversion formula between Fahrenheit and Celsius is: Write a script that converts a temperature from Fahrenheit to Celsius and use fprintf to print some relevant messages to the command window.     Create a new script and add clc and clear at the top.     clc; clear;       Define a variable tempF for the temperature in Fahrenheit and start it at F.     % Selected Values tempF = 77;       Compute the corresponding Celsius temperature and print both values using fprintf , rounding to one decimal place.     % Computation tempC = (tempF - 32) * (5\/9); % Display results fprintf('Temperature: %.1f F = %.1f C\\n', tempF, tempC);       Rerun the script with different temperatures (e.g., F, F).    Your output should show F corresponds to approximately C, and F corresponds to approximately C.    "
},
{
  "id": "script-projectile-height",
  "level": "2",
  "url": "matlab-scripts-5.html#script-projectile-height",
  "type": "Reading Question",
  "number": "3",
  "title": "Projectile Height Script.",
  "body": " Projectile Height Script   A projectile's height at time seconds is given by the formula: , with parameters:  is the initial height (in meters),  is the initial velocity (in meters per second), and  m\/s 2 is the acceleration due to gravity.    Write a script that computes the height of a projectile at any given time.     Create a new script and add clc and clear at the top.     clc; clear;       Define the model parameters. Use an initial height of meters and an initial velocity of m\/s.     % Selected Values h0 = 1.5; v0 = 12; g = 9.81;       Compute the height h at time t = 0.8 .     % Computation (height formula) t = 0.8; h = h0 + v0*t - 0.5*g*t^2;       Compute the time of maximum height and the maximum height .  Recall that the peak occurs when the velocity is zero, i.e., when . Do the calculus to find the formula for .     % compute tPeak and h(tPeak) tPeak = v0\/g; hMax = h0 + v0*tPeak - 0.5*g*tPeak^2;       Print a report showing t , h , tPeak , and hMax (2-decimal places).     % Display Results fprintf('Projectile report\\n'); fprintf('At t = %.2f s, height h = %.2f m\\n', t, h); fprintf('Peak occurs at t = %.2f s, max height = %.2f m\\n', tPeak, hMax);   Running this should display the following in the Command Window:   Projectile report At t = 0.80 s, height h = 7.96 m Peak occurs at t = 1.22 s, max height = 8.84 m       Rerun your script with (i) t = 0 and (ii) t = tPeak .    Part (i) should display:   Projectile report At t = 0.00 s, height h = 1.50 m Peak occurs at t = 1.22 s, max height = 8.84 m   Part (ii) should display:   Projectile report At t = 1.22 s, height h = 8.84 m Peak occurs at t = 1.22 s, max height = 8.84 m     "
},
{
  "id": "script-piggy-bank",
  "level": "2",
  "url": "matlab-scripts-5.html#script-piggy-bank",
  "type": "Reading Question",
  "number": "4",
  "title": "Piggy Bank Script.",
  "body": " Piggy Bank Script   Create a script that performs the following tasks.     Create a new script. At the very top, add clc and clear so each run starts with a clean state.    Add the following lines to the top of your script:   % (a) Add clc and clear clc; % Clear the Command Window clear; % Clear the workspace       Suppose your piggy bank has the following number of coins:  87 pennies  113 nickels  13 dimes  233 quarters  Inside the script, define a variable for the quantity of each type of coin.    Add the following lines to your script:   % (b) Inputs: quantity of each type of coin nPennies = 87; nNickels = 113; nDimes = 13; nQuarters = 233;       In the same script, compute the worth (in cents) of each type of coin, and then compute the total value of all the coins.    Add the following lines to your script:   % (c) Computations: values in cents pValue = nPennies; % 1 cent each nValue = 5 * nNickels; dValue = 10 * nDimes; qValue = 25 * nQuarters; totalCents = pValue + nValue + dValue + qValue;       Display the total value of all the coins using the fprintf command.    Add the following lines to your script:   % (d) Display the total value in cents fprintf('Total value (in cents): %i cents\\n', totalCents);       Save the script as piggy_bank_counter.m . Run the script to test it and see the output.    The output in the Command Window should be:   Total value (in cents): 6607 cents       Finally, compute  the total value (in dollars)  the number of dollars  the left-over cents  and run the script again to display these values.   Hint: After getting the total value in dollars, use MATLAB's floor function to round the dollar amount down to the nearest whole number to get the number of dollars.     Add the following lines to your script:   % (f) Convert to dollars and print the dollars and cents totalDollars = totalCents\/100; nDollars = floor(totalDollars); nCents = totalCents - nDollars * 100; fprintf('Total value (in dollars): %i dollars and %i cents\\n', nDollars, nCents);   The output in the Command Window should be:   Total value (in dollars): 66 dollars and 7 cents     "
},
{
  "id": "script-quadratic",
  "level": "2",
  "url": "matlab-scripts-5.html#script-quadratic",
  "type": "Reading Question",
  "number": "5",
  "title": "Solving a Quadratic Equation.",
  "body": " Solving a Quadratic Equation   The solution to the quadratic equation of the form: is given by the quadratic formula: .  An important part of this formula is the value under the square root, called the discriminant , given by: . Knowing the discriminant tells you the nature of the solutions:  If is positive, there are two distinct real solutions.  If is zero, there is exactly one real (repeated) solution.  If is negative, the solutions are complex numbers.  For example, the equation has  coefficients , , and , and  discriminant , which is positive.  So there are two distinct real solutions given by: . Write a script that uses the quadratic formula to solve a quadratic equation.     Create a new script file and add the following to the top:  % This script uses the quadratic formula to solve an equation of the form: % % a*x^2 + b*x + c = 0 % % where a, b, and c are given. clc; clear;  This ensures each run starts from a clean state.    Add the following lines to the top of your script:   % (a) Add clc and clear clc; % Clear the Command Window clear; % Clear the workspace       Define variables a , b , and c in your script to represent the coefficients of any possible quadratic equation.  As a starting point, use the values in the example above.    Add the following lines to your script:   % (b) Set a, b, and c (example: x^2 + x - 6 = 0) a = 1; b = 1; c = -6;       Using these variables, compute  the discriminant and  the solutions to the quadratic equation.      Add the following lines to your script:   % (c) Compute the discriminant and the two solutions discriminant = b^2 - 4*a*c; x1 = (-b + sqrt(discriminant)) \/ (2*a); x2 = (-b - sqrt(discriminant)) \/ (2*a);       Display the two solutions using fprintf and disp (for the solutions).    Add the following lines to your script:   % (d) Print a short report fprintf('\\n'); fprintf('Solving the equation:\\n'); fprintf(' %g x^2 + %g x + %g = 0\\n\\n', a, b, c); fprintf('Discriminant: %g\\n', discriminant); fprintf('Solutions:\\n'); fprintf(' x1 = '); disp(x1); fprintf(' x2 = '); disp(x2);       Save the script as quadratic_solver.m and run it to make sure it works.    The output in the Command Window should be:   Solutions: x1 = 2 x2 = -3       Change the values of a , b , and c to solve the equation . Run the script again to see the new solutions.    Update the coefficient definitions in your script as follows:   % (f) Update coefficients for new equation a = 2; b = -4; c = -6;   The output in the Command Window should be:   Solutions: x1 = 3 x2 = -1       Change the values of a , b , and c to solve the equation . Run the script again to see the new solutions.    Update the coefficient definitions in your script as follows:   % (g) Update coefficients for new equation a = 1; b = 2; c = 5;   The output in the Command Window should be:   Solutions: x1 = -1.0000 + 2.0000i x2 = -1.0000 - 2.0000i       The previous example shows that our script can handle complex solutions.  Are there any quadratic equations that our script cannot handle? If so, give an example and explain why the script fails.    The script fails when a = 0 , because the quadratic formula divides by . For example, the equation corresponds to a = 0 , and then the expressions (2*a) in the denominator become zero.  A more robust solver would first check whether a is zero, and if so, switch to solving a linear equation. Making that kind of decision requires flow control, which we will study later.    "
},
{
  "id": "scripts-cqs",
  "level": "1",
  "url": "scripts-cqs.html",
  "type": "Exercises",
  "number": "",
  "title": "🤔💭 Conceptual Questions",
  "body": " 🤔💭 Conceptual Questions    Running a Script   When you run a MATLAB script, MATLAB executes commands:      in a random order based on variable names      from top to bottom in the order they appear      from bottom to top      only on lines that end with semicolons       Workspace Connection   A script runs in its own private workspace, separate from the Command Window.    Scripts share the base workspace with the Command Window, so variables can persist between runs unless you clear them.     Semicolons   Ending a line with a semicolon prevents that line's result from automatically printing in the Command Window.    Semicolons prevent intermediate computations from cluttering the output, making the final results easier to read.     Finding a Script   If MATLAB says it cannot find your script, the most likely issue is that:      The script is not in the Current Folder      You forgot to use clc at the top      You used fprintf instead of display      Your script contains comments       Match the Commands   Drag the commands to their purpose.     clear  Clears variables from the Workspace    clc  Clears text from the Command Window    fprintf  Displays text to the Command Window    remove  del       In MATLAB, a comment line begins with the symbol .       .*  Incorrect.       "
},
{
  "id": "script-ckpts",
  "level": "2",
  "url": "scripts-cqs.html#script-ckpts",
  "type": "Exercise",
  "number": "1",
  "title": "",
  "body": "  Running a Script   When you run a MATLAB script, MATLAB executes commands:      in a random order based on variable names      from top to bottom in the order they appear      from bottom to top      only on lines that end with semicolons       Workspace Connection   A script runs in its own private workspace, separate from the Command Window.    Scripts share the base workspace with the Command Window, so variables can persist between runs unless you clear them.     Semicolons   Ending a line with a semicolon prevents that line's result from automatically printing in the Command Window.    Semicolons prevent intermediate computations from cluttering the output, making the final results easier to read.     Finding a Script   If MATLAB says it cannot find your script, the most likely issue is that:      The script is not in the Current Folder      You forgot to use clc at the top      You used fprintf instead of display      Your script contains comments       Match the Commands   Drag the commands to their purpose.     clear  Clears variables from the Workspace    clc  Clears text from the Command Window    fprintf  Displays text to the Command Window    remove  del       In MATLAB, a comment line begins with the symbol .       .*  Incorrect.      "
},
{
  "id": "programming-with-functions",
  "level": "1",
  "url": "programming-with-functions.html",
  "type": "Subsection",
  "number": "",
  "title": "Programming with Functions",
  "body": " Programming with Functions  Functions help you package a useful calculation into a reusable tool. Instead of rewriting the same computations in many scripts, you write them once as a function and then call that function whenever you need it.  Here is an example of a simple function that computes the perimeter of a square given its side length.   MATLAB Function with 1 Input and 1 Output   function perimeter = square_perimeter(side) % Use the input (side) to compute the output (perimeter) perimeter = 4 * side; end    To use this function, save it in a file named square_perimeter.m . Then, in the Command Window (or in another script), call the function by providing an input value inside parentheses. For example, to compute the perimeter of a square with side length 5, type:   p = square_perimeter(5) % returns 20 and stores it in variable p   MATLAB will run the commands inside the function, using the input value you provided ( 5 ) to compute the output value ( 20 ). The result is then returned to the Command Window and stored in the variable p .  "
},
{
  "id": "programming-with-functions-4",
  "level": "2",
  "url": "programming-with-functions.html#programming-with-functions-4",
  "type": "Listing",
  "number": "2.3",
  "title": "MATLAB Function with 1 Input and 1 Output",
  "body": " MATLAB Function with 1 Input and 1 Output   function perimeter = square_perimeter(side) % Use the input (side) to compute the output (perimeter) perimeter = 4 * side; end   "
},
{
  "id": "writing-functions",
  "level": "1",
  "url": "writing-functions.html",
  "type": "Subsection",
  "number": "",
  "title": "Writing Functions",
  "body": " Writing Functions  To create a function in MATLAB, you start by opening a new function file. Here is an example of a function that computes the perimeter of a rectangle given its two sides.   MATLAB Function with 2 Inputs and 1 Output   function perimeter = rectangle_perimeter(side1, side2) % Use the inputs (side1 and side2) % to compute the output (perimeter) perimeter = 2 * side1 + 2 * side2; end    The first line of the function file is the function header , which defines the function's name, inputs, and outputs. For example, in the function above, the line   function perimeter = rectangle_perimeter(side1, side2)   declares a function named rectangle_perimeter that takes two inputs ( side1 and side2 ) and returns one output ( perimeter ).  When you save the function, the function name should match the file name (without the .m extension). In this example, the function is named rectangle_perimeter , so the file should be saved as rectangle_perimeter.m .   Where to save your function file  For MATLAB to find your function, save the .m file in the Current Folder (or in a folder on the MATLAB path). If MATLAB says it cannot find your function, this is the first thing to check.   Inside the function, you can use the input variables to perform calculations and assign values to the output variable. When the function is called, MATLAB executes the commands in the function file and returns the output value. Unlike scripts, intermediate variables stay inside the function unless you return them.  To call this function, provide two input values inside parentheses. For example, to compute the perimeter of a rectangle with side lengths 4 and 7, type:   p = rectangle_perimeter(4, 7) % returns 22 & stores it in p   MATLAB will run the commands inside the function, using the input values you provided ( 4 and 7 ) to compute the output value ( 22 ). The result is then returned to the Command Window and stored in the variable p .  "
},
{
  "id": "writing-functions-3",
  "level": "2",
  "url": "writing-functions.html#writing-functions-3",
  "type": "Listing",
  "number": "2.4",
  "title": "MATLAB Function with 2 Inputs and 1 Output",
  "body": " MATLAB Function with 2 Inputs and 1 Output   function perimeter = rectangle_perimeter(side1, side2) % Use the inputs (side1 and side2) % to compute the output (perimeter) perimeter = 2 * side1 + 2 * side2; end   "
},
{
  "id": "writing-functions-4",
  "level": "2",
  "url": "writing-functions.html#writing-functions-4",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "function header "
},
{
  "id": "multiple-outputs",
  "level": "1",
  "url": "multiple-outputs.html",
  "type": "Subsection",
  "number": "",
  "title": "Multiple Outputs",
  "body": " Multiple Outputs  Functions can return multiple outputs. To specify multiple outputs, list them in square brackets in the function header. Here is an example of a function that computes both the perimeter and area of a rectangle given the lengths of its two sides.   MATLAB Function with 2 Inputs and 2 Outputs   function [perimeter, area] = rectangle_properties(side1, side2) % Use the inputs (side1 and side2) % to compute the outputs (perimeter and area) perimeter = 2 * side1 + 2 * side2; area = side1 * side2; end    To call this function and capture both outputs, use square brackets on the left side of the assignment. For example, to compute the perimeter and area of a rectangle with side lengths 4 and 7, type:   [p, a] = rectangle_perimeter(4, 7) % returns p = 22 and a = 28   MATLAB will run the commands inside the function, using the input values you provided ( 4 and 7 ) to compute the output values ( 22 and 28 ). The results are then returned to the Command Window and stored in the variables p and a .   Ignoring Outputs  If you only want some of the outputs from a function, you can ignore the others by using a tilde ( ~ ) as a placeholder. For example, to compute only the area of a rectangle and ignore the perimeter, type:   % returns a = 28, ignores perimeter [~, a] = rectangle_perimeter(4, 7)    "
},
{
  "id": "multiple-outputs-3",
  "level": "2",
  "url": "multiple-outputs.html#multiple-outputs-3",
  "type": "Listing",
  "number": "2.5",
  "title": "MATLAB Function with 2 Inputs and 2 Outputs",
  "body": " MATLAB Function with 2 Inputs and 2 Outputs   function [perimeter, area] = rectangle_properties(side1, side2) % Use the inputs (side1 and side2) % to compute the outputs (perimeter and area) perimeter = 2 * side1 + 2 * side2; area = side1 * side2; end   "
},
{
  "id": "fn-functions-6",
  "level": "1",
  "url": "fn-functions-6.html",
  "type": "🧑🏻‍💻 Class Activities",
  "number": "",
  "title": "🧑🏻‍💻 Class Activities",
  "body": "  Hello Function    Create a function named hello with no inputs and outputs that displays 'Hello World' using the fprintf command. Test your function by typing hello in the command window.     function hello() fprintf('Hello World!\\n'); end       Modify the function to accept one input ( name ) and display a greeting, such as 'Hello Alice, nice to meet you!' where name is 'Alice' .     function hello(name) fprintf('Hello %s, nice to meet you!\\n', name); end       Try typing hello with no input and run it. What error message do you get, and what is MATLAB telling you to fix?    The error message is:  Not enough input arguments. Error in hello (line 3) fprintf('Hello %s, nice to meet you!\\n', name);  This means that the function hello expects one input argument, but none was provided when it was called.      Now, test your function with an input: hello('Robyn') .    When you run hello('Robyn') , the output is:  Hello Robyn, nice to meet you!      Projectile Height Function   Package the projectile height model script as a function.     Create a function named projectile_height that takes four inputs: initial height h0 , initial velocity v0 , gravity g , and time t .  The function should return one output, the height h at time t , given by: .  Do not include any fprintf commands inside the function. The function's body should contain only a single line that computes the height.     function h = projectile_height(h0, v0, g, t) h = h0 + v0*t - 0.5*g*t^2; end       Test your function using h0 = 1.5 , v0 = 12 , g = 9.81 , and t = 0.8 .     h = projectile_height(1.5, 12, 9.81, 0.8); fprintf('h = %.2f m\\n', h);   The computed height is h = 7.96 meters.      Circle Metrics Function   Write a function that returns more than one output.     Create a function named circle_metrics that takes one input r (radius) and returns two outputs: C (circumference) and A (area).     function [C, A] = circle_metrics(r) C = 2*pi*r; A = pi*r^2; end       Test your function with r = 4.5 and print the results with three decimal places.     [C, A] = circle_metrics(4.5); fprintf('C = %.3f\\t A = %.3f\\n', C, A);       Coin Total Function   In the piggy bank script, you computed a total value from the number of pennies, nickels, dimes, and quarters. Now, package that computation into a function so you can reuse it with different coin counts.     Create a function named coin_total with four inputs: nPennies , nNickels , nDimes , and nQuarters . The function should return one output, totalDollars .     function totalDollars = ... coin_total(nPennies, nNickels, nDimes, nQuarters) % Compute total value in cents cents = nPennies + 5*nNickels + 10*nDimes + 25*nQuarters; totalDollars = cents\/100; end       Test your function by running the following command in the Command Window.   total = coin_total(1, 1, 1, 1)     Your result should be a single dollar amount stored in total .      In the Command Window, compute dollars and leftover cents from total (do not change the function).     nDollars = floor(total); nCents = total - 100 * nDollars; fprintf('Total value: $%i.%02i\\n', nDollars, nCents);       Quadratic Solver Function   Write a function that computes the two solutions of using the quadratic formula. This function may return complex solutions when the discriminant is negative.     Create a function named quadratic with inputs a , b , and c . Return two outputs, x1 and x2 .     function [x1, x2] = quadratic(a, b, c) discriminant = b^2 - 4*a*c; x1 = (-b + sqrt(discriminant)) \/ (2*a); x2 = (-b - sqrt(discriminant)) \/ (2*a); end       Test your function on each equation below, and print the results. Use the real-and-imaginary printing approach so your output also works for complex solutions.          [x1, x2] = quadratic(2, -7, 5); fprintf('Eqn 1: x1 = %g%+gi, x2 = %g%+gi\\n', real(x1), imag(x1), real(x2), imag(x2)); [x1, x2] = quadratic(15, -135, 300); fprintf('Eqn 2: x1 = %g%+gi, x2 = %g%+gi\\n', real(x1), imag(x1), real(x2), imag(x2)); [x1, x2] = quadratic(1, 0, 36); fprintf('Eqn 3: x1 = %g%+gi, x2 = %g%+gi\\n', real(x1), imag(x1), real(x2), imag(x2));       Are there any inputs for which this function fails? Give an example and explain why.    The function fails when a = 0 , because the quadratic formula divides by . Handling a = 0 properly requires making a decision inside the function, which needs flow control.     "
},
{
  "id": "fn-example-greet",
  "level": "2",
  "url": "fn-functions-6.html#fn-example-greet",
  "type": "Reading Question",
  "number": "1",
  "title": "Hello Function.",
  "body": " Hello Function    Create a function named hello with no inputs and outputs that displays 'Hello World' using the fprintf command. Test your function by typing hello in the command window.     function hello() fprintf('Hello World!\\n'); end       Modify the function to accept one input ( name ) and display a greeting, such as 'Hello Alice, nice to meet you!' where name is 'Alice' .     function hello(name) fprintf('Hello %s, nice to meet you!\\n', name); end       Try typing hello with no input and run it. What error message do you get, and what is MATLAB telling you to fix?    The error message is:  Not enough input arguments. Error in hello (line 3) fprintf('Hello %s, nice to meet you!\\n', name);  This means that the function hello expects one input argument, but none was provided when it was called.      Now, test your function with an input: hello('Robyn') .    When you run hello('Robyn') , the output is:  Hello Robyn, nice to meet you!    "
},
{
  "id": "fn-projectile-height-function",
  "level": "2",
  "url": "fn-functions-6.html#fn-projectile-height-function",
  "type": "Reading Question",
  "number": "2",
  "title": "Projectile Height Function.",
  "body": " Projectile Height Function   Package the projectile height model script as a function.     Create a function named projectile_height that takes four inputs: initial height h0 , initial velocity v0 , gravity g , and time t .  The function should return one output, the height h at time t , given by: .  Do not include any fprintf commands inside the function. The function's body should contain only a single line that computes the height.     function h = projectile_height(h0, v0, g, t) h = h0 + v0*t - 0.5*g*t^2; end       Test your function using h0 = 1.5 , v0 = 12 , g = 9.81 , and t = 0.8 .     h = projectile_height(1.5, 12, 9.81, 0.8); fprintf('h = %.2f m\\n', h);   The computed height is h = 7.96 meters.    "
},
{
  "id": "fn-circle-metrics-function",
  "level": "2",
  "url": "fn-functions-6.html#fn-circle-metrics-function",
  "type": "Reading Question",
  "number": "3",
  "title": "Circle Metrics Function.",
  "body": " Circle Metrics Function   Write a function that returns more than one output.     Create a function named circle_metrics that takes one input r (radius) and returns two outputs: C (circumference) and A (area).     function [C, A] = circle_metrics(r) C = 2*pi*r; A = pi*r^2; end       Test your function with r = 4.5 and print the results with three decimal places.     [C, A] = circle_metrics(4.5); fprintf('C = %.3f\\t A = %.3f\\n', C, A);     "
},
{
  "id": "fn-coin-total-function",
  "level": "2",
  "url": "fn-functions-6.html#fn-coin-total-function",
  "type": "Reading Question",
  "number": "4",
  "title": "Coin Total Function.",
  "body": " Coin Total Function   In the piggy bank script, you computed a total value from the number of pennies, nickels, dimes, and quarters. Now, package that computation into a function so you can reuse it with different coin counts.     Create a function named coin_total with four inputs: nPennies , nNickels , nDimes , and nQuarters . The function should return one output, totalDollars .     function totalDollars = ... coin_total(nPennies, nNickels, nDimes, nQuarters) % Compute total value in cents cents = nPennies + 5*nNickels + 10*nDimes + 25*nQuarters; totalDollars = cents\/100; end       Test your function by running the following command in the Command Window.   total = coin_total(1, 1, 1, 1)     Your result should be a single dollar amount stored in total .      In the Command Window, compute dollars and leftover cents from total (do not change the function).     nDollars = floor(total); nCents = total - 100 * nDollars; fprintf('Total value: $%i.%02i\\n', nDollars, nCents);     "
},
{
  "id": "fn-quadratic-function",
  "level": "2",
  "url": "fn-functions-6.html#fn-quadratic-function",
  "type": "Reading Question",
  "number": "5",
  "title": "Quadratic Solver Function.",
  "body": " Quadratic Solver Function   Write a function that computes the two solutions of using the quadratic formula. This function may return complex solutions when the discriminant is negative.     Create a function named quadratic with inputs a , b , and c . Return two outputs, x1 and x2 .     function [x1, x2] = quadratic(a, b, c) discriminant = b^2 - 4*a*c; x1 = (-b + sqrt(discriminant)) \/ (2*a); x2 = (-b - sqrt(discriminant)) \/ (2*a); end       Test your function on each equation below, and print the results. Use the real-and-imaginary printing approach so your output also works for complex solutions.          [x1, x2] = quadratic(2, -7, 5); fprintf('Eqn 1: x1 = %g%+gi, x2 = %g%+gi\\n', real(x1), imag(x1), real(x2), imag(x2)); [x1, x2] = quadratic(15, -135, 300); fprintf('Eqn 2: x1 = %g%+gi, x2 = %g%+gi\\n', real(x1), imag(x1), real(x2), imag(x2)); [x1, x2] = quadratic(1, 0, 36); fprintf('Eqn 3: x1 = %g%+gi, x2 = %g%+gi\\n', real(x1), imag(x1), real(x2), imag(x2));       Are there any inputs for which this function fails? Give an example and explain why.    The function fails when a = 0 , because the quadratic formula divides by . Handling a = 0 properly requires making a decision inside the function, which needs flow control.    "
},
{
  "id": "fn-cqs",
  "level": "1",
  "url": "fn-cqs.html",
  "type": "Exercises",
  "number": "",
  "title": "🤔💭 Conceptual Questions",
  "body": " 🤔💭 Conceptual Questions    Purpose of a Function   A MATLAB function is most useful when you want to:     clear the Command Window automatically    store a long list of comments    create a reusable tool that takes inputs and returns outputs    avoid using variables      File Name Match   If a function is named coin_total , then its file should be saved as coin_total.m .    Matching the file name to the function name prevents “function not found” and naming errors.     Function Workspace   Variables created inside a function automatically appear in the Workspace after the function finishes.    A function uses its own workspace, so its internal variables do not automatically become Workspace variables.     Calling a Function   Which of the following is a function call with three inputs?    f = 2, 3, 4  f(2; 3; 4)  f(2, 3, 4)  f = (2, 3, 4)     Multiple Outputs   To store two outputs from a function, you should write:    a, b = f(x)  (a, b) = f(x)  [a, b] = f(x)  a = f(x), b     Function Header Meaning   In the header function y = f(x) , which symbol represents the output?    f  x  y  function     Calling Functions from Scripts   A script can call a function that you wrote (for example, coin_total ), as long as the function file is available in the Current Folder (or on the path).    This is one of the main benefits of functions: they simplify scripts by packaging common computations.     Matching the Description   Drag each description to the correct concept.     Uses the base workspace  Often written as a one-time “recipe”  Script    Has its own workspace  Designed for reuse with many inputs  Function     Scripts and functions both run top-to-bottom, but functions emphasize reusable input\/output behavior and a separate workspace.     "
},
{
  "id": "fn-ckpts",
  "level": "2",
  "url": "fn-cqs.html#fn-ckpts",
  "type": "Exercise",
  "number": "1",
  "title": "",
  "body": "  Purpose of a Function   A MATLAB function is most useful when you want to:     clear the Command Window automatically    store a long list of comments    create a reusable tool that takes inputs and returns outputs    avoid using variables      File Name Match   If a function is named coin_total , then its file should be saved as coin_total.m .    Matching the file name to the function name prevents “function not found” and naming errors.     Function Workspace   Variables created inside a function automatically appear in the Workspace after the function finishes.    A function uses its own workspace, so its internal variables do not automatically become Workspace variables.     Calling a Function   Which of the following is a function call with three inputs?    f = 2, 3, 4  f(2; 3; 4)  f(2, 3, 4)  f = (2, 3, 4)     Multiple Outputs   To store two outputs from a function, you should write:    a, b = f(x)  (a, b) = f(x)  [a, b] = f(x)  a = f(x), b     Function Header Meaning   In the header function y = f(x) , which symbol represents the output?    f  x  y  function     Calling Functions from Scripts   A script can call a function that you wrote (for example, coin_total ), as long as the function file is available in the Current Folder (or on the path).    This is one of the main benefits of functions: they simplify scripts by packaging common computations.     Matching the Description   Drag each description to the correct concept.     Uses the base workspace  Often written as a one-time “recipe”  Script    Has its own workspace  Designed for reuse with many inputs  Function     Scripts and functions both run top-to-bottom, but functions emphasize reusable input\/output behavior and a separate workspace.    "
},
{
  "id": "sec-logical-values",
  "level": "1",
  "url": "sec-logical-values.html",
  "type": "Subsection",
  "number": "",
  "title": "Logical Values (Answers)",
  "body": " Logical Values (Answers)  MATLAB has two logical values: true and false . When displayed, they often appear as logical 1 and logical 0 . Although they behave similarly to the numeric values 1 and 0 , they are different data types. Just as numbers can be stored in variables, logical values can be stored in variables as well.  a = 1; b = true; c = 0; d = false; fprintf(\"a = %g, b = %g, c = %g, d = %g\\n\", a, b, c, d)  Running the above code, fprintf produces the following output:  a = 1, b = 1, c = 0, d = 0  Even though a and b (and c and d ) look the same, MATLAB treats them differently: a is a number (a double), while b is a logical value. You can get more information using the whos command. Here is the output you should see:  Name Size Bytes Class Attributes a 1x1 8 double b 1x1 1 logical c 1x1 8 double d 1x1 1 logical  This shows us two differences:  Class (data type)  a is a double , while b is a logical .   Bytes (memory usage)  a uses 8 bytes, while b uses 1 byte.   At the end of the day, the double data type is meant to store numeric quantities, while the logical data type stores yes\/no answers to questions.   "
},
{
  "id": "sec-logical-statements",
  "level": "1",
  "url": "sec-logical-statements.html",
  "type": "Subsection",
  "number": "",
  "title": "Logical Statements (Questions)",
  "body": " Logical Statements (Questions)  A logical statement is any MATLAB expression that produces a logical value, either true or false . The most common logical statements come from comparing two values. These comparisons use relational operators .   Relational operators in MATLAB       Relational operator  Logical statement  Question being asked    ==  x == y  Is equal to ?    ~=  x ~= y  Is not equal to ?    <  x < y  Is less than ?    <=  x <= y  Is less than or equal to ?    >  x > y  Is greater than ?    >=  x >= y      A common beginner mistake is confusing the assignment operator = with the comparison operator == . The single equal sign assigns a value to a variable (telling MATLAB what to store), while the double equal sign compares two values (asking MATLAB a question).  cost = 7.1; % Telling: assign a value cost == 7.1 % Asking: compare a value   Assignment vs. Comparison   Which of the following statements is correct?      x = 5 sets x equal to 5, while x == 5 tests if x equals 5    Correct! The single equal sign is for assignment, and the double equal sign is for comparison.      x = 5 and x == 5 both do the same thing    Incorrect. These operators have completely different purposes: one assigns a value, the other asks a question.      x == 5 assigns 5 to x only if x doesn't already have a value    Incorrect. The == operator never assigns values; it only compares them.      Here are a few comparison examples. The parentheses are optional, but they help clarify which parts of the expression are being compared.  a = 4; b = -4; ans1 = (a == 4); % ← Is a equal to 4? Yes. ans2 = (a == b); % ← Is a equal to b? No. ans3 = (b < a); % ← Is b less than a? Yes.  This code defines two double variables, a and b , and three logical variables:  ans1 = 1 since the logical statement a == 4 is true.  ans2 = 0 since the logical statement a == b is false.  ans3 = 1 since the logical statement b < a is true.     Check Your Understanding: Logical Statements   Logical Statements   Let x , y , and z be numeric variables. Which of the following are valid logical statements in MATLAB?     x = y   Incorrect. The expression x = y uses a single equal sign, which is for assignment, not comparison.     z > y   Correct! The expression z > y is a valid logical statement that asks if z is greater than y .     y =< 2   Incorrect. The expression y =< 2 uses an incorrect operator; the correct operator for \"less than or equal to\" is <= .     z ~= z   Correct! The expression z ~= z is a valid logical statement that asks if z is not equal to z .     x ~ z   Incorrect. The expression x ~ z is not a valid logical statement because it lacks a proper relational operator.        What is the result of the following logical expression in MATLAB?  p = 10 > 5;     1 (logical)   Correct! Since 10 is indeed greater than 5, the expression evaluates to true (logical 1).     0 (logical)   Incorrect. Remember that 10 is greater than 5, so the expression evaluates to true .     1 (double)   Incorrect. While 1 (double) and true (logical 1) may seem similar, they are different data types in MATLAB.     0 (double)   Incorrect. The expression evaluates to true (logical 1), not false .        What is the result of the following logical expression in MATLAB?  r = (pi ~= 3.14);     1 (logical)   Correct! Since 3.14 is only an approximation of pi, it is not equal to pi.     0 (logical)   Incorrect. Since 3.14 is only an approximation of pi, it is not exactly equal to the value of pi in MATLAB, so the expression evaluates to true.     1 (double)   Incorrect. While 1 (double) and true (logical 1) may seem similar, they are different data types in MATLAB.     0 (double)   Incorrect. The expression evaluates to true (logical 1), not false, since pi and 3.14 are not exactly equal.         "
},
{
  "id": "sec-logical-statements-2",
  "level": "2",
  "url": "sec-logical-statements.html#sec-logical-statements-2",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "logical statement relational operators "
},
{
  "id": "tab-relational-operators",
  "level": "2",
  "url": "sec-logical-statements.html#tab-relational-operators",
  "type": "Table",
  "number": "2.6",
  "title": "Relational operators in MATLAB",
  "body": " Relational operators in MATLAB       Relational operator  Logical statement  Question being asked    ==  x == y  Is equal to ?    ~=  x ~= y  Is not equal to ?    <  x < y  Is less than ?    <=  x <= y  Is less than or equal to ?    >  x > y  Is greater than ?    >=  x >= y     "
},
{
  "id": "logic-reading-ckpt-2",
  "level": "2",
  "url": "sec-logical-statements.html#logic-reading-ckpt-2",
  "type": "Checkpoint",
  "number": "2.7",
  "title": "Assignment vs. Comparison.",
  "body": " Assignment vs. Comparison   Which of the following statements is correct?      x = 5 sets x equal to 5, while x == 5 tests if x equals 5    Correct! The single equal sign is for assignment, and the double equal sign is for comparison.      x = 5 and x == 5 both do the same thing    Incorrect. These operators have completely different purposes: one assigns a value, the other asks a question.      x == 5 assigns 5 to x only if x doesn't already have a value    Incorrect. The == operator never assigns values; it only compares them.     "
},
{
  "id": "sec-logical-statements-10",
  "level": "2",
  "url": "sec-logical-statements.html#sec-logical-statements-10",
  "type": "Checkpoint",
  "number": "2.8",
  "title": "Check Your Understanding: Logical Statements.",
  "body": " Check Your Understanding: Logical Statements   Logical Statements   Let x , y , and z be numeric variables. Which of the following are valid logical statements in MATLAB?     x = y   Incorrect. The expression x = y uses a single equal sign, which is for assignment, not comparison.     z > y   Correct! The expression z > y is a valid logical statement that asks if z is greater than y .     y =< 2   Incorrect. The expression y =< 2 uses an incorrect operator; the correct operator for \"less than or equal to\" is <= .     z ~= z   Correct! The expression z ~= z is a valid logical statement that asks if z is not equal to z .     x ~ z   Incorrect. The expression x ~ z is not a valid logical statement because it lacks a proper relational operator.        What is the result of the following logical expression in MATLAB?  p = 10 > 5;     1 (logical)   Correct! Since 10 is indeed greater than 5, the expression evaluates to true (logical 1).     0 (logical)   Incorrect. Remember that 10 is greater than 5, so the expression evaluates to true .     1 (double)   Incorrect. While 1 (double) and true (logical 1) may seem similar, they are different data types in MATLAB.     0 (double)   Incorrect. The expression evaluates to true (logical 1), not false .        What is the result of the following logical expression in MATLAB?  r = (pi ~= 3.14);     1 (logical)   Correct! Since 3.14 is only an approximation of pi, it is not equal to pi.     0 (logical)   Incorrect. Since 3.14 is only an approximation of pi, it is not exactly equal to the value of pi in MATLAB, so the expression evaluates to true.     1 (double)   Incorrect. While 1 (double) and true (logical 1) may seem similar, they are different data types in MATLAB.     0 (double)   Incorrect. The expression evaluates to true (logical 1), not false, since pi and 3.14 are not exactly equal.      "
},
{
  "id": "sec-negating-statements",
  "level": "1",
  "url": "sec-negating-statements.html",
  "type": "Subsection",
  "number": "",
  "title": "Negating Logical Statements",
  "body": " Negating Logical Statements  To ask the opposite of a logical statement, use the NOT operator ~ . If an expression is true, its negation is false, and vice versa.  ~true % returns false ~false % returns true  The NOT operator negates a single logical value or statement. When the statement is a comparison, use parentheses so MATLAB negates the whole comparison.  For example, the following statements ask if 8 is not equal to 9 :  ~(8 == 9)   NOT (8 is equal to 9)  8 ~= 9   8 is not equal to 9    Similarly, the negation of x >= 5 is x < 5 , so the two statements are equivalent:  ~(x >= 5)   NOT (x is greater than or equal to 5)  x < 5   x is less than 5    When negating expressions, use parentheses to make your intent clear and improve the readability of your code.   Negating Logical Statements   Which of the following expressions correctly asks \"Is x NOT greater than 10?\" Select all that apply.      ~(x > 10)    Correct! This uses the NOT operator to negate the comparison.      x <= 10    Correct! This is the equivalent relational operator form without negation.      ~x > 10    Incorrect. Without parentheses, this negates x first, then compares the result to 10, which is not the intended meaning.      x < 10    Incorrect. This asks if x is strictly less than 10, which excludes the case where x equals 10.      "
},
{
  "id": "logic-reading-ckpt-3",
  "level": "2",
  "url": "sec-negating-statements.html#logic-reading-ckpt-3",
  "type": "Checkpoint",
  "number": "2.9",
  "title": "Negating Logical Statements.",
  "body": " Negating Logical Statements   Which of the following expressions correctly asks \"Is x NOT greater than 10?\" Select all that apply.      ~(x > 10)    Correct! This uses the NOT operator to negate the comparison.      x <= 10    Correct! This is the equivalent relational operator form without negation.      ~x > 10    Incorrect. Without parentheses, this negates x first, then compares the result to 10, which is not the intended meaning.      x < 10    Incorrect. This asks if x is strictly less than 10, which excludes the case where x equals 10.     "
},
{
  "id": "sec-joining-two-statements",
  "level": "1",
  "url": "sec-joining-two-statements.html",
  "type": "Subsection",
  "number": "",
  "title": "Joining Two Statements",
  "body": " Joining Two Statements  Many questions involve multiple conditions. For example, to determine if a number is an even number greater than 100, then you need to check two things at once:  Is the number even?  Is the number greater than 100?  Because both must be true, we join these statements with and . If either of these conditions could be true, then we would join them with or .  MATLAB joins logical statements with AND and OR using the operators & (AND) and | (OR).   Logical operators for combining statements             &  ans1 & ans2  Are both and true?    |  ans1 | ans2      The result of joining logical statements are exactly what you would expect from everyday language: AND is true only when both sides are true, while OR is true when at least one side is true.  % Quick checks true & true % → true: 1 (logical) true & false % → false: 0 (logical) false & true % → false: 0 (logical) false & false % → false: 0 (logical) true | true % → true: 1 (logical) true | false % → true: 1 (logical) false | true % → true: 1 (logical) false | false % → false: 0 (logical)  Now try these operators in context.   P = 1; Q = 10; R = -4; P <= R & P > Q % → false & false: 0 (logical) R < 0 & R < Q % → true & true: 1 (logical) Q == R | Q == P % → false | false: 0 (logical) P < Q | P < R % → true | false: 1 (logical) ~(P < Q & P < R) % → NOT (true & false): 1 (logical) P > Q | P > R % → false | true: 1 (logical)     Combining Logical Statements   Given age = 25 and hasLicense = true , which expression is the most readable way to ask \"Is the person at least 18 years old AND has a driver's license?\"      (age >= 18) & hasLicense    Correct! This is clear and readable, using the AND operator directly with meaningful variable names.      (age >= 18) | hasLicense    Incorrect. The OR operator returns true if either condition is true, but we need both conditions to be true.      age >= 18 & hasLicense == true    While logically correct, comparing hasLicense == true is redundant and less readable. Use hasLicense directly since it's already a logical value.      ~(age < 18 | ~hasLicense)    While logically equivalent (using De Morgan's Law), this is much harder to read. Prefer the straightforward AND version for clarity.       "
},
{
  "id": "tab-logical-operators",
  "level": "2",
  "url": "sec-joining-two-statements.html#tab-logical-operators",
  "type": "Table",
  "number": "2.10",
  "title": "Logical operators for combining statements",
  "body": " Logical operators for combining statements             &  ans1 & ans2  Are both and true?    |  ans1 | ans2     "
},
{
  "id": "logic-reading-ckpt-4",
  "level": "2",
  "url": "sec-joining-two-statements.html#logic-reading-ckpt-4",
  "type": "Checkpoint",
  "number": "2.11",
  "title": "Combining Logical Statements.",
  "body": " Combining Logical Statements   Given age = 25 and hasLicense = true , which expression is the most readable way to ask \"Is the person at least 18 years old AND has a driver's license?\"      (age >= 18) & hasLicense    Correct! This is clear and readable, using the AND operator directly with meaningful variable names.      (age >= 18) | hasLicense    Incorrect. The OR operator returns true if either condition is true, but we need both conditions to be true.      age >= 18 & hasLicense == true    While logically correct, comparing hasLicense == true is redundant and less readable. Use hasLicense directly since it's already a logical value.      ~(age < 18 | ~hasLicense)    While logically equivalent (using De Morgan's Law), this is much harder to read. Prefer the straightforward AND version for clarity.     "
},
{
  "id": "sec-joining-many-statements",
  "level": "1",
  "url": "sec-joining-many-statements.html",
  "type": "Subsection",
  "number": "",
  "title": "Joining Many Statements",
  "body": " Joining Many Statements  You can combine more than two logical statements, and you can mix ~ , & , and | in the same expression. When you do, MATLAB evaluates operators in a fixed order. Parentheses override everything, so you can always force the grouping you intend.  In general, the logical operator precedence chain is as follows:    1st 2nd 3rd 4th    () ❯ ~ ❯ & ❯ |     Sample Logical Operator Precedence Interpretations    MATLAB Command Interpretation    ~A & B ➜ (~A) & B    ~A | B ➜ (~A) | B    A & B | C ➜ (A & B) | C    A | B & C ➜ A | (B & C)     When in doubt, use parentheses. They make your code clearer to readers and reduce errors caused by misinterpreting precedence.   Operator Precedence   According to MATLAB's operator precedence rules, which expression illustrates how A | ~B & C | D is evaluated?      A | ((~B) & C) | D    Correct! The NOT operator ~ is evaluated first, followed by the AND operator & , and finally the OR operators | are evaluated from left to right.      (A | (~B)) & (C | D)    Incorrect. The AND operator & has higher precedence than the OR operator | , so this grouping is not correct.      ((A | ~B) & C) | D    Incorrect. The AND operator & is evaluated before the OR operator | , but the NOT operator ~ is evaluated first.      A | ~(B & C) | D    Incorrect. The AND operator & is evaluated before the OR operator | , but the NOT operator ~ is evaluated first.      "
},
{
  "id": "sec-joining-many-statements-5",
  "level": "2",
  "url": "sec-joining-many-statements.html#sec-joining-many-statements-5",
  "type": "Table",
  "number": "2.12",
  "title": "Sample Logical Operator Precedence Interpretations",
  "body": " Sample Logical Operator Precedence Interpretations    MATLAB Command Interpretation    ~A & B ➜ (~A) & B    ~A | B ➜ (~A) | B    A & B | C ➜ (A & B) | C    A | B & C ➜ A | (B & C)    "
},
{
  "id": "logic-reading-ckpt-5",
  "level": "2",
  "url": "sec-joining-many-statements.html#logic-reading-ckpt-5",
  "type": "Checkpoint",
  "number": "2.13",
  "title": "Operator Precedence.",
  "body": " Operator Precedence   According to MATLAB's operator precedence rules, which expression illustrates how A | ~B & C | D is evaluated?      A | ((~B) & C) | D    Correct! The NOT operator ~ is evaluated first, followed by the AND operator & , and finally the OR operators | are evaluated from left to right.      (A | (~B)) & (C | D)    Incorrect. The AND operator & has higher precedence than the OR operator | , so this grouping is not correct.      ((A | ~B) & C) | D    Incorrect. The AND operator & is evaluated before the OR operator | , but the NOT operator ~ is evaluated first.      A | ~(B & C) | D    Incorrect. The AND operator & is evaluated before the OR operator | , but the NOT operator ~ is evaluated first.     "
},
{
  "id": "logic-cqs",
  "level": "1",
  "url": "logic-cqs.html",
  "type": "Exercises",
  "number": "",
  "title": "🤔💭 Conceptual Questions",
  "body": " 🤔💭 Conceptual Questions    Logical Data Types   In MATLAB, true and 1 are the same.    Incorrect. While true and 1 are represented by the same numeric value, they have different data types: true is of type logical , while 1 is of type double .     Relational Operators: Inequality   Which of the following commands test that x is not equal to y ?    ~(x = y)  ~(x == y)  ~x == y  x ~= y  x ~== y    In MATLAB, the tilde-equals ~= operator tests for inequality. Note that many other languages use != , but MATLAB uses ~= .     Translating Relational Operators   Give the logical statement that is equivalent to the question:  Is greater than ? ➜       (7\\s*>\\s*3|3\\s*<\\s*7)  Correct!    .*  Incorrect. Use the > operator to test if one value is greater than another.      The MATLAB command is 7 > 3 , which evaluates to 1 (true).     Basic Logical Operators   Select the value contained in ans after evaluating the following expression:   ans = (3 >= 2) & (3+4 == 6)      ans = 1 (logical)   Incorrect. While 3 >= 2 is true, check the second part: is really equal to ?     ans = 0 (logical)   Correct! Even though 3 >= 2 is true, the expression 3+4 == 6 is false (since ). For an AND operation to be true, both sides must be true.     ans = 1   Incorrect. The result of a logical operation is always of type logical , not double .       ans = 0     Incorrect. The result of a logical operation is always of type logical , not double .      None of the above. This expression will produce an error.       Understanding AND   An AND operation ( & ) returns true if at least one of the conditions is true.    Incorrect. An AND operation requires both conditions to be true. You're thinking of OR ( | ), which returns true if at least one condition is true.     Is p positive?   Give the command that is equivalent to asking the question:  Is p positive? ➜       (p\\s*>\\s*0|0\\s*<\\s*p)  Correct!    .*  Incorrect. Use the > operator to test if p is greater than 0.       ans1 = p > 0 evaluates to 0 (false) since is not positive.     Is p equal to 4?   Give the command that is equivalent to asking the question:  Is p equal to 4 ? ➜       (p\\s*==\\s*4|4\\s*==\\s*p)  Correct!    .*  Incorrect. Use the == operator to test equality.       ans2 = p == 4 evaluates to 0 (false) since .     Combining with AND   Select the command that is equivalent to asking the question:  Is p a negative number greater than -4 ?    p < 0 & p >= -4  p <= 0 | p > -4  -4 < p < 0  p < 0 | p > -4  p < 0 & p > -4        Negating with NOT   Which logical statements are equivalent to asking the question:  Is p NOT positive?    ~(p > 0)  p <= 0  ~p > 0  p ~> 0  p < 0    The NOT operator ~ negates a logical value, turning true into false and false into true.     Combining with OR   Give the command that is equivalent to asking the question:  Is p not equal to 5 OR greater than 7? ➜       \\(?\\s*p\\s*~=\\s*5\\s*\\)?\\s*\\|\\s*\\(?\\s*p\\s*>\\s*7\\s*\\)?  Correct!    .*  Incorrect. Use ~= for \"not equal\" and | for OR.       ans5 = (p ~= 5) | (p > 7) evaluates to 1 (true) since is true.     Operator Precedence   Select the logical statement that is equivalent to the following:  ~A & B | C     ((~A) & B) | C    ~(A & B | C)    ~A & (B | C)    ~(A & B) | C     MATLAB evaluates logical operators in this order: first ~ (NOT), then & (AND), then | (OR). So ~A & B | C is evaluated as ((~A) & B) | C .     "
},
{
  "id": "logic-concepts",
  "level": "2",
  "url": "logic-cqs.html#logic-concepts",
  "type": "Exercise",
  "number": "1",
  "title": "",
  "body": "  Logical Data Types   In MATLAB, true and 1 are the same.    Incorrect. While true and 1 are represented by the same numeric value, they have different data types: true is of type logical , while 1 is of type double .     Relational Operators: Inequality   Which of the following commands test that x is not equal to y ?    ~(x = y)  ~(x == y)  ~x == y  x ~= y  x ~== y    In MATLAB, the tilde-equals ~= operator tests for inequality. Note that many other languages use != , but MATLAB uses ~= .     Translating Relational Operators   Give the logical statement that is equivalent to the question:  Is greater than ? ➜       (7\\s*>\\s*3|3\\s*<\\s*7)  Correct!    .*  Incorrect. Use the > operator to test if one value is greater than another.      The MATLAB command is 7 > 3 , which evaluates to 1 (true).     Basic Logical Operators   Select the value contained in ans after evaluating the following expression:   ans = (3 >= 2) & (3+4 == 6)      ans = 1 (logical)   Incorrect. While 3 >= 2 is true, check the second part: is really equal to ?     ans = 0 (logical)   Correct! Even though 3 >= 2 is true, the expression 3+4 == 6 is false (since ). For an AND operation to be true, both sides must be true.     ans = 1   Incorrect. The result of a logical operation is always of type logical , not double .       ans = 0     Incorrect. The result of a logical operation is always of type logical , not double .      None of the above. This expression will produce an error.       Understanding AND   An AND operation ( & ) returns true if at least one of the conditions is true.    Incorrect. An AND operation requires both conditions to be true. You're thinking of OR ( | ), which returns true if at least one condition is true.     Is p positive?   Give the command that is equivalent to asking the question:  Is p positive? ➜       (p\\s*>\\s*0|0\\s*<\\s*p)  Correct!    .*  Incorrect. Use the > operator to test if p is greater than 0.       ans1 = p > 0 evaluates to 0 (false) since is not positive.     Is p equal to 4?   Give the command that is equivalent to asking the question:  Is p equal to 4 ? ➜       (p\\s*==\\s*4|4\\s*==\\s*p)  Correct!    .*  Incorrect. Use the == operator to test equality.       ans2 = p == 4 evaluates to 0 (false) since .     Combining with AND   Select the command that is equivalent to asking the question:  Is p a negative number greater than -4 ?    p < 0 & p >= -4  p <= 0 | p > -4  -4 < p < 0  p < 0 | p > -4  p < 0 & p > -4        Negating with NOT   Which logical statements are equivalent to asking the question:  Is p NOT positive?    ~(p > 0)  p <= 0  ~p > 0  p ~> 0  p < 0    The NOT operator ~ negates a logical value, turning true into false and false into true.     Combining with OR   Give the command that is equivalent to asking the question:  Is p not equal to 5 OR greater than 7? ➜       \\(?\\s*p\\s*~=\\s*5\\s*\\)?\\s*\\|\\s*\\(?\\s*p\\s*>\\s*7\\s*\\)?  Correct!    .*  Incorrect. Use ~= for \"not equal\" and | for OR.       ans5 = (p ~= 5) | (p > 7) evaluates to 1 (true) since is true.     Operator Precedence   Select the logical statement that is equivalent to the following:  ~A & B | C     ((~A) & B) | C    ~(A & B | C)    ~A & (B | C)    ~(A & B) | C     MATLAB evaluates logical operators in this order: first ~ (NOT), then & (AND), then | (OR). So ~A & B | C is evaluated as ((~A) & B) | C .    "
},
{
  "id": "sec-if-statement",
  "level": "1",
  "url": "sec-if-statement.html",
  "type": "Subsection",
  "number": "",
  "title": "If Statement",
  "body": " If Statement  The simplest if -statement tests a single logical condition. MATLAB evaluates the condition; if it is true , the indented block runs. If it is false , MATLAB skips the block and continues after end .   The if Statement Structure   Use Case:  if condition is true, run codeBlock .   if condition % true? ➜ run codeBlock codeBlock end  Notes & Rules:  Every if -statement must end with end .  condition must be a logical statement that returns true or false .  If condition is false, MATLAB does nothing and skips to end .     To see how this works, run the following code block:   Since age is 23 , the logical statement age >= 21 is true, so MATLAB executes the fprintf line and prints the message. Now try changing age to 16 and running it again. This time, the age >= 21 is false, so MATLAB skips the fprintf line and nothing is printed.    What happens when the condition is false?   In a basic if statement, what happens when the condition is false?      MATLAB runs the block once and then stops the script.    The if statement never stops execution by itself.      MATLAB skips the block and continues with the line after end .    When the condition is false, MATLAB simply moves past the block.      MATLAB runs both the block and the next line after end .    Only one path executes: either the block runs or it is skipped.      MATLAB reports an error because the condition is false.    False conditions are expected, so no error is raised.       Required keyword to close an if statement   What keyword must appear at the end of every if statement?       stop     MATLAB does not use stop to close an if statement.       end     Every if statement must be closed with end .       endif     MATLAB uses end instead of endif .       done     MATLAB does not use done to close an if statement.       If statement requires true or false condition   The condition in an if statement must evaluate to either true or false .    A logical condition is a statement that MATLAB evaluates to either true or false , which determines whether the code block executes.     "
},
{
  "id": "conditional-gates-reading-ckpt-1",
  "level": "2",
  "url": "sec-if-statement.html#conditional-gates-reading-ckpt-1",
  "type": "Checkpoint",
  "number": "2.14",
  "title": "",
  "body": "  What happens when the condition is false?   In a basic if statement, what happens when the condition is false?      MATLAB runs the block once and then stops the script.    The if statement never stops execution by itself.      MATLAB skips the block and continues with the line after end .    When the condition is false, MATLAB simply moves past the block.      MATLAB runs both the block and the next line after end .    Only one path executes: either the block runs or it is skipped.      MATLAB reports an error because the condition is false.    False conditions are expected, so no error is raised.       Required keyword to close an if statement   What keyword must appear at the end of every if statement?       stop     MATLAB does not use stop to close an if statement.       end     Every if statement must be closed with end .       endif     MATLAB uses end instead of endif .       done     MATLAB does not use done to close an if statement.       If statement requires true or false condition   The condition in an if statement must evaluate to either true or false .    A logical condition is a statement that MATLAB evaluates to either true or false , which determines whether the code block executes.    "
},
{
  "id": "sec-if-else-statement",
  "level": "1",
  "url": "sec-if-else-statement.html",
  "type": "Subsection",
  "number": "",
  "title": "If-else Statement",
  "body": " If-else Statement  When there are two mutually exclusive options, add an else branch. MATLAB checks the if condition once; if it is true, it executes the if branch, and if it is false, it runs the else branch. Exactly one branch runs each time the code executes.   The if-else Statement Structure   Use Case:  if conditionA is true, run blockA . Otherwise, run blockB .   if conditionA % true? ➜ run blockA -- false? ➜ run blockB blockA else blockB end  Notes & Rules:  Every if -statement must end with end .  conditionA must be a logical statement that returns true or false .  Exactly one of blockA OR blockB must run when the code executes.     Building on the previous example, here is a code block that uses an if-else statement:   Since age is 23 , the logical statement age >= 21 is true, so MATLAB prints the first message. Now try changing age to 16 and running it again. This time, the logical statement is false, so MATLAB tells you to move along.    If-else executes exactly one branch   In an if-else statement, MATLAB executes exactly one of the two branches.    Because the condition is either true or false, MATLAB runs the matching branch and skips the other.     When does the else branch run?   When does the else branch in an if-else statement execute?      The else branch runs before the if branch.    MATLAB checks the if condition first, then decides which branch to run.      The else branch runs when the condition is false.    The else branch is the alternative path that executes when the condition evaluates to false.      The else branch runs after the if branch completes.    Only one branch runs; they never both execute in the same pass through the code.      The else branch never runs.    The else branch runs whenever the condition is false.       If-else provides two mutually exclusive paths   An if-else statement is useful when you need to choose between two mutually exclusive actions.    The if-else structure guarantees that exactly one of two code paths executes based on whether the condition is true or false.     "
},
{
  "id": "conditional-gates-reading-ckpt-2",
  "level": "2",
  "url": "sec-if-else-statement.html#conditional-gates-reading-ckpt-2",
  "type": "Checkpoint",
  "number": "2.15",
  "title": "",
  "body": "  If-else executes exactly one branch   In an if-else statement, MATLAB executes exactly one of the two branches.    Because the condition is either true or false, MATLAB runs the matching branch and skips the other.     When does the else branch run?   When does the else branch in an if-else statement execute?      The else branch runs before the if branch.    MATLAB checks the if condition first, then decides which branch to run.      The else branch runs when the condition is false.    The else branch is the alternative path that executes when the condition evaluates to false.      The else branch runs after the if branch completes.    Only one branch runs; they never both execute in the same pass through the code.      The else branch never runs.    The else branch runs whenever the condition is false.       If-else provides two mutually exclusive paths   An if-else statement is useful when you need to choose between two mutually exclusive actions.    The if-else structure guarantees that exactly one of two code paths executes based on whether the condition is true or false.    "
},
{
  "id": "sec-if-elseif-else-statement",
  "level": "1",
  "url": "sec-if-elseif-else-statement.html",
  "type": "Subsection",
  "number": "",
  "title": "If-elseif-else Statement",
  "body": " If-elseif-else Statement  Use elseif when you need to test several conditions in order. MATLAB checks each condition from top to bottom and executes the first block whose condition is true. An optional else branch acts as a fallback so you can guarantee that a variable gets assigned a value.   The if-elseif-else Statement Structure   Use Case:    if conditionA is true, run blockA ,  if conditionB is true, run blockB ,  if conditionC is true, run blockC ,  if all of the above are false, run blockD (default).     if conditionA % true? ➜ run blockA -- false? ➜ check conditionB blockA elseif conditionB % true? ➜ run blockB -- false? ➜ check conditionC blockB elseif conditionC % true? ➜ run blockC -- false? ➜ run blockD blockC else blockD end  Notes & Rules:  You can add as many elseif branches as needed.  The else (default) branch is optional.  The conditions are checked in order from top to bottom.  Exactly one of the blocks will run when the code executes.  Every if -statement must end with end .  Each logicalStatement must evaluate to true or false .  The else block runs only when all preceding conditions are false.  You can nest if -statements within other if -statements, but this should be avoided whenever possible.      For practice, test this block with different initial values such as x = 0; y = 4; , x = 0; y = 3; , and x = 3; y = 3; . Watch how only one branch executes each time.    How elseif chains work   Which statements about an if-elseif-else chain are true? Select all that apply.      Conditions are checked from top to bottom.    MATLAB evaluates conditions in order and stops at the first true one.      The else block runs even if a previous condition is true.    The else block is a fallback and only runs when all conditions are false.      Only the first true condition's block executes.    Once MATLAB finds a true condition, it skips the remaining branches.      You must include an else branch in every chain.    The else branch is optional, though it can be helpful as a default.      You can include multiple elseif branches.    Add as many elseif tests as you need to cover different cases.       Order matters in elseif chains   In an if-elseif-else chain, changing the order of conditions can change which block executes.    Because MATLAB checks conditions from top to bottom and stops at the first true one, the order of conditions matters. If multiple conditions could be true, only the first true condition's block will execute.     Purpose of the else branch   What is the purpose of the else branch in an if-elseif-else chain?      To check one more condition before ending.    The else branch does not check a condition; use elseif to check additional conditions.      To provide a default action when no conditions are true.    The else branch serves as a fallback that runs when all previous conditions evaluate to false.      To close the if statement.    The end keyword closes the if statement, not else .      To run code after all other branches have executed.    Only one branch executes; the else runs instead of the others, not after them.       "
},
{
  "id": "conditional-gates-chkpt-3",
  "level": "2",
  "url": "sec-if-elseif-else-statement.html#conditional-gates-chkpt-3",
  "type": "Checkpoint",
  "number": "2.16",
  "title": "",
  "body": "  How elseif chains work   Which statements about an if-elseif-else chain are true? Select all that apply.      Conditions are checked from top to bottom.    MATLAB evaluates conditions in order and stops at the first true one.      The else block runs even if a previous condition is true.    The else block is a fallback and only runs when all conditions are false.      Only the first true condition's block executes.    Once MATLAB finds a true condition, it skips the remaining branches.      You must include an else branch in every chain.    The else branch is optional, though it can be helpful as a default.      You can include multiple elseif branches.    Add as many elseif tests as you need to cover different cases.       Order matters in elseif chains   In an if-elseif-else chain, changing the order of conditions can change which block executes.    Because MATLAB checks conditions from top to bottom and stops at the first true one, the order of conditions matters. If multiple conditions could be true, only the first true condition's block will execute.     Purpose of the else branch   What is the purpose of the else branch in an if-elseif-else chain?      To check one more condition before ending.    The else branch does not check a condition; use elseif to check additional conditions.      To provide a default action when no conditions are true.    The else branch serves as a fallback that runs when all previous conditions evaluate to false.      To close the if statement.    The end keyword closes the if statement, not else .      To run code after all other branches have executed.    Only one branch executes; the else runs instead of the others, not after them.      "
},
{
  "id": "sec-switch-statement",
  "level": "1",
  "url": "sec-switch-statement.html",
  "type": "Subsection",
  "number": "",
  "title": "Switch Statement",
  "body": " Switch Statement  The switch statement is another option for controlling flow in MATLAB. It is best when you are comparing one value to a list of discrete, exact matches.  A switch statement compares a variable to the values listed in each case . The first match runs, and MATLAB skips the rest.   Like the if-statement, you can have as many branches as you like. You would just add additional case statements between the switch and otherwise statements.    The switch Statement Structure   Use Case:    if var is equal to val1 , run blockA ,  if var is equal to val2 or val3 , run blockB ,  if var is equal to val4 , run blockC ,  if var was not matched, run blockD (default).     switch var case val1 % var == val1? YES ➜ run blockA % NO ➜ check next case blockA case {val2, val3} % var == val2 OR val3? Yes ➜ run blockB % NO ➜ check next case blockB case val4 % var == val4? Yes ➜ run blockC % NO ➜ check next case blockC otherwise % no matches? YES ➜ run blockD % NO ➜ check next case blockD end  Rules:  Case values are checked in order from top to bottom.  The otherwise block runs only when no cases match.  The otherwise (default) branch is optional.  When there is only one case value, curly braces { } are optional.  Every switch -statement must end with end .  Case values can be numbers, strings, or other data types that support equality comparisons.  Case values are case-sensitive when comparing strings.  Case values must be unique; duplicate case values will cause an error.    Limitations:  Case values cannot use logical operators (e.g., < , > , == , & , | ).  Switch statements are not suitable for range-based conditions (e.g., checking if a value is between two numbers).     The switch - case structure is similar to the if structure, but offers a few advantages. First, it is easier to read; second, it is better when comparing strings (of possibly different lengths).  As an example, let's check whether a cadet is in their first two years at VMI.   The cases are grouped by curly brackets so that a case will be satisfied if the value of Year is any of the values in a specific case. Once this code is executed, the switch command will attempt to match value of Year.     Switch keywords and roles   Match each switch keyword to its role.     switch  Starts the block and names the expression to compare.    case  Runs when the expression matches a listed value.    otherwise  Runs when no case matches.    end  Closes the switch statement.     A switch block tests one expression, each case provides a value to match, and otherwise provides the default path before end closes the block.      Switch vs if-elseif for exact matches   When is a switch statement more suitable than an if-elseif-else chain? Select all that apply.      When comparing a single variable to multiple exact values.    The switch statement is designed for testing one variable against a list of specific values.      When you need to test ranges like x > 10 .    Switch statements cannot use logical operators or ranges; use if-elseif for range-based conditions.      When comparing string values of different lengths.    Switch statements handle string comparisons cleanly, especially when strings have different lengths.      When the case values need to be computed at runtime.    Case values must be hard-coded constants, not variables or expressions.       Otherwise branch is optional in switch   The otherwise branch in a switch statement is optional.    While the otherwise branch is optional, including it provides a default action when no cases match, which can help prevent unintended behavior.     "
},
{
  "id": "conditional-gates-chkpt-4",
  "level": "2",
  "url": "sec-switch-statement.html#conditional-gates-chkpt-4",
  "type": "Checkpoint",
  "number": "2.17",
  "title": "",
  "body": "   Switch keywords and roles   Match each switch keyword to its role.     switch  Starts the block and names the expression to compare.    case  Runs when the expression matches a listed value.    otherwise  Runs when no case matches.    end  Closes the switch statement.     A switch block tests one expression, each case provides a value to match, and otherwise provides the default path before end closes the block.      Switch vs if-elseif for exact matches   When is a switch statement more suitable than an if-elseif-else chain? Select all that apply.      When comparing a single variable to multiple exact values.    The switch statement is designed for testing one variable against a list of specific values.      When you need to test ranges like x > 10 .    Switch statements cannot use logical operators or ranges; use if-elseif for range-based conditions.      When comparing string values of different lengths.    Switch statements handle string comparisons cleanly, especially when strings have different lengths.      When the case values need to be computed at runtime.    Case values must be hard-coded constants, not variables or expressions.       Otherwise branch is optional in switch   The otherwise branch in a switch statement is optional.    While the otherwise branch is optional, including it provides a default action when no cases match, which can help prevent unintended behavior.    "
},
{
  "id": "sec-conditional-statements-7",
  "level": "1",
  "url": "sec-conditional-statements-7.html",
  "type": "🧑🏻‍💻 Class Activities",
  "number": "",
  "title": "🧑🏻‍💻 Class Activities",
  "body": "  These in-class activities focus on writing small MATLAB functions that use if and switch statements. Each activity includes multiple parts and asks you to reason about which branch executes.    Activity 1: Simple if -statement   Use the coding area, below, to complete the following tasks. Each task builds on the previous one, so you can modify your code block as you go.      Define the variable x as 6 , if use an if -statement to define the variable y according to the following rule:  if x is less than or equal to 9, set y to 1, otherwise set y to 4.      x = 6; if x <= 9 y = 1; else y = 4; end fprintf('for x = %d, we set y to %d\\n', x, y);      Change x to 16 and rerun your code block.    Just change the value of x to 16 in the previous code block.      Next, define x as a random integer between -5 and 15, using the command randi([-5, 15]) .  Rerun your code multiple times to see how the value of y changes based on the random value of x .    Just change the value of x to randi([-5, 15]) in the previous code block.      Update your code to set y according to the following new rule:  if x is between 1 and 9 (inclusive), set y to 1, otherwise set y to 4.      x = randi([-5, 15]); if x >= 1 & x <= 9 y = 1; else y = 4; end fprintf('for x = %d, we set y to %d\\n', x, y);      Activity 2: Updating a Variable with Conditionals   Use the coding area, below, to complete the following tasks.      Suppose num is a random integer between 0 and 20. Give the code that increases num by 5 if it is greater than 10 and decreases it by 5 otherwise.     nnum = randi([0, 20]); fprintf('Starting num = %d\\n', num); if num > 10 num = num + 5; else num = num - 5; end fprintf('Updated num = %d\\n', num);       Suppose num is a 1 x 1 double . Give the code that increases num by 5 if it is greater than 10, decreases num by 5 if it is less than 10, and does nothing if num is zero.    If x = 0 , the below script runs the commands x = x - 5 and disp(x) , outputting -5 . However, if x = 10 , only the disp(x) command is run, producing an output of 10 .   if x > 10 x = x + 5; elseif x < 10 x = x - 5; end disp(x)       Activity 3: Sign Label Function   Write a function that classifies a single number as positive, negative, or zero.     Create a function named sign_label that takes one input x and returns one output label with the value 'positive' , 'negative' , or 'zero' .    function label = sign_label(x) if x > 0 label = 'positive'; elseif x < 0 label = 'negative'; else label = 'zero'; end end      Modify the function so it returns a second output named code with values 1 , -1 , or 0 that match the sign.    function [label, code] = sign_label(x) if x > 0 label = 'positive'; code = 1; elseif x < 0 label = 'negative'; code = -1; else label = 'zero'; code = 0; end end      Activity 4: Freeze Alert Function   Use a simple if -statement to return a warning message from a temperature input.     Write a function named freeze_alert that takes tempC (a scalar temperature in Celsius) and tempWarn (how close to freezing to warn) and returns message . If tempC is at or below tempWarn , return 'Freeze warning' ; otherwise return 'No warning' .    function message = freeze_alert(tempC, tempWarn) if tempC <= tempWarn message = 'Freeze warning'; else message = 'No warning'; end end      Update the function to return a second output isFreezing that is true or false along with the message.    function [message, isFreezing] = freeze_alert(tempC, tempWarn) if tempC <= 0 message = 'Freeze warning'; isFreezing = true; elseif tempC <= tempWarn message = 'Freeze warning'; isFreezing = false; else message = 'No warning'; isFreezing = false; end end      Activity 5: Ticket Price Function   Write a function that uses if-elseif-else to choose among several price brackets.     Create a function named ticket_price that takes a scalar input age (a single person's age, in years) and returns price using the rules below:   Age less than 13: price = 6  Age from 13 to 64: price = 12  Age 65 or older: price = 8        Modify the function so it returns a second output group and handles invalid ages. If age < 0 , return price = NaN and group = 'invalid' .       Activity 6: Letter Grade Function   Convert a numeric score to a letter grade using range-based conditions.     Write a function named letter_grade that returns 'A' , 'B' , 'C' , 'D' , or 'F' for a scalar score using the standard 90\/80\/70\/60 cutoffs.       Add an input check so that scores outside 0 to 100 return 'invalid' .       Concept check: why must the score >= 90 test appear before the score >= 80 test?       Activity 7: Shipping Mode Switch   Use a switch statement to choose among discrete shipping options.     Create a function named shipping_cost that takes a mode input ( 'S' , 'E' , or 'O' ) and returns a scalar cost of 5, 12, or 20.    function cost = shipping_cost(mode) switch mode case 'S' cost = 5; case 'E' cost = 12; case 'O' cost = 20; otherwise cost = NaN; end end      Extend the function so it also accepts full words ( 'standard' , 'express' , and 'overnight' ) in addition to the single-letter codes.    function cost = shipping_cost(mode) switch mode case {'S', 'standard'} cost = 5; case {'E', 'express'} cost = 12; case {'O', 'overnight'} cost = 20; otherwise cost = NaN; end end      Concept check: what happens when mode = 'e' (lowercase), and why?    The otherwise branch runs and returns NaN because switch comparisons are case-sensitive, so 'e' does not match 'E' .      Activity 8: Day Type Switch   Map a day number to weekday or weekend status using a switch -statement.     Write a function named day_type that takes an integer dayNum (1 = Monday, 7 = Sunday). Return 'weekday' for 1--5 and 'weekend' for 6--7.       Update the function to return a second output named isWeekend that is true or false for valid days.       Concept check: what should the function return for dayNum = 0 , and which branch handles it?       Activity 9: Thermostat Mode Switch   Use a discrete numeric code to select a thermostat mode.     Create a function named thermostat_mode that takes a numeric code: 0 for off, 1 for heat, and 2 for cool. Return the string 'off' , 'heat' , or 'cool' .       Extend the function to return a second output setPoint . Use 68 for heat, 74 for cool, and NaN for off or invalid codes.       Activity 10: Late Fee Function   Use an if-elseif-else chain to assign a fee based on how late something is.     Write a function named late_fee that takes a single number daysLate (the number of days late) and returns fee according to the table below:    daysLate fee    0 or less 0    1 to 3 5    3 to 7 15    more than 7 30         Modify the function to return a second output status with values according to the table below:    daysLate fee status    0 or less 0 on time    1 to 3 5 minor late    3 to 7 15 late    more than 7 30 very late          "
},
{
  "id": "conditional-activity-1",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-1",
  "type": "Reading Question",
  "number": "1",
  "title": "Activity 1: Simple <code class=\"code-inline tex2jax_ignore language-matlab\">if<\/code>-statement.",
  "body": " Activity 1: Simple if -statement   Use the coding area, below, to complete the following tasks. Each task builds on the previous one, so you can modify your code block as you go.      Define the variable x as 6 , if use an if -statement to define the variable y according to the following rule:  if x is less than or equal to 9, set y to 1, otherwise set y to 4.      x = 6; if x <= 9 y = 1; else y = 4; end fprintf('for x = %d, we set y to %d\\n', x, y);      Change x to 16 and rerun your code block.    Just change the value of x to 16 in the previous code block.      Next, define x as a random integer between -5 and 15, using the command randi([-5, 15]) .  Rerun your code multiple times to see how the value of y changes based on the random value of x .    Just change the value of x to randi([-5, 15]) in the previous code block.      Update your code to set y according to the following new rule:  if x is between 1 and 9 (inclusive), set y to 1, otherwise set y to 4.      x = randi([-5, 15]); if x >= 1 & x <= 9 y = 1; else y = 4; end fprintf('for x = %d, we set y to %d\\n', x, y);    "
},
{
  "id": "conditional-activity-2",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-2",
  "type": "Reading Question",
  "number": "2",
  "title": "Activity 2: Updating a Variable with Conditionals.",
  "body": " Activity 2: Updating a Variable with Conditionals   Use the coding area, below, to complete the following tasks.      Suppose num is a random integer between 0 and 20. Give the code that increases num by 5 if it is greater than 10 and decreases it by 5 otherwise.     nnum = randi([0, 20]); fprintf('Starting num = %d\\n', num); if num > 10 num = num + 5; else num = num - 5; end fprintf('Updated num = %d\\n', num);       Suppose num is a 1 x 1 double . Give the code that increases num by 5 if it is greater than 10, decreases num by 5 if it is less than 10, and does nothing if num is zero.    If x = 0 , the below script runs the commands x = x - 5 and disp(x) , outputting -5 . However, if x = 10 , only the disp(x) command is run, producing an output of 10 .   if x > 10 x = x + 5; elseif x < 10 x = x - 5; end disp(x)     "
},
{
  "id": "conditional-activity-3",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-3",
  "type": "Reading Question",
  "number": "3",
  "title": "Activity 3: Sign Label Function.",
  "body": " Activity 3: Sign Label Function   Write a function that classifies a single number as positive, negative, or zero.     Create a function named sign_label that takes one input x and returns one output label with the value 'positive' , 'negative' , or 'zero' .    function label = sign_label(x) if x > 0 label = 'positive'; elseif x < 0 label = 'negative'; else label = 'zero'; end end      Modify the function so it returns a second output named code with values 1 , -1 , or 0 that match the sign.    function [label, code] = sign_label(x) if x > 0 label = 'positive'; code = 1; elseif x < 0 label = 'negative'; code = -1; else label = 'zero'; code = 0; end end    "
},
{
  "id": "conditional-activity-4",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-4",
  "type": "Reading Question",
  "number": "4",
  "title": "Activity 4: Freeze Alert Function.",
  "body": " Activity 4: Freeze Alert Function   Use a simple if -statement to return a warning message from a temperature input.     Write a function named freeze_alert that takes tempC (a scalar temperature in Celsius) and tempWarn (how close to freezing to warn) and returns message . If tempC is at or below tempWarn , return 'Freeze warning' ; otherwise return 'No warning' .    function message = freeze_alert(tempC, tempWarn) if tempC <= tempWarn message = 'Freeze warning'; else message = 'No warning'; end end      Update the function to return a second output isFreezing that is true or false along with the message.    function [message, isFreezing] = freeze_alert(tempC, tempWarn) if tempC <= 0 message = 'Freeze warning'; isFreezing = true; elseif tempC <= tempWarn message = 'Freeze warning'; isFreezing = false; else message = 'No warning'; isFreezing = false; end end    "
},
{
  "id": "conditional-activity-5",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-5",
  "type": "Reading Question",
  "number": "5",
  "title": "Activity 5: Ticket Price Function.",
  "body": " Activity 5: Ticket Price Function   Write a function that uses if-elseif-else to choose among several price brackets.     Create a function named ticket_price that takes a scalar input age (a single person's age, in years) and returns price using the rules below:   Age less than 13: price = 6  Age from 13 to 64: price = 12  Age 65 or older: price = 8        Modify the function so it returns a second output group and handles invalid ages. If age < 0 , return price = NaN and group = 'invalid' .     "
},
{
  "id": "conditional-activity-6",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-6",
  "type": "Reading Question",
  "number": "6",
  "title": "Activity 6: Letter Grade Function.",
  "body": " Activity 6: Letter Grade Function   Convert a numeric score to a letter grade using range-based conditions.     Write a function named letter_grade that returns 'A' , 'B' , 'C' , 'D' , or 'F' for a scalar score using the standard 90\/80\/70\/60 cutoffs.       Add an input check so that scores outside 0 to 100 return 'invalid' .       Concept check: why must the score >= 90 test appear before the score >= 80 test?     "
},
{
  "id": "conditional-activity-7",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-7",
  "type": "Reading Question",
  "number": "7",
  "title": "Activity 7: Shipping Mode Switch.",
  "body": " Activity 7: Shipping Mode Switch   Use a switch statement to choose among discrete shipping options.     Create a function named shipping_cost that takes a mode input ( 'S' , 'E' , or 'O' ) and returns a scalar cost of 5, 12, or 20.    function cost = shipping_cost(mode) switch mode case 'S' cost = 5; case 'E' cost = 12; case 'O' cost = 20; otherwise cost = NaN; end end      Extend the function so it also accepts full words ( 'standard' , 'express' , and 'overnight' ) in addition to the single-letter codes.    function cost = shipping_cost(mode) switch mode case {'S', 'standard'} cost = 5; case {'E', 'express'} cost = 12; case {'O', 'overnight'} cost = 20; otherwise cost = NaN; end end      Concept check: what happens when mode = 'e' (lowercase), and why?    The otherwise branch runs and returns NaN because switch comparisons are case-sensitive, so 'e' does not match 'E' .    "
},
{
  "id": "conditional-activity-8",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-8",
  "type": "Reading Question",
  "number": "8",
  "title": "Activity 8: Day Type Switch.",
  "body": " Activity 8: Day Type Switch   Map a day number to weekday or weekend status using a switch -statement.     Write a function named day_type that takes an integer dayNum (1 = Monday, 7 = Sunday). Return 'weekday' for 1--5 and 'weekend' for 6--7.       Update the function to return a second output named isWeekend that is true or false for valid days.       Concept check: what should the function return for dayNum = 0 , and which branch handles it?     "
},
{
  "id": "conditional-activity-9",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-9",
  "type": "Reading Question",
  "number": "9",
  "title": "Activity 9: Thermostat Mode Switch.",
  "body": " Activity 9: Thermostat Mode Switch   Use a discrete numeric code to select a thermostat mode.     Create a function named thermostat_mode that takes a numeric code: 0 for off, 1 for heat, and 2 for cool. Return the string 'off' , 'heat' , or 'cool' .       Extend the function to return a second output setPoint . Use 68 for heat, 74 for cool, and NaN for off or invalid codes.     "
},
{
  "id": "conditional-activity-10",
  "level": "2",
  "url": "sec-conditional-statements-7.html#conditional-activity-10",
  "type": "Reading Question",
  "number": "10",
  "title": "Activity 10: Late Fee Function.",
  "body": " Activity 10: Late Fee Function   Use an if-elseif-else chain to assign a fee based on how late something is.     Write a function named late_fee that takes a single number daysLate (the number of days late) and returns fee according to the table below:    daysLate fee    0 or less 0    1 to 3 5    3 to 7 15    more than 7 30         Modify the function to return a second output status with values according to the table below:    daysLate fee status    0 or less 0 on time    1 to 3 5 minor late    3 to 7 15 late    more than 7 30 very late       "
},
{
  "id": "conditional-flow-cqs",
  "level": "1",
  "url": "conditional-flow-cqs.html",
  "type": "Exercises",
  "number": "",
  "title": "🤔💭 Conceptual Questions",
  "body": " 🤔💭 Conceptual Questions    If Statement Requirements   Every if statement in MATLAB must end with the keyword end .    Correct! The end keyword is required to close every if statement, whether it contains just an if block, an if-else , or an if-elseif-else chain.     Else Branch Requirement   An else branch is required in every if statement.    Incorrect. The else branch is optional. If you only need to run code when a condition is true, you can use just an if block without an else .     Elseif Chain Evaluation Order   In an if-elseif-else chain, how does MATLAB determine which block to execute?      MATLAB checks all conditions and runs the block with the highest priority.    Incorrect. MATLAB evaluates conditions in order from top to bottom and stops at the first true condition.      MATLAB checks conditions from top to bottom and runs the first true block.    Correct! Once MATLAB finds a true condition, it executes that block and skips all remaining branches.      MATLAB checks all conditions and runs all blocks whose conditions are true.    Incorrect. Only one block executes in an if-elseif-else chain, even if multiple conditions are true.      MATLAB evaluates conditions randomly.    Incorrect. Conditions are always evaluated in the order they appear in the code.       Switch Case Values   Which of the following statements about switch case values are true? Select all that apply.      The otherwise block is optional.    In a switch statement the otherwise block is optional.      Case values can be numbers.    Correct! Switch cases can match numeric values.      Case values can be strings.    Correct! Switch cases work well with string comparisons.      Case values can use relational operators like > or < .    Incorrect. Switch statements only test for equality. Use if-elseif for range-based conditions.      Multiple case values can be grouped using curly braces { } .    Correct! You can use case {val1, val2, val3} to match multiple values.       Otherwise Branch Behavior   In a switch statement, the otherwise block only runs when none of the case values match.    Correct! The otherwise branch is similar to the else in an if statement—it provides a default action when no cases match.     Switch Case Sensitivity   Consider this code:  status = 'active'; switch status case 'Active' disp('User is active') case 'active' disp('User is online') otherwise disp('Unknown status') end  What will be displayed?      User is active    Incorrect. Case values are case-sensitive, so 'Active' does not match 'active' .      User is online    Correct! The string 'active' exactly matches the second case. Switch comparisons are case-sensitive.      Unknown status    Incorrect. There is a case that matches: the second case 'active' .      An error will occur.    Incorrect. This is valid code; the second case matches and executes.       When to Use Switch vs If   Which scenario is best suited for a switch statement rather than an if-elseif chain?      Comparing a variable to a list of specific string values.    Correct! Switch statements are ideal for testing exact matches against discrete values, especially strings.      Checking if a number falls within different ranges (e.g., 0-10, 10-20).    Incorrect. Range-based conditions require relational operators like > or <= , which switch statements cannot handle. Use if-elseif instead.      Testing multiple logical conditions that use AND ( & ) or OR ( | ).    Incorrect. Switch statements only test for equality. Use if-elseif for complex logical conditions.      Checking if a value is greater than a threshold.    Incorrect. This requires a relational operator ( > ), which switch statements cannot use. Use an if statement.       How Many Blocks Execute?   Given this code:  x = 10; if x > 5 y = 1; elseif x > 8 y = 2; elseif x > 3 y = 3; else y = 0; end  What is the value of y after this code executes?      y = 2    Incorrect. The first condition ( x > 5 ) is true, so MATLAB never checks the second condition.      y = 3    Incorrect. The first condition ( x > 5 ) is true, so MATLAB never checks the third condition.      y = 6 (sum of 1+2+3)    Incorrect. Only one block executes in an if-elseif-else chain. The blocks don't accumulate.      y = 1    Correct! Even though x > 8 and x > 3 are also true, MATLAB stops at the first true condition ( x > 5 ) and assigns y = 1 .       Nested If vs Elseif Chain   What is the main difference between using nested if statements and using an if-elseif chain?      There is no difference; they are equivalent in all cases.    Incorrect. Nested if statements can check multiple conditions independently, while elseif chains are mutually exclusive.      Nested if statements run faster than elseif chains.    Incorrect. Performance is not the key difference; the distinction is in the logic structure and whether branches are mutually exclusive.      Nested if statements can allow multiple blocks to execute; elseif chains execute only one block.    Correct! In an if-elseif-else chain, only one block runs. With nested if statements, multiple independent conditions can be true.      Elseif chains require more end keywords than nested if statements.    Incorrect. Actually, nested if statements require more end keywords (one for each if ), while an elseif chain needs only one.       Duplicate Case Values   What happens if a switch statement contains duplicate case values?      MATLAB runs both matching cases.    Incorrect. MATLAB will actually report an error if you try to use duplicate case values.      MATLAB runs the first matching case and ignores the duplicate.    Incorrect. MATLAB doesn't allow duplicate case values at all.      MATLAB uses the last duplicate case value.    Incorrect. MATLAB won't allow duplicate case values at all.      MATLAB produces an error.    Correct! Duplicate case values are not allowed in MATLAB switch statements and will cause an error.       If Statement Condition Type   Consider this code:  x = 5; if x disp('x is true') else disp('x is false') end  What will be displayed, and why?      x is true , because any non-zero number is treated as true.    Correct! In MATLAB, non-zero values are treated as true in conditional statements, and zero is treated as false.      x is false , because x is not a logical value.    Incorrect. While x is numeric, MATLAB automatically converts non-zero numbers to true in conditional statements.      An error occurs because x is not a logical value.    Incorrect. MATLAB allows numeric values in if conditions and treats non-zero as true and zero as false.      x is false , because 5 is not equal to true .    Incorrect. MATLAB doesn't compare x to true ; it converts non-zero values to true.       "
},
{
  "id": "conditional-flow-concepts",
  "level": "2",
  "url": "conditional-flow-cqs.html#conditional-flow-concepts",
  "type": "Exercise",
  "number": "1",
  "title": "",
  "body": "  If Statement Requirements   Every if statement in MATLAB must end with the keyword end .    Correct! The end keyword is required to close every if statement, whether it contains just an if block, an if-else , or an if-elseif-else chain.     Else Branch Requirement   An else branch is required in every if statement.    Incorrect. The else branch is optional. If you only need to run code when a condition is true, you can use just an if block without an else .     Elseif Chain Evaluation Order   In an if-elseif-else chain, how does MATLAB determine which block to execute?      MATLAB checks all conditions and runs the block with the highest priority.    Incorrect. MATLAB evaluates conditions in order from top to bottom and stops at the first true condition.      MATLAB checks conditions from top to bottom and runs the first true block.    Correct! Once MATLAB finds a true condition, it executes that block and skips all remaining branches.      MATLAB checks all conditions and runs all blocks whose conditions are true.    Incorrect. Only one block executes in an if-elseif-else chain, even if multiple conditions are true.      MATLAB evaluates conditions randomly.    Incorrect. Conditions are always evaluated in the order they appear in the code.       Switch Case Values   Which of the following statements about switch case values are true? Select all that apply.      The otherwise block is optional.    In a switch statement the otherwise block is optional.      Case values can be numbers.    Correct! Switch cases can match numeric values.      Case values can be strings.    Correct! Switch cases work well with string comparisons.      Case values can use relational operators like > or < .    Incorrect. Switch statements only test for equality. Use if-elseif for range-based conditions.      Multiple case values can be grouped using curly braces { } .    Correct! You can use case {val1, val2, val3} to match multiple values.       Otherwise Branch Behavior   In a switch statement, the otherwise block only runs when none of the case values match.    Correct! The otherwise branch is similar to the else in an if statement—it provides a default action when no cases match.     Switch Case Sensitivity   Consider this code:  status = 'active'; switch status case 'Active' disp('User is active') case 'active' disp('User is online') otherwise disp('Unknown status') end  What will be displayed?      User is active    Incorrect. Case values are case-sensitive, so 'Active' does not match 'active' .      User is online    Correct! The string 'active' exactly matches the second case. Switch comparisons are case-sensitive.      Unknown status    Incorrect. There is a case that matches: the second case 'active' .      An error will occur.    Incorrect. This is valid code; the second case matches and executes.       When to Use Switch vs If   Which scenario is best suited for a switch statement rather than an if-elseif chain?      Comparing a variable to a list of specific string values.    Correct! Switch statements are ideal for testing exact matches against discrete values, especially strings.      Checking if a number falls within different ranges (e.g., 0-10, 10-20).    Incorrect. Range-based conditions require relational operators like > or <= , which switch statements cannot handle. Use if-elseif instead.      Testing multiple logical conditions that use AND ( & ) or OR ( | ).    Incorrect. Switch statements only test for equality. Use if-elseif for complex logical conditions.      Checking if a value is greater than a threshold.    Incorrect. This requires a relational operator ( > ), which switch statements cannot use. Use an if statement.       How Many Blocks Execute?   Given this code:  x = 10; if x > 5 y = 1; elseif x > 8 y = 2; elseif x > 3 y = 3; else y = 0; end  What is the value of y after this code executes?      y = 2    Incorrect. The first condition ( x > 5 ) is true, so MATLAB never checks the second condition.      y = 3    Incorrect. The first condition ( x > 5 ) is true, so MATLAB never checks the third condition.      y = 6 (sum of 1+2+3)    Incorrect. Only one block executes in an if-elseif-else chain. The blocks don't accumulate.      y = 1    Correct! Even though x > 8 and x > 3 are also true, MATLAB stops at the first true condition ( x > 5 ) and assigns y = 1 .       Nested If vs Elseif Chain   What is the main difference between using nested if statements and using an if-elseif chain?      There is no difference; they are equivalent in all cases.    Incorrect. Nested if statements can check multiple conditions independently, while elseif chains are mutually exclusive.      Nested if statements run faster than elseif chains.    Incorrect. Performance is not the key difference; the distinction is in the logic structure and whether branches are mutually exclusive.      Nested if statements can allow multiple blocks to execute; elseif chains execute only one block.    Correct! In an if-elseif-else chain, only one block runs. With nested if statements, multiple independent conditions can be true.      Elseif chains require more end keywords than nested if statements.    Incorrect. Actually, nested if statements require more end keywords (one for each if ), while an elseif chain needs only one.       Duplicate Case Values   What happens if a switch statement contains duplicate case values?      MATLAB runs both matching cases.    Incorrect. MATLAB will actually report an error if you try to use duplicate case values.      MATLAB runs the first matching case and ignores the duplicate.    Incorrect. MATLAB doesn't allow duplicate case values at all.      MATLAB uses the last duplicate case value.    Incorrect. MATLAB won't allow duplicate case values at all.      MATLAB produces an error.    Correct! Duplicate case values are not allowed in MATLAB switch statements and will cause an error.       If Statement Condition Type   Consider this code:  x = 5; if x disp('x is true') else disp('x is false') end  What will be displayed, and why?      x is true , because any non-zero number is treated as true.    Correct! In MATLAB, non-zero values are treated as true in conditional statements, and zero is treated as false.      x is false , because x is not a logical value.    Incorrect. While x is numeric, MATLAB automatically converts non-zero numbers to true in conditional statements.      An error occurs because x is not a logical value.    Incorrect. MATLAB allows numeric values in if conditions and treats non-zero as true and zero as false.      x is false , because 5 is not equal to true .    Incorrect. MATLAB doesn't compare x to true ; it converts non-zero values to true.      "
},
{
  "id": "subsec-for-structure",
  "level": "1",
  "url": "subsec-for-structure.html",
  "type": "Subsection",
  "number": "",
  "title": "The for Loop",
  "body": " The for Loop  Imagine you want to print the message Hello! five times. Without loops, you would write the same command repeatedly. With a loop, it is much cleaner:    Without Loops  fprintf('Hello!\\n') fprintf('Hello!\\n') fprintf('Hello!\\n') fprintf('Hello!\\n') fprintf('Hello!\\n')    With a for-Loop  for i = 1:5 fprintf('Hello!\\n') end    The for -loop version is shorter, clearer, and easier to modify. If you later need 100 repetitions instead of 5, you only change one number rather than copying and pasting 95 more lines.  A for -loop repeats a block of code once for each value in a specified list. This is the right tool when you know in advance how many times you want to repeat some code.   for -Loop Structure  There are two basic options for defining a for loop in MATLAB:   % Fixed range with step size for k = start:step:stop blockToRepeat end  % Explicit list of values for k = [v1, v2, v3, ... vn] blockToRepeat end   Key rules:  The variable k is called the loop variable or loop index and can be named anything.  The loop automatically updates k to the next value after each iteration.  Every for -loop must end with end .  You can place any code inside a loop, including other loops.      Sample Usage of the start:step:stop . When you don't specify a step, it defaults to 1.    Expression  Resulting List    1:10 [1, 2, 3, ..., 10]    1:2:10 [1, 3, 5, 7, 9]    1:n [1, 2, 3, ..., n]    n:-1:1 [n, n-1, n-2, ..., 1]    0.5: 0.5 :2 [0.5, 1.0, 1.5, 2.0]     Here is a concrete example showing repeated calculations. Suppose you want to compute and display several powers of 2. Without a loop, you must explicitly write each calculation:    Without Loops ⤵︎  n = 1; x = 2^n; fprintf('2^%i = %i\\n', n, x) n = 2; x = 2^n; fprintf('2^%i = %i\\n', n, x) n = 3; x = 2^n; fprintf('2^%i = %i\\n', n, x) n = 4; x = 2^n; fprintf('2^%i = %i\\n', n, x) n = 5; x = 2^n; fprintf('2^%i = %i\\n', n, x)    With a for-Loop ⤵︎  for n = 1:5 x = 2^n; fprintf('2^%i = %i\\n', n, x) end    Both versions produce the same output: 2^1 = 2 , 2^2 = 4 , 2^3 = 8 , 2^4 = 16 , and 2^5 = 32 . The loop version eliminates redundancy by automatically updating the loop variable n from 1 to 5.  Before writing a loop, identify: (1) what changes each iteration (the loop variable), and (2) what you want to update as the loop runs (for example, a running total or an output variable).   Accumulating a Sum   A common loop pattern is accumulation : start with an initial value, then repeatedly update it. Here we compute the sum :    totalsum = 0; % initialize for i = 1:5 totalsum = totalsum + i; end fprintf('Total sum: %i\\n', totalsum)    The variable totalsum starts at 0, then adds 1, then 2, and so on, reaching 15. Compare this to MATLAB's built-in sum(1:5) , which gives the same result. The loop version shows you the logic step by step.     Running Sum and Product   This example shows two standard accumulation patterns: a running sum (initialize at 0) and a running product (initialize at 1).  N = 10; sum_total = 0; prod_total = 1; for k = 1:N sum_total = sum_total + k; prod_total = prod_total * k; end sum_total prod_total  After the loop completes, sum_total holds , and prod_total holds (which is ).    "
},
{
  "id": "for-loop-structure-4",
  "level": "2",
  "url": "subsec-for-structure.html#for-loop-structure-4",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "loop variable loop index "
},
{
  "id": "subsec-for-structure-7",
  "level": "2",
  "url": "subsec-for-structure.html#subsec-for-structure-7",
  "type": "Table",
  "number": "2.18",
  "title": "Sample Usage of the <code class=\"code-inline tex2jax_ignore language-matlab\">start:step:stop<\/code>. When you don’t specify a step, it defaults to 1.",
  "body": " Sample Usage of the start:step:stop . When you don't specify a step, it defaults to 1.    Expression  Resulting List    1:10 [1, 2, 3, ..., 10]    1:2:10 [1, 3, 5, 7, 9]    1:n [1, 2, 3, ..., n]    n:-1:1 [n, n-1, n-2, ..., 1]    0.5: 0.5 :2 [0.5, 1.0, 1.5, 2.0]    "
},
{
  "id": "ex_forexampleonsums",
  "level": "2",
  "url": "subsec-for-structure.html#ex_forexampleonsums",
  "type": "🌌 Example",
  "number": "2.19",
  "title": "Accumulating a Sum.",
  "body": " Accumulating a Sum   A common loop pattern is accumulation : start with an initial value, then repeatedly update it. Here we compute the sum :    totalsum = 0; % initialize for i = 1:5 totalsum = totalsum + i; end fprintf('Total sum: %i\\n', totalsum)    The variable totalsum starts at 0, then adds 1, then 2, and so on, reaching 15. Compare this to MATLAB's built-in sum(1:5) , which gives the same result. The loop version shows you the logic step by step.   "
},
{
  "id": "subsec-for-structure-13",
  "level": "2",
  "url": "subsec-for-structure.html#subsec-for-structure-13",
  "type": "🌌 Example",
  "number": "2.20",
  "title": "Running Sum and Product.",
  "body": " Running Sum and Product   This example shows two standard accumulation patterns: a running sum (initialize at 0) and a running product (initialize at 1).  N = 10; sum_total = 0; prod_total = 1; for k = 1:N sum_total = sum_total + k; prod_total = prod_total * k; end sum_total prod_total  After the loop completes, sum_total holds , and prod_total holds (which is ).   "
},
{
  "id": "sec-while-loops",
  "level": "1",
  "url": "sec-while-loops.html",
  "type": "Subsection",
  "number": "",
  "title": "The while Loop",
  "body": " The while Loop  Sometimes you need to repeat code until a specific condition changes, but you do not know in advance how many iterations that will take. For example, suppose you want to double a number until it exceeds 1000:    Without Loops  num = 1; num = num * 2; % 2 num = num * 2; % 4 num = num * 2; % 8 num = num * 2; % 16 num = num * 2; % 32 num = num * 2; % 64 num = num * 2; % 128 num = num * 2; % 256 num = num * 2; % 512 num = num * 2; % 1024 fprintf('Final value: %i\\n', num)    With a while-Loop  num = 1; while num <= 1000 num = num * 2; end fprintf('Final value: %i\\n', num)    The loop version automatically stops when num exceeds 1000. Without a loop, you must manually count iterations and hope you wrote enough (or not too many) doubling operations. If you change the starting value or the threshold, the loop still works without modification, but the explicit version would need rewriting.  A good way to understand a while -loop is to think of it as a repeating if -statement. It checks the condition, runs the code if true, then checks again, and so on until the condition becomes false.    With an if-statement ⤵︎  num = 5; if num <= 50 num = num * 2; end  num = 5 → 10 .    With a while-Loop ⤵︎  num = 5; while num <= 50 num = num * 2; end  num: 5 → 10 → 20 → 40 → 80 .     while -Loop Structure  The basic syntax is:  while loop_condition code_block end  MATLAB repeatedly executes code_block as long as loop_condition evaluates to true . Think of it like an if -statement that jumps back to the top and checks the condition again.  Key requirements:  The condition must be true initially, or the loop body never runs.  Something inside the loop must eventually make the condition false, or you create an infinite loop .  Every while -loop must end with end .    If MATLAB becomes unresponsive due to an infinite loop, press Ctrl+C (Windows) or Command+C (Mac) to stop execution.   Here is a simple example you can trace by hand:    While loop ⤵︎  loop = 0; x = 10; while loop < 2 loop = loop + 1; x = 2*(x + loop); end ratio = x\/loop    Written out ⤵︎  loop = 0 x = 10 (is loop < 2? Yes → enter while) loop = 0 + 1 = 1 x = 2*(10 + 1) = 22 (is loop < 2? Yes → enter while again) loop = 1 + 1 = 2 x = 2*(22 + 2) = 48 (is loop < 2? No → exit while) ratio = 48\/2 = 24     Example: Summing Until a Threshold   Find the first integer such that .  the_sum = 0; k = 1; while the_sum < 10 the_sum = the_sum + 1\/k; k = k + 1; end N = k - 1 the_sum  The loop adds terms until the sum crosses 10. Since k is incremented after adding each term, the first successful value is N = k - 1 .    "
},
{
  "id": "while-loop-structure-5",
  "level": "2",
  "url": "sec-while-loops.html#while-loop-structure-5",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "infinite loop "
},
{
  "id": "ssub-while-harmonic-threshold",
  "level": "2",
  "url": "sec-while-loops.html#ssub-while-harmonic-threshold",
  "type": "🌌 Example",
  "number": "2.21",
  "title": "Example: Summing Until a Threshold.",
  "body": " Example: Summing Until a Threshold   Find the first integer such that .  the_sum = 0; k = 1; while the_sum < 10 the_sum = the_sum + 1\/k; k = k + 1; end N = k - 1 the_sum  The loop adds terms until the sum crosses 10. Since k is incremented after adding each term, the first successful value is N = k - 1 .   "
},
{
  "id": "subsec-for-vs-while",
  "level": "1",
  "url": "subsec-for-vs-while.html",
  "type": "Subsection",
  "number": "",
  "title": "Which to Use: for vs. while",
  "body": " Which to Use: for vs. while  Both for -loops and while -loops repeat code, but they serve different purposes. Choose the loop that matches your situation to make your code easier to read and understand.   Comparing for-loops and while-loops    Feature  for -loops  while -loops    Requires  a fixed list of values (often 1:N )  a logical condition    Behavior  repeats once per value in the list  repeats while the condition is true    Terminates  after the last value is used  when the condition becomes false    Best when  you know exactly how many iterations you need  you do not know how many iterations you will need     Technically, any for -loop can be rewritten as a while -loop and vice versa. However, using the loop that naturally fits the problem makes your code clearer.  "
},
{
  "id": "tab-for-vs-while",
  "level": "2",
  "url": "subsec-for-vs-while.html#tab-for-vs-while",
  "type": "Table",
  "number": "2.22",
  "title": "Comparing for-loops and while-loops",
  "body": " Comparing for-loops and while-loops    Feature  for -loops  while -loops    Requires  a fixed list of values (often 1:N )  a logical condition    Behavior  repeats once per value in the list  repeats while the condition is true    Terminates  after the last value is used  when the condition becomes false    Best when  you know exactly how many iterations you need  you do not know how many iterations you will need    "
},
{
  "id": "sec-additional-flow-control",
  "level": "1",
  "url": "sec-additional-flow-control.html",
  "type": "Subsection",
  "number": "",
  "title": "Additional Flow Control: continue, break, return",
  "body": " Additional Flow Control: continue, break, return  MATLAB provides commands that modify normal loop flow. These are most often used inside an if -statement within a loop.   Flow control commands for loops    Command  Effect    continue  Skip the rest of the current iteration and move to the next iteration.    break  Exit the loop immediately and continue after end .    return  Exit the current script or function immediately.     Important notes:  These commands only execute if MATLAB reaches the line where they appear.  continue and break may only be used inside a for - or while -loop; using them elsewhere causes an error.  return can be used anywhere inside a script or function to exit early.     Searching with break   A loop can search for a target value and stop early when found. The break command exits the loop immediately.  target = 10; found = false; location = -1; for k = 1:50 value = randi([-20 20]); % generate one random integer if value == target found = true; location = k; break end end if found fprintf('The number %i was found on iteration %i\\n', target, location) else fprintf('The number %i was not found in 50 trials\\n', target) end  This pattern—test a condition, then exit early with break —is useful whenever you want to stop searching once you find what you need.     Example: Testing for Primality   An integer greater than 1 is prime if it has no divisors other than 1 and itself. This loop tests potential divisors and stops early if it finds one:  number = 75913; if number < 2 is_prime = false; else divider = 2; is_prime = true; while divider <= sqrt(number) if mod(number, divider) == 0 is_prime = false; break end divider = divider + 1; end end if is_prime fprintf('The number %0.10g is prime!\\n', number) else fprintf('The number %0.10g is not prime!\\n', number) end  We only need to test divisors up to , which makes the loop much faster for large inputs. The break command exits as soon as a divisor is found.    "
},
{
  "id": "tab-loop-flow-control",
  "level": "2",
  "url": "sec-additional-flow-control.html#tab-loop-flow-control",
  "type": "Table",
  "number": "2.23",
  "title": "Flow control commands for loops",
  "body": " Flow control commands for loops    Command  Effect    continue  Skip the rest of the current iteration and move to the next iteration.    break  Exit the loop immediately and continue after end .    return  Exit the current script or function immediately.    "
},
{
  "id": "sec-additional-flow-control-5",
  "level": "2",
  "url": "sec-additional-flow-control.html#sec-additional-flow-control-5",
  "type": "🌌 Example",
  "number": "2.24",
  "title": "Searching with break.",
  "body": " Searching with break   A loop can search for a target value and stop early when found. The break command exits the loop immediately.  target = 10; found = false; location = -1; for k = 1:50 value = randi([-20 20]); % generate one random integer if value == target found = true; location = k; break end end if found fprintf('The number %i was found on iteration %i\\n', target, location) else fprintf('The number %i was not found in 50 trials\\n', target) end  This pattern—test a condition, then exit early with break —is useful whenever you want to stop searching once you find what you need.   "
},
{
  "id": "while-primality-test",
  "level": "2",
  "url": "sec-additional-flow-control.html#while-primality-test",
  "type": "🌌 Example",
  "number": "2.25",
  "title": "Example: Testing for Primality.",
  "body": " Example: Testing for Primality   An integer greater than 1 is prime if it has no divisors other than 1 and itself. This loop tests potential divisors and stops early if it finds one:  number = 75913; if number < 2 is_prime = false; else divider = 2; is_prime = true; while divider <= sqrt(number) if mod(number, divider) == 0 is_prime = false; break end divider = divider + 1; end end if is_prime fprintf('The number %0.10g is prime!\\n', number) else fprintf('The number %0.10g is not prime!\\n', number) end  We only need to test divisors up to , which makes the loop much faster for large inputs. The break command exits as soon as a divisor is found.   "
},
{
  "id": "subsec-loop-class-activities",
  "level": "1",
  "url": "subsec-loop-class-activities.html",
  "type": "🧑🏻‍💻 Class Activities",
  "number": "",
  "title": "🧑🏻‍💻 Class Activities",
  "body": "  These activities will help you practice using loops to solve interesting problems. Each activity requires only loops, variables, and basic arithmetic—no arrays needed.    The Collatz Conjecture    The Collatz conjecture is one of mathematics' most famous unsolved problems. Start with any positive integer n . If it is even, divide it by 2. If it is odd, multiply by 3 and add 1. Repeat this process until you reach 1.  For example, starting with 6:   Write a MATLAB script that:  Starts with a user-chosen positive integer n .  Uses a while -loop to apply the Collatz rules repeatedly until reaching 1.  Displays each number in the sequence.  Reports how many steps it took to reach 1.      Use mod(n, 2) == 0 to check if n is even. Keep a counter variable that increments each iteration.       Challenge: Test your script with different starting values. Can you find a starting number that takes more than 100 steps?      Digital Root Calculator    The digital root of a number is found by repeatedly summing its digits until only a single digit remains. For example, the digital root of 9875 is found by:   Write a MATLAB script that computes the digital root of any positive integer n using a while -loop. You can extract the rightmost digit of n using mod(n, 10) , and remove it using floor(n\/10) .  Your script should:  Accept a positive integer as input.  Use an outer loop that repeats until n has only one digit.  Use an inner loop to sum the digits of the current value of n .  Display the digital root.      Start with an outer loop: while n >= 10 . Inside, use an inner loop to extract and sum digits, then update n to this sum.       Extension: Test your script with numbers like 38, 99, 123456, and 999999. What patterns do you notice?      Approximating Pi with Leibniz's Formula    The Leibniz formula for states that:   This infinite series converges slowly to , but we can approximate it by adding many terms.  Write a MATLAB script that:  Uses a for -loop to compute the sum of the first 1000 terms.  Multiplies the result by 4 to approximate .  Compares your approximation to MATLAB's built-in pi value.  Reports the error (absolute difference).     Hint: The denominators are odd numbers (1, 3, 5, 7, ...) which follow the pattern when looping with k = 1:1000 . Signs alternate, so use (-1)^(k+1) to generate the alternating signs.       Extension: How many terms are needed to get within 0.001 of pi ? Convert your for -loop to a while -loop that stops when the error is small enough.      Finding Fibonacci Numbers    The Fibonacci sequence begins 0, 1, 1, 2, 3, 5, 8, 13, 21, ... where each number is the sum of the two preceding numbers.  Write a MATLAB script that:  Uses a while -loop to generate Fibonacci numbers until one exceeds 10,000.  Displays each Fibonacci number as it is computed.  Reports which Fibonacci number was the first to exceed 10,000.     Hint: You only need three variables: the current Fibonacci number, the previous one, and the one before that. Use a pattern like:  prev2 = 0; prev1 = 1; while prev1 < 10000 current = prev2 + prev1; % display and update variables end       Extension: Modify your script to compute the ratio of consecutive Fibonacci numbers (e.g., ). What value does this ratio approach as increases?      Perfect Number Detector    A perfect number is a positive integer that equals the sum of its proper divisors (positive divisors excluding itself). For example, 6 is perfect because .  Write a MATLAB script that:  Prompts the user for a positive integer.  Uses a for -loop to find all proper divisors (numbers that divide evenly into the input).  Computes the sum of these divisors.  Determines whether the number is perfect, abundant (sum exceeds the number), or deficient (sum is less than the number).  Displays the classification and the sum of divisors.     Hint: Use mod(n, k) == 0 to test if k divides n evenly. Loop from 1 to n-1 .       Extension: The first four perfect numbers are 6, 28, 496, and 8128. Write a script using nested loops to search for all perfect numbers less than 10,000.     "
},
{
  "id": "activity-collatz-conjecture",
  "level": "2",
  "url": "subsec-loop-class-activities.html#activity-collatz-conjecture",
  "type": "Reading Question",
  "number": "1",
  "title": "The Collatz Conjecture.",
  "body": " The Collatz Conjecture    The Collatz conjecture is one of mathematics' most famous unsolved problems. Start with any positive integer n . If it is even, divide it by 2. If it is odd, multiply by 3 and add 1. Repeat this process until you reach 1.  For example, starting with 6:   Write a MATLAB script that:  Starts with a user-chosen positive integer n .  Uses a while -loop to apply the Collatz rules repeatedly until reaching 1.  Displays each number in the sequence.  Reports how many steps it took to reach 1.      Use mod(n, 2) == 0 to check if n is even. Keep a counter variable that increments each iteration.       Challenge: Test your script with different starting values. Can you find a starting number that takes more than 100 steps?    "
},
{
  "id": "activity-digital-root-calculator",
  "level": "2",
  "url": "subsec-loop-class-activities.html#activity-digital-root-calculator",
  "type": "Reading Question",
  "number": "2",
  "title": "Digital Root Calculator.",
  "body": " Digital Root Calculator    The digital root of a number is found by repeatedly summing its digits until only a single digit remains. For example, the digital root of 9875 is found by:   Write a MATLAB script that computes the digital root of any positive integer n using a while -loop. You can extract the rightmost digit of n using mod(n, 10) , and remove it using floor(n\/10) .  Your script should:  Accept a positive integer as input.  Use an outer loop that repeats until n has only one digit.  Use an inner loop to sum the digits of the current value of n .  Display the digital root.      Start with an outer loop: while n >= 10 . Inside, use an inner loop to extract and sum digits, then update n to this sum.       Extension: Test your script with numbers like 38, 99, 123456, and 999999. What patterns do you notice?    "
},
{
  "id": "activity-approximating-pi",
  "level": "2",
  "url": "subsec-loop-class-activities.html#activity-approximating-pi",
  "type": "Reading Question",
  "number": "3",
  "title": "Approximating Pi with Leibniz’s Formula.",
  "body": " Approximating Pi with Leibniz's Formula    The Leibniz formula for states that:   This infinite series converges slowly to , but we can approximate it by adding many terms.  Write a MATLAB script that:  Uses a for -loop to compute the sum of the first 1000 terms.  Multiplies the result by 4 to approximate .  Compares your approximation to MATLAB's built-in pi value.  Reports the error (absolute difference).     Hint: The denominators are odd numbers (1, 3, 5, 7, ...) which follow the pattern when looping with k = 1:1000 . Signs alternate, so use (-1)^(k+1) to generate the alternating signs.       Extension: How many terms are needed to get within 0.001 of pi ? Convert your for -loop to a while -loop that stops when the error is small enough.    "
},
{
  "id": "activity-fibonacci-threshold",
  "level": "2",
  "url": "subsec-loop-class-activities.html#activity-fibonacci-threshold",
  "type": "Reading Question",
  "number": "4",
  "title": "Finding Fibonacci Numbers.",
  "body": " Finding Fibonacci Numbers    The Fibonacci sequence begins 0, 1, 1, 2, 3, 5, 8, 13, 21, ... where each number is the sum of the two preceding numbers.  Write a MATLAB script that:  Uses a while -loop to generate Fibonacci numbers until one exceeds 10,000.  Displays each Fibonacci number as it is computed.  Reports which Fibonacci number was the first to exceed 10,000.     Hint: You only need three variables: the current Fibonacci number, the previous one, and the one before that. Use a pattern like:  prev2 = 0; prev1 = 1; while prev1 < 10000 current = prev2 + prev1; % display and update variables end       Extension: Modify your script to compute the ratio of consecutive Fibonacci numbers (e.g., ). What value does this ratio approach as increases?    "
},
{
  "id": "activity-perfect-numbers",
  "level": "2",
  "url": "subsec-loop-class-activities.html#activity-perfect-numbers",
  "type": "Reading Question",
  "number": "5",
  "title": "Perfect Number Detector.",
  "body": " Perfect Number Detector    A perfect number is a positive integer that equals the sum of its proper divisors (positive divisors excluding itself). For example, 6 is perfect because .  Write a MATLAB script that:  Prompts the user for a positive integer.  Uses a for -loop to find all proper divisors (numbers that divide evenly into the input).  Computes the sum of these divisors.  Determines whether the number is perfect, abundant (sum exceeds the number), or deficient (sum is less than the number).  Displays the classification and the sum of divisors.     Hint: Use mod(n, k) == 0 to test if k divides n evenly. Loop from 1 to n-1 .       Extension: The first four perfect numbers are 6, 28, 496, and 8128. Write a script using nested loops to search for all perfect numbers less than 10,000.    "
},
{
  "id": "fn-exercises",
  "level": "1",
  "url": "fn-exercises.html",
  "type": "Exercises",
  "number": "2.6",
  "title": "💻 Coding Problems",
  "body": " 💻 Coding Problems   Simple Programs (Variables, Functions, and Scripts)   Answer the following questions to check your understanding of functions.    Temperature Conversion   Write a function named celsius_to_fahrenheit that converts a temperature from Celsius to Fahrenheit.  The conversion formula is:       Inputs:   celsius (1x1) double — temperature in degrees Celsius     Outputs:   fahrenheit (1x1) double — temperature in degrees Fahrenheit     Test cases:  % Test 1: Freezing point of water f1 = celsius_to_fahrenheit(0) % Expected: f1 = 32 % Test 2: Boiling point of water f2 = celsius_to_fahrenheit(100) % Expected: f2 = 212 % Test 3: Room temperature f3 = celsius_to_fahrenheit(20) % Expected: f3 = 68     Triangle Area   Write a function named triangle_area that computes the area of a triangle given its base and height.  The area formula is:       Inputs:   base (1x1) double — length of the triangle's base       height (1x1) double — height of the triangle     Outputs:   area (1x1) double — area of the triangle     Test cases:  % Test 1: Simple triangle a1 = triangle_area(6, 4) % Expected: a1 = 12 % Test 2: Right triangle a2 = triangle_area(5, 12) % Expected: a2 = 30 % Test 3: Decimal values a3 = triangle_area(7.5, 3.2) % Expected: a3 = 12     Sphere Properties   Write a function named sphere_properties that computes both the surface area and volume of a sphere given its radius.  The formulas are:  Surface area:  Volume:        Inputs:   radius (1x1) double — radius of the sphere     Outputs:   surface_area (1x1) double — surface area of the sphere       volume (1x1) double — volume of the sphere     Test cases:  % Test 1: Unit sphere [A1, V1] = sphere_properties(1) % Expected: A1 ≈ 12.5664, V1 ≈ 4.1888 % Test 2: Radius of 2 [A2, V2] = sphere_properties(2) % Expected: A2 ≈ 50.2655, V2 ≈ 33.5103 % Test 3: Radius of 5 [A3, V3] = sphere_properties(5) % Expected: A3 ≈ 314.1593, V3 ≈ 523.5988     Cylinder Properties   Write a function named cylinder_properties that computes the surface area, volume, and diagonal of a cylinder given its radius and height.  The formulas are:  Surface area:  Volume:  Diagonal: ?  Part of this problem is determining the correct formula for the diagonal of a cylinder. Hint: take out a piece of paper and sketch the cylinder, then draw the diagonal line from one edge of the base to the opposite edge of the top.       Inputs:   radius (1x1) double — radius of the cylinder       height (1x1) double — height of the cylinder     Outputs:   surface_area (1x1) double — total surface area of the cylinder       volume (1x1) double — volume of the cylinder       diagonal (1x1) double — diagonal length     Test cases:  % Test 1: Unit cylinder (radius = 1, height = 1) [A1, V1, d1] = cylinder_properties(1, 1) % Expected: A1 ≈ 12.5664, V1 ≈ 3.1416, d1 ≈ 2.2361 % Test 2: Radius = 3, height = 5 [A2, V2, d2] = cylinder_properties(3, 5) % Expected: A2 ≈ 150.7964, V2 ≈ 141.3717, d2 ≈ 7.8102 % Test 3: Radius = 2.5, height = 8 [A3, V3, d3] = cylinder_properties(2.5, 8) % Expected: A3 ≈ 164.9336, V3 ≈ 157.0796, d3 ≈ 9.4340     Compound Interest Calculator   Write a function named compound_interest that calculates the future value of an investment with compound interest, and also returns the total interest earned and the effective annual rate.  The compound interest formula is:   where:  = principal (initial investment)  = annual interest rate (as a decimal, e.g., 0.05 for 5%)  = number of times interest is compounded per year  = time in years  = final amount    The effective annual rate (EAR) is:       Inputs:   principal (1x1) double — initial investment amount       rate (1x1) double — annual interest rate (as decimal)       compounds_per_year (1x1) double — compounding frequency (e.g., 12 for monthly)       years (1x1) double — time period in years     Outputs:   final_amount (1x1) double — total amount after compound interest       interest_earned (1x1) double — total interest earned (final_amount - principal)       effective_rate (1x1) double — effective annual rate     Test cases:  % Test 1: $1000 at 5% annual rate, compounded monthly for 10 years [final1, int1, effRate1] = compound_interest(1000, 0.05, 12, 10) % Expected: final1 ≈ 1647.01, int1 ≈ 647.01, effRate1 ≈ 0.0512 % Test 2: $5000 at 3% annual rate, compounded quarterly for 5 years [final2, int2, effRate2] = compound_interest(5000, 0.03, 4, 5) % Expected: final2 ≈ 5805.92, int2 ≈ 805.92, effRate2 ≈ 0.03034 % Test 3: $10000 at 6% annual rate, compounded daily for 20 years [final3, int3, effRate3] = compound_interest(10000, 0.06, 365, 20) % Expected: final3 ≈ 33197.90, int3 ≈ 23197.90, effRate3 ≈ 0.0618     Triangle Perimeter and Area in 3D Space   Write a function named triangle_3d that computes the perimeter and area of a triangle in 3D space given the coordinates of its three vertices. You may assume the three points do not lie on the same straight line. This ensures a valid triangle.  Hints:   The distance formula between two points and is:     If the side lengths of the triangle are , , and , then the area is given by Heron's formula: where (known as the semi-perimeter).         Inputs:   x1, y1, z1 (1x1) double — coordinates of first vertex       x2, y2, z2 (1x1) double — coordinates of second vertex       x3, y3, z3 (1x1) double — coordinates of third vertex     Outputs:   perimeter (1x1) double — perimeter of the triangle       area (1x1) double — area of the triangle      Note: Typically you would pass coordinates as vectors or matrices, but we will save that for later exercises.   Test cases:  % Test 1: Triangle in xy-plane (vertices at (0,0,0), (4,0,0), (0,3,0)) [p1, a1] = triangle_3d(0, 0, 0, 4, 0, 0, 0, 3, 0) % Expected: p1 = 12, a1 = 6 (3-4-5 right triangle) % Test 2: Equilateral triangle in space [p2, a2] = triangle_3d(0, 0, 0, 1, 0, 0, 0.5, sqrt(3)\/2, 0) % Expected: p2 = 3, a2 ≈ 0.4330 % Test 3: Triangle with vertices at (1,2,3), (4,5,6), (2,3,5) [p3, a3] = triangle_3d(1, 2, 3, 4, 5, 6, 2, 3, 5) % Expected: p3 ≈ 10.6456, a3 ≈ 2.1213      Conditional Flow (if and switch statements)   Number in Range   Write a function named is_in_range that determines whether a number falls within a specified range (inclusive).      Inputs:   value (1x1) double — the number to check       lower_bound (1x1) double — minimum value of the range       upper_bound (1x1) double — maximum value of the range     Outputs:   result (1x1) logical — true if value is in range [lower_bound, upper_bound], false otherwise     Test cases:  % Test 1: Value in range r1 = is_in_range(5, 1, 10) % Expected: r1 = 1 (true) % Test 2: Value at lower boundary r2 = is_in_range(1, 1, 10) % Expected: r2 = 1 (true) % Test 3: Value at upper boundary r3 = is_in_range(10, 1, 10) % Expected: r3 = 1 (true) % Test 4: Value below range r4 = is_in_range(0, 1, 10) % Expected: r4 = 0 (false) % Test 5: Value above range r5 = is_in_range(11, 1, 10) % Expected: r5 = 0 (false)     Tax Bracket Rate Finder   Write a function named find_tax_rate that determines the marginal tax rate for a given income based on progressive tax brackets.  Tax bracket rates:  Income up to $10,000: 0% tax rate  Income from $10,001 to $40,000: 10% tax rate  Income from $40,001 to $85,000: 15% tax rate  Income above $85,000: 20% tax rate        Inputs:   income (1x1) double — annual income in dollars     Outputs:   tax_rate (1x1) double — the marginal tax rate (as a decimal, e.g., 0.10 for 10%)     Test cases:  % Test 1: No tax bracket t1 = find_tax_rate(8000) % Expected: t1 = 0 % Test 2: 10% bracket t2 = find_tax_rate(25000) % Expected: t2 = 0.10 % Test 3: 15% bracket t3 = find_tax_rate(60000) % Expected: t3 = 0.15 % Test 4: 20% bracket t4 = find_tax_rate(100000) % Expected: t4 = 0.20 % Test 5: Boundary case t5 = find_tax_rate(40000) % Expected: t5 = 0.10     Water Phase Identifier   Write a function named water_phase that determines the physical state of water (ice, liquid, or steam) based on temperature in Celsius at standard atmospheric pressure.  Phase rules:  Below 0°C: ice  From 0°C to 100°C (inclusive): liquid  Above 100°C: steam        Inputs:   temp_celsius (1x1) double — temperature in Celsius     Outputs:   phase (1x1) string — \"ice\", \"liquid\", or \"steam\"     Test cases:  % Test 1: Below freezing p1 = water_phase(-10) % Expected: p1 = \"ice\" % Test 2: Freezing point p2 = water_phase(0) % Expected: p2 = \"liquid\" % Test 3: Room temperature p3 = water_phase(25) % Expected: p3 = \"liquid\" % Test 4: Boiling point p4 = water_phase(100) % Expected: p4 = \"liquid\" % Test 5: Above boiling p5 = water_phase(120) % Expected: p5 = \"steam\"     BMI Category Classifier   Write a function named bmi_category that calculates Body Mass Index (BMI) and classifies it into standard health categories.  BMI is calculated as:   Categories:  BMI < 18.5: \"Underweight\"  BMI 18.5 to 24.9: \"Normal weight\"  BMI 25 to 29.9: \"Overweight\"  BMI ≥ 30: \"Obese\"        Inputs:   weight_kg (1x1) double — weight in kilograms       height_m (1x1) double — height in meters     Outputs:   category (1x1) string — the BMI category     Test cases:  % Test 1: Underweight c1 = bmi_category(50, 1.75) % Expected: c1 = \"Underweight\" % Test 2: Normal weight c2 = bmi_category(70, 1.75) % Expected: c2 = \"Normal weight\" % Test 3: Overweight c3 = bmi_category(85, 1.75) % Expected: c3 = \"Overweight\" % Test 4: Obese c4 = bmi_category(100, 1.75) % Expected: c4 = \"Obese\" % Test 5: Boundary case c5 = bmi_category(75.5, 1.75) % Expected: c5 = \"Normal weight\"     Even and Positive   Write a function named is_even_and_positive that determines whether a number is both even and positive.  A number is even if dividing it by 2 produces no remainder. You can use the mod function to find remainders.      Inputs:   num (1x1) double — the number to check     Outputs:   result (1x1) logical — true if num is both even and positive, false otherwise     Test cases:  % Test 1: Even and positive r1 = is_even_and_positive(4) % Expected: r1 = 1 (true) % Test 2: Odd and positive r2 = is_even_and_positive(7) % Expected: r2 = 0 (false) % Test 3: Even and negative r3 = is_even_and_positive(-6) % Expected: r3 = 0 (false) % Test 4: Zero (even but not positive) r4 = is_even_and_positive(0) % Expected: r4 = 0 (false) % Test 5: Large even positive r5 = is_even_and_positive(100) % Expected: r5 = 1 (true)     Exclusive OR (XOR)   Write a function named my_xor that implements the exclusive OR operation without using MATLAB's built-in xor function.  XOR returns true when exactly one (but not both) of the inputs is true. Think about how you can combine AND, OR, and NOT operators to achieve this behavior.      Inputs:   a (1x1) logical — first logical value       b (1x1) logical — second logical value     Outputs:   result (1x1) logical — true if exactly one input is true, false otherwise     Test cases:  % Test 1: Both false r1 = my_xor(false, false) % Expected: r1 = 0 (false) % Test 2: First true, second false r2 = my_xor(true, false) % Expected: r2 = 1 (true) % Test 3: First false, second true r3 = my_xor(false, true) % Expected: r3 = 1 (true) % Test 4: Both true r4 = my_xor(true, true) % Expected: r4 = 0 (false)     Parking Fee Calculator   Write a function named parking_fee that calculates the parking fee based on the number of hours parked.  Fee structure:  First hour: $3  Hours 2-4: $2 per hour  Hours 5+: $1.50 per hour  Maximum daily fee: $15    Note: Use the ceil function to round up partial hours. For example, ceil(2.3) returns 3 .      Inputs:   hours (1x1) double — number of hours parked (may include fractions)     Outputs:   fee (1x1) double — total parking fee in dollars     Test cases:  % Test 1: First hour f1 = parking_fee(0.5) % Expected: f1 = 3 % Test 2: Two hours f2 = parking_fee(2) % Expected: f2 = 5 (3 + 2) % Test 3: Four hours f3 = parking_fee(4) % Expected: f3 = 9 (3 + 2 + 2 + 2) % Test 4: Six hours f4 = parking_fee(6) % Expected: f4 = 12 (3 + 2 + 2 + 2 + 1.5 + 1.5) % Test 5: Exceeds maximum f5 = parking_fee(12) % Expected: f5 = 15     Rock-Paper-Scissors Judge   Write a function named rps_winner that determines the winner of a rock-paper-scissors game. Use a switch statement to handle the different move combinations.  Rules:  Rock beats Scissors  Scissors beats Paper  Paper beats Rock  Same moves result in a tie    Moves are represented as: 'R' for rock, 'P' for paper, 'S' for scissors.      Inputs:   player1 (1x1) char — player 1's move ('R', 'P', or 'S')       player2 (1x1) char — player 2's move ('R', 'P', or 'S')     Outputs:   result (1x1) string — \"Player 1\", \"Player 2\", or \"Tie\"     Test cases:  % Test 1: Rock beats Scissors r1 = rps_winner('R', 'S') % Expected: r1 = \"Player 1\" % Test 2: Paper beats Rock r2 = rps_winner('R', 'P') % Expected: r2 = \"Player 2\" % Test 3: Scissors beats Paper r3 = rps_winner('S', 'P') % Expected: r3 = \"Player 1\" % Test 4: Tie r4 = rps_winner('R', 'R') % Expected: r4 = \"Tie\" % Test 5: Another scenario r5 = rps_winner('P', 'S') % Expected: r5 = \"Player 2\"     Hurricane Category Classifier   Write a function named hurricane_category that classifies a hurricane based on its wind speed using the Saffir-Simpson scale.  Categories (based on sustained wind speed in mph):  < 74: \"Tropical Storm\"  74-95: \"Category 1\"  96-110: \"Category 2\"  111-129: \"Category 3\"  130-156: \"Category 4\"  ≥ 157: \"Category 5\"        Inputs:   wind_speed (1x1) double — sustained wind speed in mph     Outputs:   category (1x1) string — the hurricane category     Test cases:  % Test 1: Tropical Storm c1 = hurricane_category(60) % Expected: c1 = \"Tropical Storm\" % Test 2: Category 1 c2 = hurricane_category(85) % Expected: c2 = \"Category 1\" % Test 3: Category 3 c3 = hurricane_category(120) % Expected: c3 = \"Category 3\" % Test 4: Category 5 c4 = hurricane_category(160) % Expected: c4 = \"Category 5\" % Test 5: Boundary case c5 = hurricane_category(74) % Expected: c5 = \"Category 1\"     Zodiac Sign Finder   Write a function named zodiac_sign that determines a person's Western zodiac sign based on their birth month and day. Use a switch statement for the month, then if statements for the day ranges.  Zodiac date ranges (using format: month number, day range):  Capricorn: 12\/22-1\/19  Aquarius: 1\/20-2\/18  Pisces: 2\/19-3\/20  Aries: 3\/21-4\/19  Taurus: 4\/20-5\/20  Gemini: 5\/21-6\/20  Cancer: 6\/21-7\/22  Leo: 7\/23-8\/22  Virgo: 8\/23-9\/22  Libra: 9\/23-10\/22  Scorpio: 10\/23-11\/21  Sagittarius: 11\/22-12\/21        Inputs:   month (1x1) double — birth month (1-12)       day (1x1) double — birth day (1-31)     Outputs:   sign (1x1) string — zodiac sign name     Test cases:  % Test 1: Early January (Capricorn) z1 = zodiac_sign(1, 10) % Expected: z1 = \"Capricorn\" % Test 2: Late January (Aquarius) z2 = zodiac_sign(1, 25) % Expected: z2 = \"Aquarius\" % Test 3: Mid-year (Leo) z3 = zodiac_sign(8, 5) % Expected: z3 = \"Leo\" % Test 4: Boundary case (Taurus\/Gemini) z4 = zodiac_sign(5, 20) % Expected: z4 = \"Taurus\" % Test 5: Late December (Capricorn - year boundary) z5 = zodiac_sign(12, 25) % Expected: z5 = \"Capricorn\"     Leap Year Checker   Write a function named is_leap_year that determines whether a given year is a leap year.  The rules for leap years are:  A year is a leap year if it is divisible by 4  EXCEPT years divisible by 100 are NOT leap years  EXCEPT years divisible by 400 ARE leap years  For example: 2000 is a leap year (divisible by 400), 1900 is not (divisible by 100 but not 400), 2004 is a leap year (divisible by 4 but not 100).      Inputs:   year (1x1) double — the year to check     Outputs:   is_leap (1x1) logical — true if the year is a leap year, false otherwise     Test cases:  % Test 1: Divisible by 400 (leap year) r1 = is_leap_year(2000) % Expected: r1 = 1 (true) % Test 2: Divisible by 100 but not 400 (not a leap year) r2 = is_leap_year(1900) % Expected: r2 = 0 (false) % Test 3: Divisible by 4 but not 100 (leap year) r3 = is_leap_year(2024) % Expected: r3 = 1 (true) % Test 4: Not divisible by 4 (not a leap year) r4 = is_leap_year(2023) % Expected: r4 = 0 (false) % Test 5: Another divisible by 100 case r5 = is_leap_year(2100) % Expected: r5 = 0 (false)     Quadratic Equation Solver   Write a function named quadratic_solver that takes the coefficients a , b , and c as inputs and returns the two solutions, x1 and x2 (if they exist), for a quadratic equation of the form .  The function should handle different combinations of a , b , and c being zero. Based on this there could be:  Two solutions (repeated, distinct, or complex),  One solution (set x2 = NaN ),  No solutions (set x1 = NaN and x2 = NaN ), or  Infinitely many solutions (set x1 = Inf and x2 = NaN ).  Put on your math hat and think through the different cases to determine how to compute the solutions and what to return when there are no solutions or infinitely many solutions.      Inputs:   a (1x1) double — coefficient of  b (1x1) double — coefficient of  c (1x1) double — constant term     Outputs:   x1 (1x1) double — first solution of the quadratic equation  x2 (1x1) double — second solution of the quadratic equation  message (1x1) string — message indicating the nature of the solutions       message (1x1) string — message indicating the nature of the solutions     Test cases:  % Test 1: Two Real Solutions [x1, x2] = quadratic_solver(1, -3, 2) % Expected: x1 = 2, x2 = 1 % Test 2: Repeated Solutions [x1, x2] = quadratic_solver(1, 2, 1) % Expected: x1 = -1, x2 = -1 % Test 3: Complex Solutions [x1, x2] = quadratic_solver(1, 0, 4) % Expected: x1 = 2i, x2 = -2i     Coordinate Quadrant Checker   Write a function named find_quadrant that determines which quadrant or axis a point (x, y) is located in on a 2D coordinate system.  Rules:  Quadrant I: x > 0 and y > 0  Quadrant II: x < 0 and y > 0  Quadrant III: x < 0 and y < 0  Quadrant IV: x > 0 and y < 0  Origin: x = 0 and y = 0  X-axis: y = 0 (but x ≠ 0)  Y-axis: x = 0 (but y ≠ 0)        Inputs:   x (1x1) double — x-coordinate       y (1x1) double — y-coordinate     Outputs:   location (1x1) string — \"Quadrant I\", \"Quadrant II\", \"Quadrant III\", \"Quadrant IV\", \"Origin\", \"X-axis\", or \"Y-axis\"     Test cases:  % Test 1: Quadrant I loc1 = find_quadrant(3, 4) % Expected: loc1 = \"Quadrant I\" % Test 2: Quadrant II loc2 = find_quadrant(-2, 5) % Expected: loc2 = \"Quadrant II\" % Test 3: Origin loc3 = find_quadrant(0, 0) % Expected: loc3 = \"Origin\" % Test 4: X-axis loc4 = find_quadrant(7, 0) % Expected: loc4 = \"X-axis\" % Test 5: Quadrant III loc5 = find_quadrant(-3, -8) % Expected: loc5 = \"Quadrant III\"     Valid Triangle Detector   Write a function named is_valid_triangle that determines whether three side lengths form a valid triangle.  A triangle is valid if the sum of the two shortest sides is greater than the longest side and all sides are positive.      Inputs:   a, b, c (1x1) double — side lengths of the triangle     Outputs:   is_valid (1x1) logical — true if sides form a valid triangle, false otherwise     Test cases:  % Test 1: Equilateral triangle v1 = is_valid_triangle(5, 5, 5) % Expected: v1 = 1 (true) % Test 2: Isosceles triangle v2 = is_valid_triangle(5, 5, 8) % Expected: v2 = 1 (true) % Test 3: Scalene triangle v3 = is_valid_triangle(3, 4, 5) % Expected: v3 = 1 (true) % Test 4: Invalid triangle v4 = is_valid_triangle(1, 2, 10) % Expected: v4 = 0 (false) % Test 5: Another isosceles case v5 = is_valid_triangle(7, 10, 7) % Expected: v5 = 1 (true)     Triangle Type Classifier   Write a function named classify_triangle that classifies a triangle as equilateral, isosceles, scalene, or invalid based on the lengths of its sides.  Rules:  Equilateral: all three sides are equal  Isosceles: exactly two sides are equal  Scalene: all three sides are different  Invalid: does not form a valid triangle    You must use the is_valid_triangle function you wrote in the previous exercise as a helper function. This means that your classify_triangle function should (i) contain a call to is_valid_triangle and (ii) have a copy of the is_valid_triangle function code below it in the same file.      Inputs:   a, b, c (1x1) double — side lengths of the triangle     Outputs:   type (1x1) string — \"Equilateral\", \"Isosceles\", \"Scalene\", or \"Invalid\"     Test cases:  % Test 1: Equilateral triangle t1 = classify_triangle(5, 5, 5) % Expected: t1 = \"Equilateral\" % Test 2: Isosceles triangle t2 = classify_triangle(5, 5, 8) % Expected: t2 = \"Isosceles\" % Test 3: Scalene triangle t3 = classify_triangle(3, 4, 5) % Expected: t3 = \"Scalene\" % Test 4: Invalid triangle t4 = classify_triangle(1, 2, 10) % Expected: t4 = \"Invalid\" % Test 5: Another isosceles case t5 = classify_triangle(7, 10, 7) % Expected: t5 = \"Isosceles\"      Looping Flow (for and while loops)    Write a script that computes for a given positive integer . Your script should store the result in a variable named S .      Write a script that computes the factorial of a number: . Use a for loop. Assume is a nonnegative integer. Store the result in F .      Let be a real number. Use a for loop to compute the partial sum for a chosen integer . Store the result in P .      Simulate rolling a fair six-sided die times. Use a for loop to count how many times you roll a 6. Store the count in sixes .     "
},
{
  "id": "fn-coding-problems",
  "level": "2",
  "url": "fn-exercises.html#fn-coding-problems",
  "type": "Exercise",
  "number": "2.6.1",
  "title": "Simple Programs (Variables, Functions, and Scripts).",
  "body": " Simple Programs (Variables, Functions, and Scripts)   Answer the following questions to check your understanding of functions.    Temperature Conversion   Write a function named celsius_to_fahrenheit that converts a temperature from Celsius to Fahrenheit.  The conversion formula is:       Inputs:   celsius (1x1) double — temperature in degrees Celsius     Outputs:   fahrenheit (1x1) double — temperature in degrees Fahrenheit     Test cases:  % Test 1: Freezing point of water f1 = celsius_to_fahrenheit(0) % Expected: f1 = 32 % Test 2: Boiling point of water f2 = celsius_to_fahrenheit(100) % Expected: f2 = 212 % Test 3: Room temperature f3 = celsius_to_fahrenheit(20) % Expected: f3 = 68     Triangle Area   Write a function named triangle_area that computes the area of a triangle given its base and height.  The area formula is:       Inputs:   base (1x1) double — length of the triangle's base       height (1x1) double — height of the triangle     Outputs:   area (1x1) double — area of the triangle     Test cases:  % Test 1: Simple triangle a1 = triangle_area(6, 4) % Expected: a1 = 12 % Test 2: Right triangle a2 = triangle_area(5, 12) % Expected: a2 = 30 % Test 3: Decimal values a3 = triangle_area(7.5, 3.2) % Expected: a3 = 12     Sphere Properties   Write a function named sphere_properties that computes both the surface area and volume of a sphere given its radius.  The formulas are:  Surface area:  Volume:        Inputs:   radius (1x1) double — radius of the sphere     Outputs:   surface_area (1x1) double — surface area of the sphere       volume (1x1) double — volume of the sphere     Test cases:  % Test 1: Unit sphere [A1, V1] = sphere_properties(1) % Expected: A1 ≈ 12.5664, V1 ≈ 4.1888 % Test 2: Radius of 2 [A2, V2] = sphere_properties(2) % Expected: A2 ≈ 50.2655, V2 ≈ 33.5103 % Test 3: Radius of 5 [A3, V3] = sphere_properties(5) % Expected: A3 ≈ 314.1593, V3 ≈ 523.5988     Cylinder Properties   Write a function named cylinder_properties that computes the surface area, volume, and diagonal of a cylinder given its radius and height.  The formulas are:  Surface area:  Volume:  Diagonal: ?  Part of this problem is determining the correct formula for the diagonal of a cylinder. Hint: take out a piece of paper and sketch the cylinder, then draw the diagonal line from one edge of the base to the opposite edge of the top.       Inputs:   radius (1x1) double — radius of the cylinder       height (1x1) double — height of the cylinder     Outputs:   surface_area (1x1) double — total surface area of the cylinder       volume (1x1) double — volume of the cylinder       diagonal (1x1) double — diagonal length     Test cases:  % Test 1: Unit cylinder (radius = 1, height = 1) [A1, V1, d1] = cylinder_properties(1, 1) % Expected: A1 ≈ 12.5664, V1 ≈ 3.1416, d1 ≈ 2.2361 % Test 2: Radius = 3, height = 5 [A2, V2, d2] = cylinder_properties(3, 5) % Expected: A2 ≈ 150.7964, V2 ≈ 141.3717, d2 ≈ 7.8102 % Test 3: Radius = 2.5, height = 8 [A3, V3, d3] = cylinder_properties(2.5, 8) % Expected: A3 ≈ 164.9336, V3 ≈ 157.0796, d3 ≈ 9.4340     Compound Interest Calculator   Write a function named compound_interest that calculates the future value of an investment with compound interest, and also returns the total interest earned and the effective annual rate.  The compound interest formula is:   where:  = principal (initial investment)  = annual interest rate (as a decimal, e.g., 0.05 for 5%)  = number of times interest is compounded per year  = time in years  = final amount    The effective annual rate (EAR) is:       Inputs:   principal (1x1) double — initial investment amount       rate (1x1) double — annual interest rate (as decimal)       compounds_per_year (1x1) double — compounding frequency (e.g., 12 for monthly)       years (1x1) double — time period in years     Outputs:   final_amount (1x1) double — total amount after compound interest       interest_earned (1x1) double — total interest earned (final_amount - principal)       effective_rate (1x1) double — effective annual rate     Test cases:  % Test 1: $1000 at 5% annual rate, compounded monthly for 10 years [final1, int1, effRate1] = compound_interest(1000, 0.05, 12, 10) % Expected: final1 ≈ 1647.01, int1 ≈ 647.01, effRate1 ≈ 0.0512 % Test 2: $5000 at 3% annual rate, compounded quarterly for 5 years [final2, int2, effRate2] = compound_interest(5000, 0.03, 4, 5) % Expected: final2 ≈ 5805.92, int2 ≈ 805.92, effRate2 ≈ 0.03034 % Test 3: $10000 at 6% annual rate, compounded daily for 20 years [final3, int3, effRate3] = compound_interest(10000, 0.06, 365, 20) % Expected: final3 ≈ 33197.90, int3 ≈ 23197.90, effRate3 ≈ 0.0618     Triangle Perimeter and Area in 3D Space   Write a function named triangle_3d that computes the perimeter and area of a triangle in 3D space given the coordinates of its three vertices. You may assume the three points do not lie on the same straight line. This ensures a valid triangle.  Hints:   The distance formula between two points and is:     If the side lengths of the triangle are , , and , then the area is given by Heron's formula: where (known as the semi-perimeter).         Inputs:   x1, y1, z1 (1x1) double — coordinates of first vertex       x2, y2, z2 (1x1) double — coordinates of second vertex       x3, y3, z3 (1x1) double — coordinates of third vertex     Outputs:   perimeter (1x1) double — perimeter of the triangle       area (1x1) double — area of the triangle      Note: Typically you would pass coordinates as vectors or matrices, but we will save that for later exercises.   Test cases:  % Test 1: Triangle in xy-plane (vertices at (0,0,0), (4,0,0), (0,3,0)) [p1, a1] = triangle_3d(0, 0, 0, 4, 0, 0, 0, 3, 0) % Expected: p1 = 12, a1 = 6 (3-4-5 right triangle) % Test 2: Equilateral triangle in space [p2, a2] = triangle_3d(0, 0, 0, 1, 0, 0, 0.5, sqrt(3)\/2, 0) % Expected: p2 = 3, a2 ≈ 0.4330 % Test 3: Triangle with vertices at (1,2,3), (4,5,6), (2,3,5) [p3, a3] = triangle_3d(1, 2, 3, 4, 5, 6, 2, 3, 5) % Expected: p3 ≈ 10.6456, a3 ≈ 2.1213    "
},
{
  "id": "conditionals-coding-problems",
  "level": "2",
  "url": "fn-exercises.html#conditionals-coding-problems",
  "type": "Exercise",
  "number": "2.6.2",
  "title": "Conditional Flow (if and switch statements).",
  "body": " Conditional Flow (if and switch statements)   Number in Range   Write a function named is_in_range that determines whether a number falls within a specified range (inclusive).      Inputs:   value (1x1) double — the number to check       lower_bound (1x1) double — minimum value of the range       upper_bound (1x1) double — maximum value of the range     Outputs:   result (1x1) logical — true if value is in range [lower_bound, upper_bound], false otherwise     Test cases:  % Test 1: Value in range r1 = is_in_range(5, 1, 10) % Expected: r1 = 1 (true) % Test 2: Value at lower boundary r2 = is_in_range(1, 1, 10) % Expected: r2 = 1 (true) % Test 3: Value at upper boundary r3 = is_in_range(10, 1, 10) % Expected: r3 = 1 (true) % Test 4: Value below range r4 = is_in_range(0, 1, 10) % Expected: r4 = 0 (false) % Test 5: Value above range r5 = is_in_range(11, 1, 10) % Expected: r5 = 0 (false)     Tax Bracket Rate Finder   Write a function named find_tax_rate that determines the marginal tax rate for a given income based on progressive tax brackets.  Tax bracket rates:  Income up to $10,000: 0% tax rate  Income from $10,001 to $40,000: 10% tax rate  Income from $40,001 to $85,000: 15% tax rate  Income above $85,000: 20% tax rate        Inputs:   income (1x1) double — annual income in dollars     Outputs:   tax_rate (1x1) double — the marginal tax rate (as a decimal, e.g., 0.10 for 10%)     Test cases:  % Test 1: No tax bracket t1 = find_tax_rate(8000) % Expected: t1 = 0 % Test 2: 10% bracket t2 = find_tax_rate(25000) % Expected: t2 = 0.10 % Test 3: 15% bracket t3 = find_tax_rate(60000) % Expected: t3 = 0.15 % Test 4: 20% bracket t4 = find_tax_rate(100000) % Expected: t4 = 0.20 % Test 5: Boundary case t5 = find_tax_rate(40000) % Expected: t5 = 0.10     Water Phase Identifier   Write a function named water_phase that determines the physical state of water (ice, liquid, or steam) based on temperature in Celsius at standard atmospheric pressure.  Phase rules:  Below 0°C: ice  From 0°C to 100°C (inclusive): liquid  Above 100°C: steam        Inputs:   temp_celsius (1x1) double — temperature in Celsius     Outputs:   phase (1x1) string — \"ice\", \"liquid\", or \"steam\"     Test cases:  % Test 1: Below freezing p1 = water_phase(-10) % Expected: p1 = \"ice\" % Test 2: Freezing point p2 = water_phase(0) % Expected: p2 = \"liquid\" % Test 3: Room temperature p3 = water_phase(25) % Expected: p3 = \"liquid\" % Test 4: Boiling point p4 = water_phase(100) % Expected: p4 = \"liquid\" % Test 5: Above boiling p5 = water_phase(120) % Expected: p5 = \"steam\"     BMI Category Classifier   Write a function named bmi_category that calculates Body Mass Index (BMI) and classifies it into standard health categories.  BMI is calculated as:   Categories:  BMI < 18.5: \"Underweight\"  BMI 18.5 to 24.9: \"Normal weight\"  BMI 25 to 29.9: \"Overweight\"  BMI ≥ 30: \"Obese\"        Inputs:   weight_kg (1x1) double — weight in kilograms       height_m (1x1) double — height in meters     Outputs:   category (1x1) string — the BMI category     Test cases:  % Test 1: Underweight c1 = bmi_category(50, 1.75) % Expected: c1 = \"Underweight\" % Test 2: Normal weight c2 = bmi_category(70, 1.75) % Expected: c2 = \"Normal weight\" % Test 3: Overweight c3 = bmi_category(85, 1.75) % Expected: c3 = \"Overweight\" % Test 4: Obese c4 = bmi_category(100, 1.75) % Expected: c4 = \"Obese\" % Test 5: Boundary case c5 = bmi_category(75.5, 1.75) % Expected: c5 = \"Normal weight\"     Even and Positive   Write a function named is_even_and_positive that determines whether a number is both even and positive.  A number is even if dividing it by 2 produces no remainder. You can use the mod function to find remainders.      Inputs:   num (1x1) double — the number to check     Outputs:   result (1x1) logical — true if num is both even and positive, false otherwise     Test cases:  % Test 1: Even and positive r1 = is_even_and_positive(4) % Expected: r1 = 1 (true) % Test 2: Odd and positive r2 = is_even_and_positive(7) % Expected: r2 = 0 (false) % Test 3: Even and negative r3 = is_even_and_positive(-6) % Expected: r3 = 0 (false) % Test 4: Zero (even but not positive) r4 = is_even_and_positive(0) % Expected: r4 = 0 (false) % Test 5: Large even positive r5 = is_even_and_positive(100) % Expected: r5 = 1 (true)     Exclusive OR (XOR)   Write a function named my_xor that implements the exclusive OR operation without using MATLAB's built-in xor function.  XOR returns true when exactly one (but not both) of the inputs is true. Think about how you can combine AND, OR, and NOT operators to achieve this behavior.      Inputs:   a (1x1) logical — first logical value       b (1x1) logical — second logical value     Outputs:   result (1x1) logical — true if exactly one input is true, false otherwise     Test cases:  % Test 1: Both false r1 = my_xor(false, false) % Expected: r1 = 0 (false) % Test 2: First true, second false r2 = my_xor(true, false) % Expected: r2 = 1 (true) % Test 3: First false, second true r3 = my_xor(false, true) % Expected: r3 = 1 (true) % Test 4: Both true r4 = my_xor(true, true) % Expected: r4 = 0 (false)     Parking Fee Calculator   Write a function named parking_fee that calculates the parking fee based on the number of hours parked.  Fee structure:  First hour: $3  Hours 2-4: $2 per hour  Hours 5+: $1.50 per hour  Maximum daily fee: $15    Note: Use the ceil function to round up partial hours. For example, ceil(2.3) returns 3 .      Inputs:   hours (1x1) double — number of hours parked (may include fractions)     Outputs:   fee (1x1) double — total parking fee in dollars     Test cases:  % Test 1: First hour f1 = parking_fee(0.5) % Expected: f1 = 3 % Test 2: Two hours f2 = parking_fee(2) % Expected: f2 = 5 (3 + 2) % Test 3: Four hours f3 = parking_fee(4) % Expected: f3 = 9 (3 + 2 + 2 + 2) % Test 4: Six hours f4 = parking_fee(6) % Expected: f4 = 12 (3 + 2 + 2 + 2 + 1.5 + 1.5) % Test 5: Exceeds maximum f5 = parking_fee(12) % Expected: f5 = 15     Rock-Paper-Scissors Judge   Write a function named rps_winner that determines the winner of a rock-paper-scissors game. Use a switch statement to handle the different move combinations.  Rules:  Rock beats Scissors  Scissors beats Paper  Paper beats Rock  Same moves result in a tie    Moves are represented as: 'R' for rock, 'P' for paper, 'S' for scissors.      Inputs:   player1 (1x1) char — player 1's move ('R', 'P', or 'S')       player2 (1x1) char — player 2's move ('R', 'P', or 'S')     Outputs:   result (1x1) string — \"Player 1\", \"Player 2\", or \"Tie\"     Test cases:  % Test 1: Rock beats Scissors r1 = rps_winner('R', 'S') % Expected: r1 = \"Player 1\" % Test 2: Paper beats Rock r2 = rps_winner('R', 'P') % Expected: r2 = \"Player 2\" % Test 3: Scissors beats Paper r3 = rps_winner('S', 'P') % Expected: r3 = \"Player 1\" % Test 4: Tie r4 = rps_winner('R', 'R') % Expected: r4 = \"Tie\" % Test 5: Another scenario r5 = rps_winner('P', 'S') % Expected: r5 = \"Player 2\"     Hurricane Category Classifier   Write a function named hurricane_category that classifies a hurricane based on its wind speed using the Saffir-Simpson scale.  Categories (based on sustained wind speed in mph):  < 74: \"Tropical Storm\"  74-95: \"Category 1\"  96-110: \"Category 2\"  111-129: \"Category 3\"  130-156: \"Category 4\"  ≥ 157: \"Category 5\"        Inputs:   wind_speed (1x1) double — sustained wind speed in mph     Outputs:   category (1x1) string — the hurricane category     Test cases:  % Test 1: Tropical Storm c1 = hurricane_category(60) % Expected: c1 = \"Tropical Storm\" % Test 2: Category 1 c2 = hurricane_category(85) % Expected: c2 = \"Category 1\" % Test 3: Category 3 c3 = hurricane_category(120) % Expected: c3 = \"Category 3\" % Test 4: Category 5 c4 = hurricane_category(160) % Expected: c4 = \"Category 5\" % Test 5: Boundary case c5 = hurricane_category(74) % Expected: c5 = \"Category 1\"     Zodiac Sign Finder   Write a function named zodiac_sign that determines a person's Western zodiac sign based on their birth month and day. Use a switch statement for the month, then if statements for the day ranges.  Zodiac date ranges (using format: month number, day range):  Capricorn: 12\/22-1\/19  Aquarius: 1\/20-2\/18  Pisces: 2\/19-3\/20  Aries: 3\/21-4\/19  Taurus: 4\/20-5\/20  Gemini: 5\/21-6\/20  Cancer: 6\/21-7\/22  Leo: 7\/23-8\/22  Virgo: 8\/23-9\/22  Libra: 9\/23-10\/22  Scorpio: 10\/23-11\/21  Sagittarius: 11\/22-12\/21        Inputs:   month (1x1) double — birth month (1-12)       day (1x1) double — birth day (1-31)     Outputs:   sign (1x1) string — zodiac sign name     Test cases:  % Test 1: Early January (Capricorn) z1 = zodiac_sign(1, 10) % Expected: z1 = \"Capricorn\" % Test 2: Late January (Aquarius) z2 = zodiac_sign(1, 25) % Expected: z2 = \"Aquarius\" % Test 3: Mid-year (Leo) z3 = zodiac_sign(8, 5) % Expected: z3 = \"Leo\" % Test 4: Boundary case (Taurus\/Gemini) z4 = zodiac_sign(5, 20) % Expected: z4 = \"Taurus\" % Test 5: Late December (Capricorn - year boundary) z5 = zodiac_sign(12, 25) % Expected: z5 = \"Capricorn\"     Leap Year Checker   Write a function named is_leap_year that determines whether a given year is a leap year.  The rules for leap years are:  A year is a leap year if it is divisible by 4  EXCEPT years divisible by 100 are NOT leap years  EXCEPT years divisible by 400 ARE leap years  For example: 2000 is a leap year (divisible by 400), 1900 is not (divisible by 100 but not 400), 2004 is a leap year (divisible by 4 but not 100).      Inputs:   year (1x1) double — the year to check     Outputs:   is_leap (1x1) logical — true if the year is a leap year, false otherwise     Test cases:  % Test 1: Divisible by 400 (leap year) r1 = is_leap_year(2000) % Expected: r1 = 1 (true) % Test 2: Divisible by 100 but not 400 (not a leap year) r2 = is_leap_year(1900) % Expected: r2 = 0 (false) % Test 3: Divisible by 4 but not 100 (leap year) r3 = is_leap_year(2024) % Expected: r3 = 1 (true) % Test 4: Not divisible by 4 (not a leap year) r4 = is_leap_year(2023) % Expected: r4 = 0 (false) % Test 5: Another divisible by 100 case r5 = is_leap_year(2100) % Expected: r5 = 0 (false)     Quadratic Equation Solver   Write a function named quadratic_solver that takes the coefficients a , b , and c as inputs and returns the two solutions, x1 and x2 (if they exist), for a quadratic equation of the form .  The function should handle different combinations of a , b , and c being zero. Based on this there could be:  Two solutions (repeated, distinct, or complex),  One solution (set x2 = NaN ),  No solutions (set x1 = NaN and x2 = NaN ), or  Infinitely many solutions (set x1 = Inf and x2 = NaN ).  Put on your math hat and think through the different cases to determine how to compute the solutions and what to return when there are no solutions or infinitely many solutions.      Inputs:   a (1x1) double — coefficient of  b (1x1) double — coefficient of  c (1x1) double — constant term     Outputs:   x1 (1x1) double — first solution of the quadratic equation  x2 (1x1) double — second solution of the quadratic equation  message (1x1) string — message indicating the nature of the solutions       message (1x1) string — message indicating the nature of the solutions     Test cases:  % Test 1: Two Real Solutions [x1, x2] = quadratic_solver(1, -3, 2) % Expected: x1 = 2, x2 = 1 % Test 2: Repeated Solutions [x1, x2] = quadratic_solver(1, 2, 1) % Expected: x1 = -1, x2 = -1 % Test 3: Complex Solutions [x1, x2] = quadratic_solver(1, 0, 4) % Expected: x1 = 2i, x2 = -2i     Coordinate Quadrant Checker   Write a function named find_quadrant that determines which quadrant or axis a point (x, y) is located in on a 2D coordinate system.  Rules:  Quadrant I: x > 0 and y > 0  Quadrant II: x < 0 and y > 0  Quadrant III: x < 0 and y < 0  Quadrant IV: x > 0 and y < 0  Origin: x = 0 and y = 0  X-axis: y = 0 (but x ≠ 0)  Y-axis: x = 0 (but y ≠ 0)        Inputs:   x (1x1) double — x-coordinate       y (1x1) double — y-coordinate     Outputs:   location (1x1) string — \"Quadrant I\", \"Quadrant II\", \"Quadrant III\", \"Quadrant IV\", \"Origin\", \"X-axis\", or \"Y-axis\"     Test cases:  % Test 1: Quadrant I loc1 = find_quadrant(3, 4) % Expected: loc1 = \"Quadrant I\" % Test 2: Quadrant II loc2 = find_quadrant(-2, 5) % Expected: loc2 = \"Quadrant II\" % Test 3: Origin loc3 = find_quadrant(0, 0) % Expected: loc3 = \"Origin\" % Test 4: X-axis loc4 = find_quadrant(7, 0) % Expected: loc4 = \"X-axis\" % Test 5: Quadrant III loc5 = find_quadrant(-3, -8) % Expected: loc5 = \"Quadrant III\"     Valid Triangle Detector   Write a function named is_valid_triangle that determines whether three side lengths form a valid triangle.  A triangle is valid if the sum of the two shortest sides is greater than the longest side and all sides are positive.      Inputs:   a, b, c (1x1) double — side lengths of the triangle     Outputs:   is_valid (1x1) logical — true if sides form a valid triangle, false otherwise     Test cases:  % Test 1: Equilateral triangle v1 = is_valid_triangle(5, 5, 5) % Expected: v1 = 1 (true) % Test 2: Isosceles triangle v2 = is_valid_triangle(5, 5, 8) % Expected: v2 = 1 (true) % Test 3: Scalene triangle v3 = is_valid_triangle(3, 4, 5) % Expected: v3 = 1 (true) % Test 4: Invalid triangle v4 = is_valid_triangle(1, 2, 10) % Expected: v4 = 0 (false) % Test 5: Another isosceles case v5 = is_valid_triangle(7, 10, 7) % Expected: v5 = 1 (true)     Triangle Type Classifier   Write a function named classify_triangle that classifies a triangle as equilateral, isosceles, scalene, or invalid based on the lengths of its sides.  Rules:  Equilateral: all three sides are equal  Isosceles: exactly two sides are equal  Scalene: all three sides are different  Invalid: does not form a valid triangle    You must use the is_valid_triangle function you wrote in the previous exercise as a helper function. This means that your classify_triangle function should (i) contain a call to is_valid_triangle and (ii) have a copy of the is_valid_triangle function code below it in the same file.      Inputs:   a, b, c (1x1) double — side lengths of the triangle     Outputs:   type (1x1) string — \"Equilateral\", \"Isosceles\", \"Scalene\", or \"Invalid\"     Test cases:  % Test 1: Equilateral triangle t1 = classify_triangle(5, 5, 5) % Expected: t1 = \"Equilateral\" % Test 2: Isosceles triangle t2 = classify_triangle(5, 5, 8) % Expected: t2 = \"Isosceles\" % Test 3: Scalene triangle t3 = classify_triangle(3, 4, 5) % Expected: t3 = \"Scalene\" % Test 4: Invalid triangle t4 = classify_triangle(1, 2, 10) % Expected: t4 = \"Invalid\" % Test 5: Another isosceles case t5 = classify_triangle(7, 10, 7) % Expected: t5 = \"Isosceles\"    "
},
{
  "id": "loops-coding-problems",
  "level": "2",
  "url": "fn-exercises.html#loops-coding-problems",
  "type": "Exercise",
  "number": "2.6.3",
  "title": "Looping Flow (for and while loops).",
  "body": " Looping Flow (for and while loops)    Write a script that computes for a given positive integer . Your script should store the result in a variable named S .      Write a script that computes the factorial of a number: . Use a for loop. Assume is a nonnegative integer. Store the result in F .      Let be a real number. Use a for loop to compute the partial sum for a chosen integer . Store the result in P .      Simulate rolling a fair six-sided die times. Use a for loop to count how many times you roll a 6. Store the count in sixes .    "
},
{
  "id": "ch-arrays",
  "level": "1",
  "url": "ch-arrays.html",
  "type": "Chapter",
  "number": "3",
  "title": "Arrays",
  "body": " Arrays   In the previous chapters, you learned how to work with individual numbers and basic calculations in MATLAB. While scalar values are useful, much of MATLAB's power comes from its ability to work efficiently with collections of numbers called arrays . In fact, the name MATLAB stands for Matrix Laboratory , emphasizing the language's focus on array-based computing.  Arrays allow you to store multiple related values in a single variable and perform operations on all elements simultaneously. This approach, known as vectorization , is not only more efficient computationally but also leads to cleaner, more readable code. Understanding how to create, access, and manipulate arrays is fundamental to effective MATLAB programming.  This chapter introduces arrays systematically. You will learn how to create arrays using different methods, how to access individual elements or groups of elements through indexing, and how to perform mathematical operations on arrays. By the end of this chapter, you will be comfortable working with one-dimensional vectors and two-dimensional matrices, and you will understand how MATLAB's array operations enable you to write concise, powerful programs.          "
},
{
  "id": "ch-arrays-2-1",
  "level": "2",
  "url": "ch-arrays.html#ch-arrays-2-1",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "arrays "
},
{
  "id": "ch-arrays-2-2",
  "level": "2",
  "url": "ch-arrays.html#ch-arrays-2-2",
  "type": "Paragraph (with a defined term)",
  "number": "",
  "title": "",
  "body": "vectorization "
},
{
  "id": "matlabrs-7",
  "level": "1",
  "url": "matlabrs-7.html",
  "type": "Appendix",
  "number": "A",
  "title": "Appendix",
  "body": " Appendix  "
}
]

var ptx_lunr_idx = lunr(function () {
  this.ref('id')
  this.field('title')
  this.field('body')
  this.metadataWhitelist = ['position']

  ptx_lunr_docs.forEach(function (doc) {
    this.add(doc)
  }, this)
})
