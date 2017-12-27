function [] = updateInfo(tag, message)
% Function to update info messages on main screen

% https://www.mathworks.com/help/matlab/ref/findall.html
% https://stackoverflow.com/questions/4540604/how-do-i-get-the-handles-of-all-open-figures-in-matlab

myHandle = findall(groot,'Tag', tag);
set(myHandle, 'String', message);