function [] = importSource(handles, source)
% Function to import sources and update controls

% Global variables for source 1
global player;
global paused;
global FileName1;
global sound1;
global rate1;
global numChannels1;
global duration1;
global active;
global m1;
global axeHandler1;

% Global variables for source 2
global FileName2;
global sound2;
global rate2;
global numChannels2;
global duration2;
global m2;
global axeHandler2;

% Enable the user to browse for a file
% https://www.mathworks.com/help/matlab/ref/uigetfile.html
[FileName,PathName] = uigetfile({'*.wav';'*.mp3';'*.avi';'*.mpg'},...
'Select a file with audio source: *.wav, *.mp3, *.avi, *.mpg');

% Change pointer to indicate that GUI is busy
% https://www.mathworks.com/matlabcentral/answers/11411-how-to-indicate-that-gui-is-busy-running
set(handles.figure1, 'pointer', 'watch');
drawnow;

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

    paused = 0;

    % Plot sound and set axis labels and max length
    axeHandler1 = handles.axes1;
    axes(handles.axes1);
    plotSound(sound, rate);

    % Delete old marker and create a new one
    if exist('m1', 'var')
        delete(m1);
    end
    m1=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);

    % Update source 1 controls
    set(handles.audioFormatInfo1, 'String', format);
    set(handles.channelsInfo1, 'String', numChannels);
    set(handles.sampleRateInfo1, 'String', rate);

    % Update source 1 trim controls
    set(handles.selectEnd1, 'String', time);
    set(handles.totalTime1, 'String', time);

    % Update global variables
    FileName1 = FileName;
    sound1 = sound;
    rate1 = rate;
    numChannels1 = numChannels;
    duration1 = duration;
    active = 1;

    % Set source 1 info and sliders to default
    set(handles.speedSlider1, 'Value', 1);
    set(handles.volumeSlider1, 'Value', 1);
    set(handles.filterSlider1, 'Value', 1);
    set(handles.speedSliderText1, 'String', '1.00');
    set(handles.volumeSliderText1, 'String', '1.00');
    set(handles.filterSliderText1, 'String', '1.00');
    set(handles.infoMono1, 'String', '');
    set(handles.infoEcho1, 'String', '');
    set(handles.infoFilter1, 'String', '');
    set(handles.infoActive1, 'String', '');

    % Update info mesages
    updateInfo('infoActive1', 'ACTIVE is enabled');
    updateInfo('source1Information', ['ACTIVE is enabled, source 1 imported: ' FileName]);
    updateInfo('source2Information', '');
    updateInfo('infoActive2', '');

    % Enable controls for source 1
    set(handles.filterSlider1,'Enable','on');
    set(handles.filter1Options,'Enable','on');
    set(handles.monoButton1,'Enable','on');
    set(handles.echoButton1,'Enable','on');
    set(handles.speedSlider1,'Enable','on');
    set(handles.volumeSlider1,'Enable','on');
    set(handles.activeSource1,'Enable','on');
    set(handles.selectStart1,'Enable','on');
    set(handles.selectEnd1,'Enable','on');
    set(handles.selectTime,'Enable','on');
    set(handles.masterVolumeSlider,'Enable','on');

elseif source == 2

    paused = 0;

    % Plot sound and set axis labels and max length
    axeHandler2 = handles.axes2;
    axes(handles.axes2);
    plotSound(sound, rate);

    % Delete old marker and create a new one
    if exist('m2', 'var')
        delete(m2);
    end
    m2=line([0,0],[-30,30],'color','r','marker', 'o', 'linewidth', 1);

    % Update source 1 controls
    set(handles.audioFormatInfo2, 'String', format);
    set(handles.channelsInfo2, 'String', numChannels);
    set(handles.sampleRateInfo2, 'String', rate);

    % Update source 2 trim controls
    set(handles.selectEnd2, 'String', time);
    set(handles.totalTime2, 'String', time);

    % Update global variables
    FileName2 = FileName;
    sound2 = sound;
    rate2 = rate;
    numChannels2 = numChannels;
    duration2 = duration;
    active = 2;

    % Set source 2 info and sliders to default
    set(handles.speedSlider2, 'Value', 1);
    set(handles.volumeSlider2, 'Value', 1);
    set(handles.filterSlider2, 'Value', 1);
    set(handles.speedSliderText2, 'String', '1.00');
    set(handles.volumeSliderText2, 'String', '1.00');
    set(handles.filterSliderText2, 'String', '1.00');
    set(handles.infoMono2, 'String', '');
    set(handles.infoEcho2, 'String', '');
    set(handles.infoFilter2, 'String', '');
    set(handles.infoActive2, 'String', '');

    % Update info mesages
    updateInfo('infoActive2', 'ACTIVE is enabled');
    updateInfo('source2Information', ['ACTIVE is enabled, source 2 imported: ' FileName]);
    updateInfo('source1Information', '');
    updateInfo('infoActive1', '');

    % Enable controls for source 2
    set(handles.filterSlider2,'Enable','on');
    set(handles.filter2Options,'Enable','on');
    set(handles.monoButton2,'Enable','on');
    set(handles.echoButton2,'Enable','on');
    set(handles.speedSlider2,'Enable','on');
    set(handles.volumeSlider2,'Enable','on');
    set(handles.activeSource2,'Enable','on');
    set(handles.selectStart2,'Enable','on');
    set(handles.selectEnd2,'Enable','on');
    set(handles.selectTime,'Enable','on');
    set(handles.masterVolumeSlider,'Enable','on');

end

% Restore pointer
set(handles.figure1, 'pointer', 'arrow');
