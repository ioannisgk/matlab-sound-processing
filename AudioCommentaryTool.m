%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
% TITLE:      AUDIO COMMENTARY & MIXING TOOL
% AUTHOR:     Ioannis Gkourtzounis
% CREATED:    01/01/2018
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
% INITIALIZATION
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

function varargout = AudioCommentaryTool(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AudioCommentaryTool_OpeningFcn, ...
                   'gui_OutputFcn',  @AudioCommentaryTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function varargout = AudioCommentaryTool_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function AudioCommentaryTool_OpeningFcn(hObject, eventdata, handles, varargin)

% Set default values to UI controls
setDefault(handles);

handles.output = hObject;
guidata(hObject, handles);

%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
% UI CONTROLS INITIALIZATION
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

function activeSource2_CreateFcn(hObject, eventdata, handles)

function speedSlider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function volumeSlider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function filterSlider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function selectStart2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function selectEnd2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function totalTime2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function selectStart1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function selectEnd1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function totalTime1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function audioFormatInfo2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function channelsInfo2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sampleRateInfo2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function selectTime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function exportFilename_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function speedSlider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function volumeSlider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function filterSlider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function audioFormatInfo1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function channelsInfo1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sampleRateInfo1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
% CALLBACKS
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

% --- Executes on button press in micButton1.
function micButton1_Callback(hObject, eventdata, handles)
% Import recording 1 and update controls
importRecording(handles, 1);

% Hint: get(hObject,'Value') returns toggle state of micButton1

% --- Executes on button press in micButton2.
function micButton2_Callback(hObject, eventdata, handles)
% Import recording 2 and update controls
importRecording(handles, 2);

% Hint: get(hObject,'Value') returns toggle state of micButton2

% --- Executes on slider movement.
function speedSlider2_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.speedSliderText2, 'String', value);
updateInfo('source2Information', 'Source 2 speed changed');

% --- Executes on slider movement.
function volumeSlider2_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.volumeSliderText2, 'String', value);
updateInfo('source2Information', 'Source 2 volume changed');

% --- Executes on slider movement.
function filterSlider2_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.filterSliderText2, 'String', value);
applyFilter(handles, 2, 'one-setting');

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

function selectStart2_Callback(hObject, eventdata, handles)
% hObject    handle to selectStart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selectStart2 as text
%        str2double(get(hObject,'String')) returns contents of selectStart2 as a double

function selectEnd2_Callback(hObject, eventdata, handles)
% hObject    handle to selectEnd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selectEnd2 as text
%        str2double(get(hObject,'String')) returns contents of selectEnd2 as a double

function totalTime2_Callback(hObject, eventdata, handles)
% hObject    handle to totalTime2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalTime2 as text
%        str2double(get(hObject,'String')) returns contents of totalTime2 as a double

function selectStart1_Callback(hObject, eventdata, handles)
% hObject    handle to selectStart1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selectStart1 as text
%        str2double(get(hObject,'String')) returns contents of selectStart1 as a double

function selectEnd1_Callback(hObject, eventdata, handles)
% hObject    handle to selectEnd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selectEnd1 as text
%        str2double(get(hObject,'String')) returns contents of selectEnd1 as a double

function totalTime1_Callback(hObject, eventdata, handles)
% hObject    handle to totalTime1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalTime1 as text
%        str2double(get(hObject,'String')) returns contents of totalTime1 as a double

% --- Executes on button press in trimSource1.
function trimSource1_Callback(hObject, eventdata, handles)
% Trim source 1 based on start time and end time
trimSource(handles, 1);

% --- Executes on button press in trimSource2.
function trimSource2_Callback(hObject, eventdata, handles)
% Trim source 2 based on start time and end time
trimSource(handles, 2);

function audioFormatInfo2_Callback(hObject, eventdata, handles)
% hObject    handle to audioFormatInfo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of audioFormatInfo2 as text
%        str2double(get(hObject,'String')) returns contents of audioFormatInfo2 as a double

function channelsInfo2_Callback(hObject, eventdata, handles)
% hObject    handle to channelsInfo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelsInfo2 as text
%        str2double(get(hObject,'String')) returns contents of channelsInfo2 as a double

