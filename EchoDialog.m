function varargout = EchoDialog(varargin)
% ECHODIALOG MATLAB code for EchoDialog.fig
%      ECHODIALOG, by itself, creates a new ECHODIALOG or raises the existing
%      singleton*.
%
%      H = ECHODIALOG returns the handle to a new ECHODIALOG or the handle to
%      the existing singleton*.
%
%      ECHODIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECHODIALOG.M with the given input arguments.
%
%      ECHODIALOG('Property','Value',...) creates a new ECHODIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EchoDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EchoDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EchoDialog

% Last Modified by GUIDE v2.5 26-Dec-2017 15:13:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EchoDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @EchoDialog_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before EchoDialog is made visible.
function EchoDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EchoDialog (see VARARGIN)

% Default slider settings
set(handles.delaySlider, 'Value', 1);
set(handles.strengthSlider, 'Value', 1);
set(handles.delayText, 'String', '1.00');
set(handles.strengthText, 'String', '1.00');

% Choose default command line output for EchoDialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EchoDialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EchoDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cancelButton.
function cancelButton_Callback(hObject, eventdata, handles)
% Close dialogue box
close(EchoDialog);


% --- Executes on button press in applyButton.
function applyButton_Callback(hObject, eventdata, handles)
% Add echo to sound based on user settings

global sound1;
global rate1;
global sound2;
global rate2;
global active;

% Change poimter to indicate that GUI is busy
% https://www.mathworks.com/matlabcentral/answers/11411-how-to-indicate-that-gui-is-busy-running
set(handles.figure1, 'pointer', 'watch');
drawnow;

% http://ashanpeiris.blogspot.gr/2015/03/how-to-add-echo-effect-to-audio-signal.html
delay = str2num(get(handles.delayText, 'String'));
strength = str2num(get(handles.strengthText, 'String'));

if active == 1
    
    D = delay * rate1;  
    b = [1, zeros(1, round(D)), strength];  
    sound1 = filter(b, 1, sound1);
    
    % Update sound information
    updateSound(sound1, rate1, 1);
    updateInfo('infoEcho1', 'ECHO is enabled');
    updateInfo('source1Information', 'Added ECHO to source 1');
    
elseif active == 2
    
    D = delay * rate2;  
    b = [1, zeros(1, round(D)), strength];  
    sound2 = filter(b, 1, sound2);
    
    % Update sound information
    updateSound(sound2, rate2, 2);
    updateInfo('infoEcho2', 'ECHO is enabled');
    updateInfo('source2Information', 'Added ECHO to source 2');
    
end

% Restore pointer
set(handles.figure1, 'pointer', 'arrow');

close(EchoDialog);


% --- Executes on slider movement.
function delaySlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.delayText, 'String', value);


% --- Executes during object creation, after setting all properties.
function delaySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delaySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function strengthSlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.strengthText, 'String', value);


% --- Executes during object creation, after setting all properties.
function strengthSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strengthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
