function [] = setDefault(handles)
% Function to set default values to UI controls

% Default variables
global masterVolume;
global volume1;
global volume2;
global filter1;
global filter2;
global mono1;
global mono2;
global info;
global valid;
masterVolume = 1;
volume1 = 1;
volume2 = 1;
filter1 = 'high';
filter2 = 'high';
mono1 = 'left';
mono2 = 'left';
info = '';
valid = 1;

% Default info messages set to none
set(handles.infoMono1, 'String', '');
set(handles.infoEcho1, 'String', '');
set(handles.infoFilter1, 'String', '');
set(handles.infoActive1, 'String', '');
set(handles.infoMono2, 'String', '');
set(handles.infoEcho2, 'String', '');
set(handles.infoFilter2, 'String', '');
set(handles.infoActive2, 'String', '');

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

% Default source trim controls
set(handles.selectStart1, 'String', '00:00:00');
set(handles.selectEnd1, 'String', '00:00:00');
set(handles.totalTime1, 'String', '00:00:00');
set(handles.selectStart2, 'String', '00:00:00');
set(handles.selectEnd2, 'String', '00:00:00');
set(handles.totalTime2, 'String', '00:00:00');
set(handles.recStart1, 'String', '00:00');
set(handles.recStart2, 'String', '00:00');

% Default slider settings
set(handles.speedSlider1, 'Value', 1);
set(handles.volumeSlider1, 'Value', 1);
set(handles.filterSlider1, 'Value', 1);
set(handles.speedSlider2, 'Value', 1);
set(handles.volumeSlider2, 'Value', 1);
set(handles.filterSlider2, 'Value', 1);
set(handles.masterVolumeSlider, 'Value', 1);
set(handles.recSlider1, 'Value', 1);
set(handles.recSlider2, 'Value', 1);

% Default slider text settings
set(handles.speedSliderText1, 'String', '1.00');
set(handles.volumeSliderText1, 'String', '1.00');
set(handles.filterSliderText1, 'String', '1.00');
set(handles.speedSliderText2, 'String', '1.00');
set(handles.volumeSliderText2, 'String', '1.00');
set(handles.filterSliderText2, 'String', '1.00');
set(handles.masterVolumeSliderText, 'String', '1.00');
set(handles.recSliderText1, 'String', '1.00');
set(handles.recSliderText2, 'String', '1.00');
set(handles.selectTime, 'String', '00:00:00');

% Default button images
% https://www.mathworks.com/matlabcentral/answers/45634-how-to-put-a-picture-on-a-button-in-a-gui
set(handles.importSource1Button, 'CData', imread('/root/Matlab-Project/images/import.png'));
set(handles.importSource2Button, 'CData', imread('/root/Matlab-Project/images/import.png'));
set(handles.trimSource1, 'CData', imread('/root/Matlab-Project/images/trim.png'));
set(handles.trimSource2, 'CData', imread('/root/Matlab-Project/images/trim.png'));
set(handles.playAllButton, 'CData', imread('/root/Matlab-Project/images/play-all.png'));
set(handles.playActiveButton, 'CData', imread('/root/Matlab-Project/images/play.png'));
set(handles.pauseButton, 'CData', imread('/root/Matlab-Project/images/pause.png'));
set(handles.stopButton, 'CData', imread('/root/Matlab-Project/images/stop.png'));
set(handles.micButton1, 'CData', imread('/root/Matlab-Project/images/rec.png'));
set(handles.micButton2, 'CData', imread('/root/Matlab-Project/images/rec.png'));
set(handles.exportButton, 'CData', imread('/root/Matlab-Project/images/export.png'));
set(handles.exitButton, 'CData', imread('/root/Matlab-Project/images/exit.png'));

% Set specific controls to off to avoid errors on empty objects
% https://www.mathworks.com/matlabcentral/answers/104636-set-enable-propeprty-to-off
set(handles.filterSlider1,'Enable','off');
set(handles.filter1Options,'Enable','off');
set(handles.monoButton1,'Enable','off');
set(handles.echoButton1,'Enable','off');
set(handles.speedSlider1,'Enable','off');
set(handles.volumeSlider1,'Enable','off');
set(handles.activeSource1,'Enable','off');
set(handles.selectStart1,'Enable','inactive');
set(handles.selectEnd1,'Enable','inactive');

set(handles.filterSlider2,'Enable','off');
set(handles.filter2Options,'Enable','off');
set(handles.monoButton2,'Enable','off');
set(handles.echoButton2,'Enable','off');
set(handles.speedSlider2,'Enable','off');
set(handles.volumeSlider2,'Enable','off');
set(handles.activeSource2,'Enable','off');
set(handles.selectStart2,'Enable','inactive');
set(handles.selectEnd2,'Enable','inactive');

set(handles.selectTime,'Enable','off');
set(handles.masterVolumeSlider,'Enable','off');