function [userSeconds] = time2seconds(time)
% Function to convert time format mm:ss:ms to seconds

% Calculate duration from minutes, seconds and miliseconds
minutes = str2num([time(1) time(2)]);
seconds = str2num([time(4) time(5)]);
miliseconds = str2num([time(7) time(8)]);
userSeconds = (minutes*60)+seconds+(miliseconds/100);

% Format user seconds to 2 decimal points
userSeconds = str2num(sprintf('%.02f', userSeconds));