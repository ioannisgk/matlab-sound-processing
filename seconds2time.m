function [time] = seconds2time(duration)
% Function to convert seconds to time format mm:ss:ms

% Calculate minutes, seconds and miliseconds
minutes = floor(mod((duration/60), 60));
seconds = floor(mod(duration,60));
miliseconds = round((duration-(minutes*60)-seconds)*100);

% Save time to format mm:ss:ms
time = sprintf('%02d:%02d:%02d', minutes, seconds, miliseconds);