function sampleRateInfo2_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRateInfo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRateInfo2 as text
%        str2double(get(hObject,'String')) returns contents of sampleRateInfo2 as a double

% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% Stop player and reset paused and markers
stopPlaying();

% --- Executes on button press in pauseButton.
function pauseButton_Callback(hObject, eventdata, handles)
% Pause player and set paused to 1
global player;
global paused;
paused = 1;
pause(player);

% --- Executes on button press in playActiveButton.
function playActiveButton_Callback(hObject, eventdata, handles)
% Play active channel according to speed and volume settings
playActiveOrAll(handles, 'active');

% --- Executes on button press in playAllButton.
function playAllButton_Callback(hObject, eventdata, handles)
% Play both channels according to speed and volume settings
playActiveOrAll(handles, 'all');

function selectTime_Callback(hObject, eventdata, handles)
% hObject    handle to selectTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selectTime as text
%        str2double(get(hObject,'String')) returns contents of selectTime as a double

function exportFilename_Callback(hObject, eventdata, handles)
% hObject    handle to exportFilename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exportFilename as text
%        str2double(get(hObject,'String')) returns contents of exportFilename as a double

% --- Executes on button press in exportButton.
function exportButton_Callback(hObject, eventdata, handles)
% Export mixed sound to wav file
exportSound(handles);

% --- Executes on slider movement.
function speedSlider1_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.speedSliderText1, 'String', value);
updateInfo('source1Information', 'Source 1 speed changed');

% --- Executes on slider movement.
function volumeSlider1_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.volumeSliderText1, 'String', value);
updateInfo('source1Information', 'Source 1 volume changed');

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes on slider movement.
function filterSlider1_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.filterSliderText1, 'String', value);
applyFilter(handles, 1, 'one-setting');

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

function audioFormatInfo1_Callback(hObject, eventdata, handles)
% hObject    handle to audioFormatInfo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of audioFormatInfo1 as text
%        str2double(get(hObject,'String')) returns contents of audioFormatInfo1 as a double

function channelsInfo1_Callback(hObject, eventdata, handles)
% hObject    handle to channelsInfo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelsInfo1 as text
%        str2double(get(hObject,'String')) returns contents of channelsInfo1 as a double

function sampleRateInfo1_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRateInfo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRateInfo1 as text
%        str2double(get(hObject,'String')) returns contents of sampleRateInfo1 as a double

% --- Executes on button press in importSource1Button.
function importSource1Button_Callback(hObject, eventdata, handles)
% Import source 1 and update controls
importSource(handles, 1);

% --- Executes on button press in importSource2Button.
function importSource2Button_Callback(hObject, eventdata, handles)
% Import source 2 and update controls
importSource(handles, 2);

% --- Executes on button press in activeSource1.
function activeSource1_Callback(hObject, eventdata, handles)
% Set active value to 1 when source 1 is active
global active;
global player;
global paused;
buttonState = get(handles.activeSource1, 'Value');
if buttonState == get(handles.activeSource1, 'Max')
    active = 1;
elseif buttonState == get(handles.activeSource1, 'Min')
    active = 2;
end
stop(player);
paused = 0;

updateInfo('infoActive1', 'ACTIVE is enabled');
updateInfo('source1Information', 'ACTIVE is enabled for source 1');
updateInfo('source2Information', '');
updateInfo('infoActive2', '');

% --- Executes on button press in activeSource2.
function activeSource2_Callback(hObject, eventdata, handles)
% Set active value to 2 when source 2 is active
global active;
global player;
global paused;
buttonState = get(handles.activeSource2, 'Value');
if buttonState == get(handles.activeSource2, 'Max')
    active = 2;
elseif buttonState == get(handles.activeSource2, 'Min')
    active = 1;
end
stop(player);
paused = 0;

updateInfo('infoActive2', 'ACTIVE is enabled');
updateInfo('source2Information', 'ACTIVE is enabled for source 2');
updateInfo('source1Information', '');
updateInfo('infoActive1', '');

% --- Executes on button press in monoButton1.
function monoButton1_Callback(hObject, eventdata, handles)
% Make sound mono by adding zeros to the right channel
figure(MonoDialog);

