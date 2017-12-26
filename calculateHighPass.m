function [] = calculateHighPass(handles, mode)
% Function to calculate high pass filter parameters

global active;
global Hd;

if strcmp(mode, 'all-settings')
    % Passband frequency
    Fp = 5 * (str2num(get(handles.FpText, 'String')) * 1.5);
    
    % Stopband frequency
    Fst = 3 * (str2num(get(handles.FstText, 'String')) * 0.7);
    
    % Passband ripple in dB
    Ap = 0.5 * (str2num(get(handles.ApText, 'String')) * 2);
    
    % Stopband attentuation in dB
    Ast = 40 * (str2num(get(handles.AstText, 'String')) * 2);
    
    % Frequency rate
    rate = 100 * (str2num(get(handles.rateText, 'String')) * 2);
    
    % Create high pass filter
    d = fdesign.highpass('Fst,Fp,Ast,Ap',Fst,Fp,Ast,Ap,rate);
    
    % Create FIR equiripple filter
    Hd = design(d,'equiripple');
    
elseif strcmp(mode, 'one-setting')
    % Passband frequency
    Fp = 5;
    
    % Stopband frequency
    Fst = 3;
    
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
    
    % Create high pass filter
    d = fdesign.highpass('Fst,Fp,Ast,Ap',Fst,Fp,Ast,Ap,rate);
    
    % Create FIR equiripple filter
    Hd = design(d,'equiripple');
    
end