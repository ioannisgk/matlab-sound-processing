function [] = addEcho(handles)
% Function to add echo to sound based on user settings

global sound1;
global rate1;
global sound2;
global rate2;
global active;

% Change pointer to indicate that GUI is busy
% https://www.mathworks.com/matlabcentral/answers/11411-how-to-indicate-that-gui-is-busy-running
set(handles.figure1, 'pointer', 'watch');
drawnow;

% http://ashanpeiris.blogspot.gr/2015/03/how-to-add-echo-effect-to-audio-signal.html
delay = str2num(get(handles.delayText, 'String'));
strength = str2num(get(handles.strengthText, 'String'));

if active == 1
    
    D = delay * rate1;  
    b = [1, zeros(1, round(D)), strength];  
    sound1 = filter(b, 1, sound1);
    
    % Update sound information
    updateSound(sound1, rate1, 1);
    updateInfo('infoEcho1', 'ECHO is enabled');
    updateInfo('source1Information', 'Added ECHO to source 1');
    
elseif active == 2
    
    D = delay * rate2;  
    b = [1, zeros(1, round(D)), strength];  
    sound2 = filter(b, 1, sound2);
    
    % Update sound information
    updateSound(sound2, rate2, 2);
    updateInfo('infoEcho2', 'ECHO is enabled');
    updateInfo('source2Information', 'Added ECHO to source 2');
    
end

% Restore pointer
set(handles.figure1, 'pointer', 'arrow');