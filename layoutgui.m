function varargout = layoutgui(varargin)
% LAYOUTGUI MATLAB code for layoutgui.fig
%      LAYOUTGUI, by itself, creates a new LAYOUTGUI or raises the existing
%      singleton*.
%
%      H = LAYOUTGUI returns the handle to a new LAYOUTGUI or the handle to
%      the existing singleton*.
%
%      LAYOUTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYOUTGUI.M with the given input arguments.
%
%      LAYOUTGUI('Property','Value',...) creates a new LAYOUTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before layoutgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to layoutgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help layoutgui

% Last Modified by GUIDE v2.5 11-Dec-2018 17:18:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @layoutgui_OpeningFcn, ...
                   'gui_OutputFcn',  @layoutgui_OutputFcn, ...
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


% --- Executes just before layoutgui is made visible.
function layoutgui_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to layoutgui (see VARARGIN)

% Choose default command line output for layoutgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes layoutgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = layoutgui_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function axes25_CreateFcn(HObject, ~, ~)
% hObject    handle to axes25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: place code in OpeningFcn to populate axes25
allFiles = dir('*.jpg');
baseFileNames = {'Poker2.jpg', 'poker3.jpg', 'Poker4.jpg', 'Poker5.jpg', 'Poker6.jpg', 'Poker7.jpg', 'Poker8.jpg', 'Poker9.jpg', 'Poker10.jpg', 'PokerAce.jpg', 'PokerJack.jpg', 'Pokerking.jpg', 'PokerQueen.jpg'};
numberOfFiles = length(13);
randomOrder = [randperm(13)];
for k = 1 : 13
  filenumber = randomOrder(k);
  fullFileName = fullfile(pwd, baseFileNames{filenumber});

% Hint: place code in OpeningFcn to populate axes25
img = imread(fullFileName);
imshow(img);
end


% --- Executes on button press in Higher.
function Higher_Callback(hObject, eventdata, handles)
% hObject    handle to Higher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
allFiles = dir('*.jpg');
baseFileNames = {'Poker2.jpg', 'poker3.jpg', 'Poker4.jpg', 'Poker5.jpg', 'Poker6.jpg', 'Poker7.jpg', 'Poker8.jpg', 'Poker9.jpg', 'Poker10.jpg', 'PokerAce.jpg', 'PokerJack.jpg', 'Pokerking.jpg', 'PokerQueen.jpg'};
numberOfFiles = length(13);
randomOrder = [randperm(13)];
for k = 1 : 13
  filenumber = randomOrder(k);
  fullFileName = fullfile(pwd, baseFileNames{filenumber});

% Hint: place code in OpeningFcn to populate axes25
img = imread(fullFileName);
imshow(img);
end



% --- Executes on button press in Lower.
function Lower_Callback(hObject, eventdata, handles)
% hObject    handle to Lower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
allFiles = dir('*.jpg');
baseFileNames = {'Poker2.jpg', 'poker3.jpg', 'Poker4.jpg', 'Poker5.jpg', 'Poker6.jpg', 'Poker7.jpg', 'Poker8.jpg', 'Poker9.jpg', 'Poker10.jpg', 'PokerAce.jpg', 'PokerJack.jpg', 'Pokerking.jpg', 'PokerQueen.jpg'};
numberOfFiles = length(13);
randomOrder = [randperm(13)];
for k = 1 : 13
  filenumber = randomOrder(k);
  fullFileName = fullfile(pwd, baseFileNames{filenumber});

% Hint: place code in OpeningFcn to populate axes25
img = imread(fullFileName);
imshow(img);
end




