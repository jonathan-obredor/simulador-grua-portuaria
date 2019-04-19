function varargout = GUI_grua(varargin)
% GUI_GRUA MATLAB code for GUI_grua.fig
%      GUI_GRUA, by itself, creates a new GUI_GRUA or raises the existing
%      singleton*.
%
%      H = GUI_GRUA returns the handle to a new GUI_GRUA or the handle to
%      the existing singleton*.
%
%      GUI_GRUA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_GRUA.M with the given input arguments.
%
%      GUI_GRUA('Property','Value',...) creates a new GUI_GRUA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_grua_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_grua_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_grua

% Last Modified by GUIDE v2.5 19-Mar-2019 20:49:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_grua_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_grua_OutputFcn, ...
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


% --- Executes just before GUI_grua is made visible.
function GUI_grua_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_grua (see VARARGIN)

% Choose default command line output for GUI_grua
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_grua wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_grua_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in deplegable.
function deplegable_Callback(hObject, eventdata, handles)
% hObject    handle to deplegable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns deplegable contents as cell array
%        contents{get(hObject,'Value')} returns selected item from deplegable
global a
str=get(hObject, 'String');
val=get(hObject, 'Value');
switch char(str(val))
    case 'Inicio'
        a=1
    case 'Configuracion'
        a=2
    case 'Operando'
        a=3
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function deplegable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deplegable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in toggleIniciar.
function toggleIniciar_Callback(hObject, eventdata, handles)
% hObject    handle to toggleIniciar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggleIniciar



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over toggleIniciar.
function toggleIniciar_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to toggleIniciar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sim('ProyectoAutomatasSimulink_jona')
