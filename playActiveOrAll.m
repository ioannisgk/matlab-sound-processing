function [] = playActiveOrAll(handles, mode)
% Function to play active channel according to speed and volume settings

% Global variables for player and source 1
global player;
global paused;
global active;
global sound1;
global rate1;
global duration1;
global numChannels1;
global m;

% Global variables for source 2
global sound2;
global rate2;
global duration2;
global numChannels2;

% Extract speed and volume settings
speed1 = str2num(get(handles.speedSliderText1, 'String'));
speed2 = str2num(get(handles.speedSliderText2, 'String'));
volume1 = str2num(get(handles.volumeSliderText1, 'String'));
volume2 = str2num(get(handles.volumeSliderText2, 'String'));

if strcmp(mode, 'active')
    if active == 1
        % If paused, resume source 1 player, else create player
        if paused == 1
            resume(player);
            paused = 0;
        else
            player = audioplayer(sound1 * volume1, rate1 * speed1);
            play(player);
            
            while isplaying(player)
                % Get current sample and convert it to current time t
                currentSample = get(player,'CurrentSample');
                t = currentSample/rate1;
                
                % If marker m exists, delete it
                if exist('m', 'var')
                    delete(m);
                end

                % Draw new marker m
                m=line([t,t],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
                
                % Fix for exitting loop when player is stopped
                % https://www.mathworks.com/matlabcentral/answers/46603-audioplayer-isplaying-won-t-exit-tight-loop
                pause(0.00001);
                
            end
        end

    elseif active == 2
        % If paused, resume source 2 player, else create player
        if paused == 1
            resume(player);
            paused = 0;
        else
            player = audioplayer(sound2 * volume2, rate2 * speed2);
            play(player);
        end
    end
    
elseif strcmp(mode, 'all')
    
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