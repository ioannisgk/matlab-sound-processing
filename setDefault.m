function [] = setDefault(handles)
% Function to set default values to UI controls

% Default variables
global volume1;
global volume2;
global filter1;
global filter2;
global mono;
volume1 = 1;
volume2 = 1;
filter1 = 'high';
filter2 = 'high';
mono = 'left';

% Default source 1 info controls
set(handles.audioFormatInfo1, 'String', '-');
set(handles.channelsInfo1, 'String', '-');
set(handles.sampleRateInfo1, 'String', '-');
set(handles.source1Information, 'String', 'Source 1 Information');

% Default source 2 info controls
set(handles.audioFormatInfo2, 'String', '-');
set(handles.channelsInfo2, 'String', '-');
set(handles.sampleRateInfo2, 'String', '-');
set(handles.source2Information, 'String', 'Source 2 Information');

% Default source 1 trim controls
set(handles.selectStart1, 'String', '00:00:00');
set(handles.selectEnd1, 'String', '00:00:00');
set(handles.totalTime1, 'String', '00:00:00');

% Default source 2 trim controls
set(handles.selectStart2, 'String', '00:00:00');
set(handles.selectEnd2, 'String', '00:00:00');
set(handles.totalTime2, 'String', '00:00:00');

% Default slider settings
set(handles.speedSlider1, 'Value', 1);
set(handles.volumeSlider1, 'Value', 1);
set(handles.filterSlider1, 'Value', 1);
set(handles.speedSlider2, 'Value', 1);
set(handles.volumeSlider2, 'Value', 1);
set(handles.filterSlider2, 'Value', 1);

% Default slider text settings
set(handles.speedSliderText1, 'String', '1.00');
set(handles.volumeSliderText1, 'String', '1.00');
set(handles.filterSliderText1, 'String', '1.00');
set(handles.speedSliderText2, 'String', '1.00');
set(handles.volumeSliderText2, 'String', '1.00');
set(handles.filterSliderText2, 'String', '1.00');
set(handles.selectTime, 'String', '00:00:00');
set(handles.exportFilename, 'String', 'Filename');