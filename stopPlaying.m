function [] = stopPlaying()
% Function to stop player and reset paused and markers

global player;
global paused;
global active;
global m1;
global m2

stop(player);
paused = 0;

if active == 1
    % If marker m1 exists, delete it and create new marker at position 0
    if exist('m1', 'var')
        delete(m1);
    end
    m1=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);

elseif active == 2
    % If marker m2 exists, delete it and create new marker at position 0
    if exist('m2', 'var')
        delete(m2);
    end
    m2=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
end