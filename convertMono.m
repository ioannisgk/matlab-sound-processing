function [] = convertMono(handles)
% Function to convert stereo sound to mono

global active;
global sound1;
global sound2;
global rate1;
global rate2;
global numChannels1;
global numChannels2;
global mono1;
global mono2;

% Change poimter to indicate that GUI is busy
% https://www.mathworks.com/matlabcentral/answers/11411-how-to-indicate-that-gui-is-busy-running
set(handles.figure1, 'pointer', 'watch');
drawnow;

if active == 1
    
    % If sound is already mono, do not convert
    if numChannels1 == 1
        updateInfo('source1Information', 'The sound was not edited, it is already MONO.');
    elseif numChannels1 == 2
    
        % Remove right or left channel
        if strcmp(mono1, 'right')
            leftChannel = sound1(:, 1);
            sound1 = [leftChannel, zeros(size(leftChannel))];
        
            % Update sound information
            updateSound(sound1, rate1, 1);
            updateInfo('infoMono1', 'MONO is enabled');
            updateInfo('source1Information', 'MONO is enabled, right channel is removed');
        
            myHandle = findall(groot,'Tag', 'channelsInfo1');
            set(myHandle, 'String', '1');
        
        elseif strcmp(mono1, 'left')
            rightChannel = sound1(:, 2);
            sound1 = [zeros(size(rightChannel)), rightChannel];
        
            % Update sound information
            updateSound(sound1, rate1, 1);
            updateInfo('infoMono1', 'MONO is enabled');
            updateInfo('source1Information', 'MONO is enabled, left channel is removed');
        
            myHandle = findall(groot,'Tag', 'channelsInfo1');
            set(myHandle, 'String', '1');
        end
    end
    
elseif active == 2
    
    % If sound is already mono, do not convert
    if numChannels2 == 1
        updateInfo('source2Information', 'The sound was not edited, it is already MONO.');
    elseif numChannels2 == 2
    
        % Remove right or left channel
        if strcmp(mono2, 'right')
            leftChannel = sound2(:, 1);
            sound2 = [leftChannel, zeros(size(leftChannel))];
        
            % Update sound information
            updateSound(sound2, rate2, 2);
            updateInfo('infoMono2', 'MONO is enabled');
            updateInfo('source2Information', 'MONO is enabled, right channel is removed');
        
            myHandle = findall(groot,'Tag', 'channelsInfo2');
            set(myHandle, 'String', '1');
        
        elseif strcmp(mono2, 'left')
            rightChannel = sound2(:, 2);
            sound2 = [zeros(size(rightChannel)), rightChannel];
        
            % Update sound information
            updateSound(sound2, rate2, 2);
            updateInfo('infoMono2', 'MONO is enabled');
            updateInfo('source2Information', 'MONO is enabled, left channel is removed');
        
            myHandle = findall(groot,'Tag', 'channelsInfo2');
            set(myHandle, 'String', '1');
        end
    end
end

% Restore pointer
set(handles.figure1, 'pointer', 'arrow');