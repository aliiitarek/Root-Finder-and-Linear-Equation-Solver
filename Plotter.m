function varargout = Plotter(varargin)
% PLOTTER MATLAB code for Plotter.fig
%      PLOTTER, by itself, creates a new PLOTTER or raises the existing
%      singleton*.
%
%      H = PLOTTER returns the handle to a new PLOTTER or the handle to
%      the existing singleton*.
%
%      PLOTTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTTER.M with the given input arguments.
%
%      PLOTTER('Property','Value',...) creates a new PLOTTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Plotter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Plotter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Plotter

% Last Modified by GUIDE v2.5 24-Jun-2014 23:30:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Plotter_OpeningFcn, ...
                   'gui_OutputFcn',  @Plotter_OutputFcn, ...
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


% --- Executes just before Plotter is made visible.
function Plotter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Plotter (see VARARGIN)

% Choose default command line output for Plotter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Plotter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Plotter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function Plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Plot


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NEXTVET;
global counter;
global f;
global it;

fplot (f,[NEXTVET(counter,1)-5,NEXTVET(counter,3)+5]);
hold on;
title('The Given Function ');
xlabel('x');
ylabel('f(x)');
set(handles.text1,'String',counter);
if counter < it
    
    title('The Given Function ');
    xlabel('x');
    ylabel('f(x)');
    xl = [NEXTVET(counter,1) NEXTVET(counter,1)];
    yl = [-300 300];
    plot(xl,yl,'b');
    hold on;
    xu = [NEXTVET(counter,3) NEXTVET(counter,3)];
    yu = [-300 300];
    plot(xu,yu,'b');
    hold on;
    xr = [NEXTVET(counter,2) NEXTVET(counter,2)];
    yr = [-300 300];
    plot(xr,yr,'r');
    counter = counter +1;
    hold;
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NEXTVET;
global counter;
global f;

fplot (f,[NEXTVET(counter,1)-5,NEXTVET(counter,3)+5]);
hold on;
title('The Given Function ');
xlabel('x');
ylabel('f(x)');
set(handles.text1,'String',counter);
if counter > 1
    
    title('The Given Function ');
    xlabel('x');
    ylabel('f(x)');
    xl = [NEXTVET(counter,1) NEXTVET(counter,1)];
    yl = [-300 300];
    plot(xl,yl,'b');
    hold on;
    xu = [NEXTVET(counter,3) NEXTVET(counter,3)];
    yu = [-300 300];
    plot(xu,yu,'b');
    hold on;
    xr = [NEXTVET(counter,2) NEXTVET(counter,2)];
    yr = [-300 300];
    plot(xr,yr,'r');
    counter = counter - 1;
    hold;
end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%global counter;
