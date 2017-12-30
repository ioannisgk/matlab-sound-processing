function [] = trimSource(handles, source)
% Function to trim source based on start time and end time

% Global variables for source 1
global FileName1;
global sound1;
global rate1;
global duration1;
global m1;

% Global variables for source 2
global FileName2;
global sound2;
global rate2;
global duration2;
global m2;

if source == 1
    % Convert start time and end time in seconds
    startTime = get(handles.selectStart1,'String');
    endTime = get(handles.selectEnd1,'String');
    
    startSeconds = time2seconds(startTime);
    endSeconds = time2seconds(endTime);
    
    % Check for input errors and show error messages
    % https://www.mathworks.com/help/matlab/ref/msgbox.html
    if length(sound1) == 0
        h = msgbox('Audio file is not imported. Please import an audio file first.', 'Error');
    elseif (length(startSeconds) == 0) || (length(endSeconds) == 0)
        h = msgbox('Invalid input detected. Please enter valid numbers in time field.', 'Error');
    elseif endSeconds == 0
        h = msgbox('End time can not be 0 seconds. Select a different end time', 'Error');
    elseif startSeconds >= endSeconds
        h = msgbox('Start time can not be greater than end time. Select a different start time', 'Error');
    end

    % Calculate new start and end samples
    startSample = startSeconds * rate1;
    endSample = endSeconds * rate1;
    
    % Update sound
    sound1 = sound1(round(startSample+1):round(endSample),:);
    duration1 = length(sound1)/rate1;
    time = seconds2time(duration1);
    
    % Plot sound and set axis labels and max length
    axes(handles.axes1);
    plotSound(sound1, rate1);
    
    % Delete old marker and create a new one
    if exist('m1', 'var')
        delete(m1);
    end
    m1=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);

    % Update source 1 controls
    set(handles.selectStart1, 'String', '00:00:00');
    set(handles.selectEnd1, 'String', time);
    set(handles.totalTime1, 'String', time);
    set(handles.source1Information, 'String', [FileName1 ' was trimmed successfully']);
    
elseif source == 2
    % Convert start time and end time in seconds
    startTime = get(handles.selectStart2,'String');
    endTime = get(handles.selectEnd2,'String'); 
    startSeconds = time2seconds(startTime);
    endSeconds = time2seconds(endTime);
    
    % Calculate new start and end samples
    startSample = startSeconds * rate2;
    endSample = endSeconds * rate2;
    
    % Check for input errors and show error messages
    % https://www.mathworks.com/help/matlab/ref/msgbox.html
    if length(sound2) == 0
        h = msgbox('Audio file is not imported. Please import an audio file first.', 'Error');
    elseif (length(startSeconds) == 0) || (length(endSeconds) == 0)
        h = msgbox('Invalid input detected. Please enter valid numbers in time field.', 'Error');
    elseif endSeconds == 0
        h = msgbox('End time can not be 0 seconds. Select a different end time', 'Error');
    elseif startSeconds >= endSeconds
        h = msgbox('Start time can not be greater than end time. Select a different start time', 'Error');
    end
    
    % Update new sound
    sound2 = sound2(round(startSample+1):round(endSample),:);
    duration2 = length(sound2)/rate2;
    time = seconds2time(duration2);
    
    % Plot sound and set axis labels and max length
    axes(handles.axes2);
    plotSound(sound2, rate2);
    
    % Delete old marker and create a new one
    if exist('m2', 'var')
        delete(m2);
    end
    m2=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);

    % Update source 1 controls
    set(handles.selectStart2, 'String', '00:00:00');
    set(handles.selectEnd2, 'String', time);
    set(handles.totalTime2, 'String', time);
    set(handles.source2Information, 'String', [FileName2 ' was trimmed successfully']);
end