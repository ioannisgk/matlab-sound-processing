function [] = importSource(handles, source)
% Function to import sources and update controls

% Global variables for source 1
global FileName1;
global sound1;
global rate1;
global numChannels1;
global duration1;
global active;

% Global variables for source 2
global FileName2;
global sound2;
global rate2;
global numChannels2;
global duration2;

% Let user to browse for a file
[FileName,PathName] = uigetfile('*.wav*','Select an audio file');

% Read the audio file
[sound,rate] = audioread(FileName);
duration = length(sound)/rate;
time = seconds2time(duration);

% Open file in raw mode and check RIFF header
fileID = fopen(FileName);
rawFile = fread(fileID);
if rawFile(21)==1
    format = 'PCM Audio';
else format = 'Compressed';
end
numChannels = rawFile(23);
fclose(fileID);

if source == 1
    % Plot sound and set axis labels and max length
    axes(handles.axes1);
    plotSound(sound, rate);
    
    % Update source 1 controls
    set(handles.audioFormatInfo1, 'String', format);
    set(handles.channelsInfo1, 'String', numChannels);
    set(handles.sampleRateInfo1, 'String', rate);
    
    % Update source 1 trim controls
    set(handles.selectEnd1, 'String', time);
    set(handles.totalTime1, 'String', time);
    set(handles.source1Information, 'String', ['File loaded: ' FileName]);
    
    % Update global variables
    FileName1 = FileName;
    sound1 = sound;
    rate1 = rate;
    numChannels1 = numChannels;
    duration1 = duration;
    active = 1;
    
elseif source == 2
    % Plot sound and set axis labels and max length
    axes(handles.axes2);
    plotSound(sound, rate);

    % Update source 1 controls
    set(handles.audioFormatInfo2, 'String', format);
    set(handles.channelsInfo2, 'String', numChannels);
    set(handles.sampleRateInfo2, 'String', rate);
    
    % Update source 2 trim controls
    set(handles.selectEnd2, 'String', time);
    set(handles.totalTime2, 'String', time);
    set(handles.source2Information, 'String', ['File loaded: ' FileName]);
    
    % Update global variables
    FileName2 = FileName;
    sound2 = sound;
    rate2 = rate;
    numChannels2 = numChannels;
    duration2 = duration;
    active = 2;
end