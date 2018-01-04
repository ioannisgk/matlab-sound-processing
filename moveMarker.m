function [] = moveMarker(source)
% Function to move marker during playback

global player;
global rate1;
global rate2;
global m1;
global m2;

while isplaying(player)
    
    % Draw new marker m
    if source == 1
        % Get current sample and convert it to current time t
        currentSample = get(player,'CurrentSample');
        t = currentSample/rate1;
        
        % Delete old marker and create a new one
        if exist('m1', 'var')
            delete(m1);
        end
        m1=line([t,t],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
        
    elseif source == 2
        % Get current sample and convert it to current time t
        currentSample = get(player,'CurrentSample');
        t = currentSample/rate2;
        
        % Delete old marker and create a new one
        if exist('m2', 'var')
            delete(m2);
        end
        m2=line([t,t],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
        
    end
                
    % Fix for exiting loop when player is stopped
    % https://www.mathworks.com/matlabcentral/answers/46603-audioplayer-isplaying-won-t-exit-tight-loop
    pause(0.00001);         
end