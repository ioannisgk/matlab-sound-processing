function [] = applyFilter(handles, source)
% Function to apply high pass and low pass filters

global sound1;
global rate1;
global filter1;
global sound2;
global rate2;
global filter2;

% https://www.mathworks.com/matlabcentral/answers/37462-a-simple-lowpass-filter
% https://www.mathworks.com/help/signal/ref/fdesign.lowpass.html
% https://www.mathworks.com/help/dsp/ref/fdesign.lowpass.html

if strcmp(filter1, 'low')
    
    % Passband frequency
    Fp = 3;
    
    % Stopband frequency
    Fst = 5;
    
    % Passband ripple in dB
    Ap = 0.5;
    
    % Stopband attentuation in dB
    Ast = 40;
    
    % Frequency rate
    rate = 100;
    
    % Create low pass filter
    d = fdesign.lowpass('Fp,Fst,Ap,Ast',Fp,Fst,Ap,Ast,rate);
    
    % Create FIR equiripple filter
    Hd = design(d,'equiripple');
    
    % Apply filter to source
    sound1 = filter(Hd, sound1);
    
end