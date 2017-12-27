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

% Convert start time in seconds
startTime = get(handles.selectTime,'String');
startSeconds = time2seconds(startTime);
    
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
exportFilename = get(handles.exportFilename,'String');
exportFilename = [exportFilename '.wav'];
audiowrite(exportFilename, mixedSound, rate1);