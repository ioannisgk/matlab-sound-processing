function [] = calculateLowPass(handles, mode)
% Function to calculate low pass filter parameters

global active;
global Hd;

if strcmp(mode, 'all-settings')
    % Passband frequency
    Fp = 3 * str2num(get(handles.FpText, 'String'));
    
    % Stopband frequency
    Fst = 5 * str2num(get(handles.FstText, 'String'));
    
    % Passband ripple in dB
    Ap = 0.5 * (str2num(get(handles.ApText, 'String')) * 2);
    
    % Stopband attentuation in dB
    Ast = 40 * (str2num(get(handles.AstText, 'String')) * 2);
    
    % Frequency rate
    rate = 100 * (str2num(get(handles.rateText, 'String')) * 2);
    
    % Create low pass filter
    d = fdesign.lowpass('Fp,Fst,Ap,Ast',Fp,Fst,Ap,Ast,rate);
    
    % Create FIR equiripple filter
    Hd = design(d,'equiripple');

elseif strcmp(mode, 'one-setting')
    % Passband frequency
    Fp = 3;
    
    % Stopband frequency
    Fst = 5;
    
    % Passband ripple in dB
    Ap = 0.5;
    
    % Stopband attentuation in dB
    Ast = 40;
    
    % Frequency rate
    if active == 1
        rate = 100 * (str2num(get(handles.filterSliderText1, 'String')) * 2);
    elseif active == 2
        rate = 100 * (str2num(get(handles.filterSliderText2, 'String')) * 2);
    end
    
    % Create low pass filter
    d = fdesign.lowpass('Fp,Fst,Ap,Ast',Fp,Fst,Ap,Ast,rate);
    
    % Create FIR equiripple filter
    Hd = design(d,'equiripple');
    
end