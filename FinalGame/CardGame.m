function varargout = CardGame(varargin)
	% CARDGAME MATLAB code for CardGame.fig
	%      CARDGAME, by itself, creates a new CARDGAME or raises the existing
	%      singleton*.
	%
	%      H = CARDGAME returns the handle to a new CARDGAME or the handle to
	%      the existing singleton*.
	%
	%      CARDGAME('CALLBACK',hObject,eventData,handles,...) calls the local
	%      function named CALLBACK in CARDGAME.M with the given input arguments.
	%
	%      CARDGAME('Property','Value',...) creates a new CARDGAME or raises the
	%      existing singleton*.  Starting from the left, property value pairs are
	%      applied to the GUI before CardGame_OpeningFcn gets called.  An
	%      unrecognized property name or invalid value makes property application
	%      stop.  All inputs are passed to CardGame_OpeningFcn via varargin.
	%
	%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
	%      instance to run (singleton)".
	%
	% See also: GUIDE, GUIDATA, GUIHANDLES

	% Edit the above text to modify the response to help CardGame

	% Last Modified by GUIDE v2.5 11-Jan-2019 15:54:40

	% Begin initialization code - DO NOT EDIT
	gui_Singleton = 1;
	gui_State = struct('gui_Name',       mfilename, ...
						'gui_Singleton',  gui_Singleton, ...
						'gui_OpeningFcn', @CardGame_OpeningFcn, ...
						'gui_OutputFcn',  @CardGame_OutputFcn, ...
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



function setGlobalCurrentCard(val)
	global currentCard
	currentCard = val;

function r = getGlobalCurrentCard
	global currentCard
	r = currentCard;


function generateNewCard()
	%Discard the privious card and generate a new random card.
	cla;
	allFiles = dir('*.jpg');
	baseFileNames = {'1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg', '9.jpg', '10.jpg', '11.jpg', '12.jpg', '13.jpg'};
	numberOfFiles = length(13);
	randomOrder = [randperm(13)];
	for k = 1 : 13
	filenumber = randomOrder(k);
	fullFileName = fullfile(pwd, baseFileNames{filenumber});
	img = imread(fullFileName);
	imshow(img);
	end
	setGlobalCurrentCard(filenumber)

% --- Executes just before CardGame is made visible.
function CardGame_OpeningFcn(hObject, eventdata, handles, varargin)
	% This function has no output args, see OutputFcn.
	% hObject    handle to figure
	% eventdata  reserved - to be defined in a future version of MATLAB
	% handles    structure with handles and user data (see GUIDATA)
	% varargin   command line arguments to CardGame (see VARARGIN)

	% Choose default command line output for CardGame
	handles.output = hObject;
	% Update handles structure
    % create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('background.jpeg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

	guidata(hObject, handles);
	generateNewCard()
% UIWAIT makes CardGame wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CardGame_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

global POINTS
POINTS= 0;
set(handles.POINTS, 'String', 'HIGHER OR LOWER');



% --- Executes on button press in Higher.
function Higher_Callback(hObject, eventdata, handles)
global POINTS

	prevCard = getGlobalCurrentCard();
	generateNewCard()
	newCard = getGlobalCurrentCard();
	
	if prevCard < newCard
   POINTS = (POINTS)+ 100
   set(handles.POINTS,'String','YOU WIN (+$100)');
   set(handles.edit4,'String', ['Winnings total: $',num2str(POINTS)]);
   

     [y,fs]=audioread('ChaChing.wav');
     sound(y,fs)
    
     
	elseif prevCard == newCard
		POINTS = POINTS + 0
   set(handles.POINTS,'String','DRAW,TRY AGAIN');
	else 
		POINTS = POINTS -100
   set(handles.POINTS,'String','YOU LOSE (-$100)');
   set(handles.edit4,'String', ['Winnings total: $',num2str(POINTS)]);
        [y,fs]=audioread('boooo.wav');
     sound(y,fs)
     
	end

% pushbutton2 is Lower button
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global POINTS

	prevCard = getGlobalCurrentCard();
	generateNewCard()
	newCard = getGlobalCurrentCard();

	if prevCard > newCard
	POINTS = POINTS + 100
   set(handles.POINTS,'String','YOU WIN (+$100)');
   set(handles.edit4,'String', ['Winnings total: $',num2str(POINTS)]);
        [y,fs]=audioread('ChaChing.wav');
     sound(y,fs)
     

	elseif prevCard == newCard
		POINTS = POINTS + 0
   set(handles.POINTS,'String','DRAW,TRY AGAIN');
	else 
			POINTS = POINTS - 100
   set(handles.POINTS,'String','YOU LOSE (-$100)');
   set(handles.edit4,'String', ['Winnings total: $',num2str(POINTS)]);
[y,fs]=audioread('boooo.wav');
     sound(y,fs)
	end


% --- Executes on button press in Quit.
function Quit_Callback(hObject, eventdata, handles)
	%closing the game
	promptMessage = sprintf('Are you sure you want to quit?');
titleBarCaption = 'Continue?';
button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'No');

if strcmpi(button, 'Yes')
      close all
      
      clear sound;
      
end


% --- Executes during object creation, after setting all properties.
function scoreboard_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scoreboard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function POINTS_Callback(hObject, eventdata, handles)
% hObject    handle to POINTS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of POINTS as text
%        str2double(get(hObject,'String')) returns contents of POINTS as a double


% --- Executes during object creation, after setting all properties.
function POINTS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to POINTS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global POINTS

highScore = max(POINTS);
set(handles.edit6, 'String', highScore)
set(handles.edit6,'String', ['High Score: $',num2str(POINTS)]);

POINTS='Winnings Total: $0';
POINTS=0;
set(handles.edit4, 'String', 'Winnings Total: $0');
set(handles.POINTS, 'String', 'HIGH-SCORE SAVED');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound;
set(gcf, 'Visible', 'off');
%open second gui
StartMenu2; %name of second gui
POINTS='Winnings Total: $0';
set(handles.edit4, 'String', POINTS);




% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
    
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double





% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global POINTS
highScore = max(POINTS);
set(handles.edit6,'String', ['Winnings total: $',num2str(POINTS)]);



% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
