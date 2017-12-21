function varargout = camera_gui(varargin)



% CAMERA_GUI MATLAB code for camera_gui.fig
%      CAMERA_GUI, by itself, creates a new CAMERA_GUI or raises the existing
%      singleton*.
%
%      H = CAMERA_GUI returns the handle to a new CAMERA_GUI or the handle to
%      the existing singleton*.
%
%      CAMERA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAMERA_GUI.M with the given input arguments.
%
%      CAMERA_GUI('Property','Value',...) creates a new CAMERA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before camera_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to camera_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help camera_gui

% Last Modified by GUIDE v2.5 06-Nov-2017 01:58:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @camera_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @camera_gui_OutputFcn, ...
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


% --- Executes just before camera_gui is made visible.
function camera_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to camera_gui (see VARARGIN)

% Choose default command line output for camera_gui\
handles.take_image = 0;
handles.output = hObject;
%axes(handles.webcam_axes);
handles.video = videoinput('winvideo', 1, 'MJPG_640x480','Tag','Webcam');
hImage = image(zeros(640,480,3),'Parent',handles.webcam_axes);
preview(handles.video,hImage);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes camera_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = camera_gui_OutputFcn(hObject, eventdata, handles) 
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
frame = get(get(handles.webcam_axes,'children'),'cdata');
save('testframe.mat', 'frame');
disp('Frame saved to file ''testframe.mat''');
handles.take_image = 1;
guidata(hObject, handles);


    
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);


function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to myCameraGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
delete(imaqfind);
