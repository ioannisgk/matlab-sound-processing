function [] = exportSound(handles)
% Function to export mixed sound to wav file

% Get global variables
global masterVolume;
global sound1;
global rate1;
global volume1;
global duration1;
global sound2;
global rate2;
global volume2;
global duration2;
global valid;

% Convert start time in seconds
startTime = get(handles.selectTime,'String');
endTime = get(handles.selectEnd1,'String');
startSeconds = time2seconds(startTime);
endSeconds = time2seconds(endTime);

% Check for input errors and show error messages and set valid to 0
% https://www.mathworks.com/help/matlab/ref/msgbox.html
if (length(sound1) == 0) || (length(sound2) == 0)
    h = msgbox('Two audio files are not imported. Please import two audio files first.', 'Error');
    valid = 0;
elseif length(startSeconds) == 0
    h = msgbox('Invalid input detected. Please enter valid numbers in time field.', 'Error');
    valid = 0;
elseif startSeconds >= endSeconds
    h = msgbox('Start time can not be greater than end time. Select a different start time', 'Error');
    valid = 0;
end

% Calculate silence samples
numberofSamples = startSeconds * rate1;

% Add silence to start of sound 2
silence = zeros(numberofSamples , 2);
sound2 = [silence; sound2];
duration2 = length(sound2)/rate2;

% Make sounds equal length by adding silence
makeSoundsEqualLength();

% Create new mixed sound
mixedSound = (sound1 * volume1 * masterVolume) + (sound2 * volume2 * masterVolume);

% Remove silence at the end of mixed track
endSample = length(mixedSound) - numberofSamples;
mixedSound = mixedSound(1:round(endSample),:);

% Normalize mixed sound to prevent clipping
% https://www.mathworks.com/matlabcentral/answers/55652-warning-data-clipped-during-write-to-file
mixedSound = mixedSound./(max(abs(mixedSound)));
    
% Save mixed sound to file
% https://www.mathworks.com/help/matlab/ref/uiputfile.html
if valid == 1
    [exportFilename, pathName] = uiputfile('*.wav','Save the new mix as a wav file');
    
    % Change poimter to indicate that GUI is busy
    % https://www.mathworks.com/matlabcentral/answers/11411-how-to-indicate-that-gui-is-busy-running
    set(handles.figure1, 'pointer', 'watch');
    drawnow;

    audiowrite(exportFilename, mixedSound, rate1);
    
    % Restore pointer
    set(handles.figure1, 'pointer', 'arrow');
    
    h = msgbox('Mixed audio file was saved successfully!', 'Success');
end