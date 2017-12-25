function [] = playActiveOrAll(handles, mode)
% Function to play active channel according to speed and volume settings

% Global variables for player and source 1
global player;
global paused;
global active;
global sound1;
global rate1;
global m1;

% Global variables for source 2
global sound2;
global rate2;
global m2;

% Extract speed and volume settings
speed1 = str2num(get(handles.speedSliderText1, 'String'));
speed2 = str2num(get(handles.speedSliderText2, 'String'));
volume1 = str2num(get(handles.volumeSliderText1, 'String'));
volume2 = str2num(get(handles.volumeSliderText2, 'String'));

if strcmp(mode, 'active')
    if active == 1
        % Set current axes to axes1
        axes(handles.axes1);
        
        % If paused, resume source 1 player, else create player
        if paused == 1
            resume(player);
            moveMarker(1);
        else
            player = audioplayer(sound1 * volume1, rate1 * speed1);
            play(player);
            moveMarker(1);
        end

    elseif active == 2
        % Set current axes to axes2
        axes(handles.axes2);
        
        % If paused, resume source 2 player, else create player
        if paused == 1
            resume(player);
            moveMarker(2);
        else
            player = audioplayer(sound2 * volume2, rate2 * speed2);
            play(player);
            moveMarker(2);
        end
    end
    
elseif strcmp(mode, 'all')
    
    % Set current axes to axes1
    axes(handles.axes1);
        
    % If marker m1 exists, delete it and create new marker at position 0
    if exist('m1', 'var')
        delete(m1);
    end
    m1=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
    
    % Set current axes to axes2
    axes(handles.axes2);
    
    % If marker m2 exists, delete it and create new marker at position 0
    if exist('m2', 'var')
        delete(m2);
    end
    m2=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
    
    % Update sample rates based on speed settings
    rate1 = rate1 * speed1;
    rate2 = rate2 * speed2;
    
    % Make sounds equal length by adding silence
    makeSoundsEqualLength();
    
    % Create new mixed sound
    mixedSound = (sound1 * volume1) + (sound2 * volume2);
    player = audioplayer(mixedSound, rate1);
      
    % Play mixed sound
    play(player);
    
end