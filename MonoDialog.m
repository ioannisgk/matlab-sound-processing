function varargout = MonoDialog(varargin)
% MONODIALOG MATLAB code for MonoDialog.fig
%      MONODIALOG, by itself, creates a new MONODIALOG or raises the existing
%      singleton*.
%
%      H = MONODIALOG returns the handle to a new MONODIALOG or the handle to
%      the existing singleton*.
%
%      MONODIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MONODIALOG.M with the given input arguments.
%
%      MONODIALOG('Property','Value',...) creates a new MONODIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MonoDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MonoDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MonoDialog

% Last Modified by GUIDE v2.5 26-Dec-2017 15:12:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MonoDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @MonoDialog_OutputFcn, ...
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


% --- Executes just before MonoDialog is made visible.
function MonoDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MonoDialog (see VARARGIN)

% Choose default command line output for MonoDialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MonoDialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MonoDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cancelButton.
function cancelButton_Callback(hObject, eventdata, handles)
% Close dialogue box
close(MonoDialog);


% --- Executes on button press in applyButton.
function applyButton_Callback(hObject, eventdata, handles)
% convert stereo sound to mono by removing a channel
convertMono(handles);
close(MonoDialog);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in leftRadio.
function leftRadio_Callback(hObject, eventdata, handles)
% Set mono value to left or right
global mono;
buttonState = get(handles.leftRadio, 'Value');
if buttonState == get(handles.leftRadio, 'Max')
    mono = 'left';
elseif buttonState == get(handles.leftRadio, 'Min')
    mono = 'right';
end

% --- Executes on button press in rightRadio.
function rightRadio_Callback(hObject, eventdata, handles)
% Set mono value to left or right
global mono;
buttonState = get(handles.rightRadio, 'Value');
if buttonState == get(handles.rightRadio, 'Max')
    mono = 'right';
elseif buttonState == get(handles.rightRadio, 'Min')
    mono = 'left';
end