% --- Executes on button press in monoButton2.
function monoButton2_Callback(hObject, eventdata, handles)
% Make sound mono by adding zeros to the right channel
figure(MonoDialog);

% --- Executes on button press in echoButton1.
function echoButton1_Callback(hObject, eventdata, handles)
% Add echo to sound 1
figure(EchoDialog);

% --- Executes on button press in highPassRadio1.
function highPassRadio1_Callback(hObject, eventdata, handles)
% Set filter1 value to high or low
global filter1;
buttonState = get(handles.highPassRadio1, 'Value');
if buttonState == get(handles.highPassRadio1, 'Max')
    filter1 = 'high';
elseif buttonState == get(handles.highPassRadio1, 'Min')
    filter1 = 'low';
end

% --- Executes on button press in lowPassRadio1.
function lowPassRadio1_Callback(hObject, eventdata, handles)
% Set filter1 value to high or low
global filter1;
buttonState = get(handles.lowPassRadio1, 'Value');
if buttonState == get(handles.lowPassRadio1, 'Max')
    filter1 = 'low';
elseif buttonState == get(handles.lowPassRadio1, 'Min')
    filter1 = 'high';
end


% --- Executes on button press in highPassRadio2.
function highPassRadio2_Callback(hObject, eventdata, handles)
% Set filter2 value to high or low
global filter2;
buttonState = get(handles.highPassRadio2, 'Value');
if buttonState == get(handles.highPassRadio2, 'Max')
    filter2 = 'high';
elseif buttonState == get(handles.highPassRadio2, 'Min')
    filter2 = 'low';
end

% --- Executes on button press in lowPassRadio2.
function lowPassRadio2_Callback(hObject, eventdata, handles)
% Set filter2 value to high or low
global filter2;
buttonState = get(handles.lowPassRadio2, 'Value');
if buttonState == get(handles.lowPassRadio2, 'Max')
    filter2 = 'low';
elseif buttonState == get(handles.lowPassRadio2, 'Min')
    filter2 = 'high';
end


% --- Executes on button press in filter1Options.
function filter1Options_Callback(hObject, eventdata, handles)
% Open filter options dialogue
figure(FilterDialog);


% --- Executes on button press in filter2Options.
function filter2Options_Callback(hObject, eventdata, handles)
% Open filter options dialogue
figure(FilterDialog);


% --- Executes on button press in echoButton2.
function echoButton2_Callback(hObject, eventdata, handles)
% Add echo to sound 2
figure(EchoDialog);


% --- Executes on slider movement.
function masterVolumeSlider_Callback(hObject, eventdata, handles)
% Update slider text
global masterVolume;
value = get(hObject, 'Value');
set(handles.masterVolumeSliderText, 'String', value);
masterVolume = str2num(get(handles.masterVolumeSliderText,'String'));


% --- Executes during object creation, after setting all properties.
function masterVolumeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to masterVolumeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in exitButton.
function exitButton_Callback(hObject, eventdata, handles)
% Offer option to properly close application and Matlab
% https://www.mathworks.com/help/matlab/ref/quit.html
button = questdlg('Are you ready to quit?','Exit Dialog','Yes','No','No');
switch button
    case 'Yes',
        clear all;
        quit force;
    case 'No',
        quit cancel;
end



function recStart1_Callback(hObject, eventdata, handles)
% hObject    handle to recStart1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of recStart1 as text
%        str2double(get(hObject,'String')) returns contents of recStart1 as a double


% --- Executes during object creation, after setting all properties.
function recStart1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recStart1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function recStart2_Callback(hObject, eventdata, handles)
% hObject    handle to recStart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of recStart2 as text
%        str2double(get(hObject,'String')) returns contents of recStart2 as a double


% --- Executes during object creation, after setting all properties.
function recStart2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recStart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function recSlider2_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.recSliderText2, 'String', value);


% --- Executes during object creation, after setting all properties.
function recSlider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function recSlider1_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.recSliderText1, 'String', value);


% --- Executes during object creation, after setting all properties.
function recSlider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to recSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
