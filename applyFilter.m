function [] = applyFilter(handles, source, mode)
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
% https://www.mathworks.com/help/signal/ref/fdesign.highpass.html

if strcmp(filter1, 'low') && source == 1
    
    % calculate low pass filter parameters
    calculateLowPass(handles, mode);
    
    % Apply filter to source 1
    sound1 = filter(Hd, sound1);
    
elseif strcmp(filter1, 'high') && source == 1
    
    % calculate high pass filter parameters
    calculateHighPass(handles, mode);
    
    % Apply filter to source 1
    sound1 = filter(Hd, sound1);

elseif strcmp(filter2, 'low') && source == 2
    
    % calculate low pass filter parameters
    calculateLowPass(handles, mode);
    
    % Apply filter to source 2
    sound2 = filter(Hd, sound2);
    
elseif strcmp(filter2, 'high') && source == 2
    
    % calculate high pass filter parameters
    calculateHighPass(handles, mode);
    
    % Apply filter to source 2
    sound2 = filter(Hd, sound2);
    
end