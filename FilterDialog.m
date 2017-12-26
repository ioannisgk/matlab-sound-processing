function varargout = FilterDialog(varargin)
% FILTERDIALOG MATLAB code for FilterDialog.fig
%      FILTERDIALOG, by itself, creates a new FILTERDIALOG or raises the existing
%      singleton*.
%
%      H = FILTERDIALOG returns the handle to a new FILTERDIALOG or the handle to
%      the existing singleton*.
%
%      FILTERDIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTERDIALOG.M with the given input arguments.
%
%      FILTERDIALOG('Property','Value',...) creates a new FILTERDIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FilterDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FilterDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FilterDialog

% Last Modified by GUIDE v2.5 26-Dec-2017 19:04:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FilterDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @FilterDialog_OutputFcn, ...
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


% --- Executes just before FilterDialog is made visible.
function FilterDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FilterDialog (see VARARGIN)

% Default slider settings
set(handles.FpSlider, 'Value', 1);
set(handles.FstSlider, 'Value', 1);
set(handles.ApSlider, 'Value', 1);
set(handles.AstSlider, 'Value', 1);
set(handles.rateSlider, 'Value', 1);
set(handles.FpText, 'String', '1.00');
set(handles.FstText, 'String', '1.00');
set(handles.ApText, 'String', '1.00');
set(handles.AstText, 'String', '1.00');
set(handles.rateText, 'String', '1.00');

% Choose default command line output for FilterDialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FilterDialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FilterDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cancelButton.
function cancelButton_Callback(hObject, eventdata, handles)
% Close dialogue box
close(FilterDialog);


% --- Executes on button press in applyButton.
function applyButton_Callback(hObject, eventdata, handles)
% Apply high pass or low pass filter
global active;
applyFilter(handles, active, 'all-settings');
close(FilterDialog);


% --- Executes on slider movement.
function FpSlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.FpText, 'String', value);


% --- Executes during object creation, after setting all properties.
function FpSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FpSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function FstSlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.FstText, 'String', value);


% --- Executes during object creation, after setting all properties.
function FstSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FstSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ApSlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.ApText, 'String', value);


% --- Executes during object creation, after setting all properties.
function ApSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ApSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function AstSlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.AstText, 'String', value);


% --- Executes during object creation, after setting all properties.
function AstSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AstSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function rateSlider_Callback(hObject, eventdata, handles)
% Update slider text
value = get(hObject, 'Value');
set(handles.rateText, 'String', value);


% --- Executes during object creation, after setting all properties.
function rateSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rateSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in filterGraphButton.
function filterGraphButton_Callback(hObject, eventdata, handles)
% Generate filter response graph with fvtool
global Hd;
global filter1;
global filter2;
global active;

if strcmp(filter1, 'low') && active == 1
    
    calculateLowPass(handles, 'all-settings');
    fvtool(Hd);
    
elseif strcmp(filter1, 'high') && active == 1
    
    calculateHighPass(handles, 'all-settings');
    fvtool(Hd);

elseif strcmp(filter2, 'low') && active == 2
    
    calculateLowPass(handles, 'all-settings');
    fvtool(Hd);
    
elseif strcmp(filter2, 'high') && active == 2
    
    calculateHighPass(handles, 'all-settings');
    fvtool(Hd);
    
end
