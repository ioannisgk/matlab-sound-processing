function [] = trimSource(handles, source)
% Function to trim source based on start time and end time

% Global variables for source 1
global FileName1;
global sound1;
global rate1;
global duration1;

% Global variables for source 2
global FileName2;
global sound2;
global rate2;
global duration2;

if source == 1
    % Convert start time and end time in seconds
    startTime = get(handles.selectStart1,'String');
    endTime = get(handles.selectEnd1,'String');
    startSeconds = time2seconds(startTime);
    endSeconds = time2seconds(endTime);
    
    % Calculate new start and end samples
    startSample = startSeconds * rate1;
    endSample = endSeconds * rate1;
    
    % Update sound
    sound1 = sound1(round(startSample+1):round(endSample),:);
    duration1 = length(sound1)/rate1;
    time = seconds2time(duration1);
    
    % Plot sound and set axis labels and max length
    axes(handles.axes1);
    plot((0:length(sound1)-1)/rate1, sound1);
    xlabel('Time (s)'); ylabel('Amplitude');
    axis([0 length(sound1)/rate1 -1 1]);
    grid on;
    ax = gca;
    ax.FontSize = 8;

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
    
    % Update new sound
    sound2 = sound2(round(startSample+1):round(endSample),:);
    duration2 = length(sound2)/rate2;
    time = seconds2time(duration2);
    
    % Plot sound and set axis labels and max length
    axes(handles.axes2);
    plot((0:length(sound2)-1)/rate2, sound2);
    xlabel('Time (s)'); ylabel('Amplitude');
    axis([0 length(sound2)/rate2 -1 1]);
    grid on;
    ax = gca;
    ax.FontSize = 8;

    % Update source 1 controls
    set(handles.selectStart2, 'String', '00:00:00');
    set(handles.selectEnd2, 'String', time);
    set(handles.totalTime2, 'String', time);
    set(handles.source2Information, 'String', [FileName2 ' was trimmed successfully']);
end