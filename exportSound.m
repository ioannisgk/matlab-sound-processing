function [] = exportSound(handles)
% Function to export mixed sound to wav file

% Get global variables
global sound1;
global rate1;
global volume1;
global duration1;
global sound2;
global rate2;
global volume2;
global duration2;

% Convert start time in seconds
startTime = get(handles.selectTime,'String');
startSeconds = time2seconds(startTime);
    
% Calculate new start sample
startSample = startSeconds * rate1;

% Update sound
sound1 = sound1(round(startSample+1):length(sound1),:);
duration1 = length(sound1)/rate1;

% Get lengths from both sounds
endSample1 = length(sound1);
endSample2 = length(sound2);

% Check sound lengths and add silence if necessary
if duration1 > duration2 

    % Add silence to end of sound 2
    silence = zeros((endSample1-endSample2) , 2);
    sound2 = [sound2; silence];
elseif duration1 < duration2
        
    % Add silence to end of sound 1
    silence = zeros((endSample2-endSample1) , 2);
    sound1 = [sound1; silence];
end

% Create new mixed sound
mixedSound = (sound1 * volume1) + (sound2 * volume2);

% Normalize mixed sound to prevent clipping
% https://www.mathworks.com/matlabcentral/answers/55652-warning-data-clipped-during-write-to-file
mixedSound = mixedSound./(max(abs(mixedSound)));
    
% Save mixed sound to file
exportFilename = get(handles.exportFilename,'String');
audiowrite(exportFilename, mixedSound, rate1);