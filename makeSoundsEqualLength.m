function [] = makeSoundsEqualLength()
% Function to make sounds equal length by adding silence

global sound1;
global duration1;
global numChannels1;
global sound2;
global duration2;
global numChannels2;

% If sound is mono, add zeros to the right channel
if numChannels1 == 1
    leftChannel = sound1(:, 1);
    sound1 = [leftChannel, zeros(size(leftChannel))];
end
if numChannels2 == 1
    leftChannel = sound2(:, 1);
    sound2 = [leftChannel, zeros(size(leftChannel))];
end

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