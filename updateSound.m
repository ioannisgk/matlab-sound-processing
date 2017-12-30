function [] = updateSound(sound, rate, source)
% Function to update sound after applying audio effects

global axeHandler1;
global axeHandler2;
global m1;
global m2;

if source == 1
    
    % Plot sound and set axis labels and max length
    axes(axeHandler1);
    plotSound(sound, rate);
    
    % Delete old marker and create a new one
    if exist('m1', 'var')
        delete(m1);
    end
    m1=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
    
elseif source == 2
    
    % Plot sound and set axis labels and max length
    axes(axeHandler2);
    plotSound(sound, rate);
    
    % Delete old marker and create a new one
    if exist('m2', 'var')
        delete(m2);
    end
    m2=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);
    
end