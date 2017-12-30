function [] = convertMono(handles)
% Function to convert stereo sound to mono

global active;
global sound1;
global sound2;
global mono;

% Change poimter to indicate that GUI is busy
% https://www.mathworks.com/matlabcentral/answers/11411-how-to-indicate-that-gui-is-busy-running
set(handles.figure1, 'pointer', 'watch');
drawnow;

if active == 1
    
    % Remove right or left channel
    if strcmp(mono, 'right')
        leftChannel = sound1(:, 1);
        sound1 = [leftChannel, zeros(size(leftChannel))];
        updateInfo('infoMono1', 'MONO is enabled');
        updateInfo('source1Information', 'MONO is enabled, right channel is removed');
        
    elseif strcmp(mono, 'left')
        rightChannel = sound1(:, 2);
        sound1 = [zeros(size(rightChannel)), rightChannel];
        updateInfo('infoMono1', 'MONO is enabled');
        updateInfo('source1Information', 'MONO is enabled, left channel is removed');
    end
    
elseif active == 2
    
    % Remove right or left channel
    if strcmp(mono, 'right')
        leftChannel = sound2(:, 1);
        sound2 = [leftChannel, zeros(size(leftChannel))];
        updateInfo('infoMono2', 'MONO is enabled');
        updateInfo('source2Information', 'MONO is enabled, right channel is removed');
        
    elseif strcmp(mono, 'left')
        rightChannel = sound2(:, 2);
        sound2 = [zeros(size(rightChannel)), rightChannel];
        updateInfo('infoMono2', 'MONO is enabled');
        updateInfo('source2Information', 'MONO is enabled, left channel is removed');
    end
end

% Restore pointer
set(handles.figure1, 'pointer', 'arrow');