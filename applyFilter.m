function [] = applyFilter(handles, source)
% Function to apply high pass and low pass filters

global sound1;
global rate1;
global filter1;
global sound2;
global rate2;
global filter2;
global Hd;

% https://www.mathworks.com/matlabcentral/answers/37462-a-simple-lowpass-filter
% https://www.mathworks.com/help/signal/ref/fdesign.lowpass.html
% https://www.mathworks.com/help/dsp/ref/fdesign.lowpass.html

if strcmp(filter1, 'low')
    
    % calculate low pass filter parameters
    calculateLowPass(handles);
    
    % Apply filter to source 1
    sound1 = filter(Hd, sound1);

elseif strcmp(filter2, 'low')
    
    % calculate low pass filter parameters
    calculateLowPass(handles);
    
    % Apply filter to source 2
    sound2 = filter(Hd, sound2);
    
end