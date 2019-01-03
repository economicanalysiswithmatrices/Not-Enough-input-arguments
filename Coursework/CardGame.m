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

	% Last Modified by GUIDE v2.5 02-Jan-2019 12:34:10

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
	guidata(hObject, handles);
	generateNewCard()
% UIWAIT makes CardGame wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CardGame_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Higher.
function Higher_Callback(hObject, eventdata, handles)
	prevCard = getGlobalCurrentCard()
	generateNewCard()
	newCard = getGlobalCurrentCard()
	msg = ['Your Previous Card Value is ', num2str(prevCard), ' and your New Card Value is ', num2str(newCard)]

	if prevCard < newCard
		warndlg(msg, 'Win')
	elseif prevCard == newCard
		warndlg(msg, 'Draw')
	else 
		warndlg(msg, 'Lose')
	end

% pushbutton2 is Lower button
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
	prevCard = getGlobalCurrentCard()
	generateNewCard()
	newCard = getGlobalCurrentCard()
	msg = ['Your Previous Card Value is ', num2str(prevCard), ' and your New Card Value is ', num2str(newCard)]

	if prevCard > newCard
		warndlg(msg, 'Win')
	elseif prevCard == newCard
		warndlg(msg, 'Draw')
	else 
		warndlg(msg, 'Lose')
	end


% --- Executes on button press in Quit.
function Quit_Callback(hObject, eventdata, handles)
	%closing the game
	close all;
