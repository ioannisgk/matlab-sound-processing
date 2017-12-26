function [] = convertMono()
% Function to convert stereo sound to mono

global active;
global sound1;
global sound2;
global mono;

if active == 1
    
    % Remove right or left channel
    if strcmp(mono, 'right')
        leftChannel = sound1(:, 1);
        sound1 = [leftChannel, zeros(size(leftChannel))];
    elseif strcmp(mono, 'left')
        rightChannel = sound1(:, 2);
        sound1 = [zeros(size(rightChannel)), rightChannel];
    end
    
elseif active == 2
    
    % Remove right or left channel
    if strcmp(mono, 'right')
        leftChannel = sound2(:, 1);
        sound2 = [leftChannel, zeros(size(leftChannel))];
    elseif strcmp(mono, 'left')
        rightChannel = sound2(:, 2);
        sound2 = [zeros(size(rightChannel)), rightChannel];
    end
end