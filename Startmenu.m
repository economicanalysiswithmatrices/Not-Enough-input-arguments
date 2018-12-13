function varargout = Startmenu(varargin)
% STARTMENU MATLAB code for Startmenu.fig
%      STARTMENU, by itself, creates a new STARTMENU or raises the existing
%      singleton*.
%
%      H = STARTMENU returns the handle to a new STARTMENU or the handle to
%      the existing singleton*.
%
%      STARTMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STARTMENU.M with the given input arguments.
%
%      STARTMENU('Property','Value',...) creates a new STARTMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Startmenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Startmenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Startmenu

% Last Modified by GUIDE v2.5 05-Dec-2018 19:00:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Startmenu_OpeningFcn, ...
                   'gui_OutputFcn',  @Startmenu_OutputFcn, ...
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


% --- Executes just before Startmenu is made visible.
function Startmenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Startmenu (see VARARGIN)

% Choose default command line output for Startmenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Startmenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Startmenu_OutputFcn(hObject, eventdata, handles) 
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



%hide first gui
set(gcf, 'Visible', 'off');
%open second gui
layout; %name of second gui