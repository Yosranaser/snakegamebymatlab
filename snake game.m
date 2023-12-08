function varargout = untitled7(varargin)
% UNTITLED7 MATLAB code for untitled7.fig
%      UNTITLED7, by itself, creates a new UNTITLED7 or raises the existing
%      singleton*.
%
%      H = UNTITLED7 returns the handle to a new UNTITLED7 or the handle to
%      the existing singleton*.
%
%      UNTITLED7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED7.M with the given input arguments.
%
%      UNTITLED7('Property','Value',...) creates a new UNTITLED7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled7

% Last Modified by GUIDE v2.5 21-Dec-2022 14:09:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
              'gui_OpeningFcn', @untitled7_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled7_OutputFcn, ...
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


% --- Executes just before untitled7 is made visible.
function untitled7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sheet_10_2 (see VARARGIN)

% Choose default command line output for sheet_10_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sheet_10_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
axis('off');



% --- Outputs from this function are returned to the command line.
function varargout = untitled7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in snake_up.
function snake_up_Callback(hObject, eventdata, handles)
% hObject    handle to snake_up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if ~(direction==4)
    direction=2;
    move_status=1;
end

% --- Executes on button press in snake_right.
function snake_right_Callback(hObject, eventdata, handles)
% hObject    handle to snake_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if ~(direction==3)
    direction=1;
    move_status=1;
end


% --- Executes on button press in pause_game.
function pause_game_Callback(hObject, eventdata, handles)
% hObject    handle to pause_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global move_status;
move_status=0;
 

% --- Executes on button press in snake_left.
function snake_left_Callback(hObject, eventdata, handles)
% hObject    handle to snake_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if ~(direction==1)
    direction=3;
    move_status=1;
end


% --- Executes on button press in snake_down.
function snake_down_Callback(hObject, eventdata, handles)
% hObject    handle to snake_down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if ~(direction==2)
    direction=4;
    move_status=1; 
end



% --- Executes on button press in end_game.
function end_game_Callback(hObject, eventdata, handles)
% hObject    handle to end_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
clc;
close;
 
 % --- Executes on button press in start_game.
function start_game_Callback(hObject, eventdata, handles)
% hObject    handle to start_game (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mat_r mat_b mat_g ;
global direction;direction=3;
global points ;points=0;
global t ;t=0.04;
global move_status; move_status=0;
%to create bodey of snake
arr_hight=[50 50 50 50 50 50 50 50 50 50];
arr_long=[60 61 62 63 64 65 66 67 68 69];
%zeros matrix black but ones+avalue gets a color (255**w)
mat_r=zeros(100);
mat_g=zeros(100);
mat_b=zeros(100);
% generating the target randperm(maxposition which snake can locate in (100),size
%1*1 matrix)
while (1)
    foot_x=randperm(size(mat_r,1),1);
     foot_y=randperm(size(mat_r,1),1);
    if sum(arr_hight==foot_x & arr_long==foot_y)==0
        break;
    end
end
%the target color 
%make the three plates 255 produce ---white---
mat_r(foot_x,foot_y)=255;
mat_g(foot_x,foot_y)=255;
mat_b(foot_x,foot_y)=255;
%to choice the level of playing

if (get(handles.no_boards,'value')==1)
    set(handles.with_boards,'enable','off');
     update_snake(arr_hight,arr_long);
elseif (get(handles.with_boards,'value')==1)
    set(handles.no_boards,'enable','off');
    update_snake_2(arr_hight,arr_long);
end


%main while in the program which will end when the snake eat it self
while (1)
    imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
    pause(t);
    if (move_status)
    len=length(arr_hight);
% for_loop for clearing the oldest increasing of snake at starting
    for i=1:len
         mat_r(arr_hight(i),arr_long(i))=0;
         mat_g(arr_hight(i),arr_long(i))=0;
         mat_b(arr_hight(i),arr_long(i))=0;
    end
%this step to check  if the snake eat a target
%to increasing his size after getting the target
    if sum((arr_hight(1)==foot_x )& (arr_long(1)==foot_y))==1
        arr_hight(2:len+1)=arr_hight(1:len);
        arr_long(2:len+1)=arr_long(1:len);
%this step generate another target after eating first ones
        while (1)
            foot_x=randperm(size(mat_r,1),1);
            foot_y=randperm(size(mat_r,1),1);
            mat_r(foot_x,foot_y)=255;
            mat_g(foot_x,foot_y)=255;
            mat_b(foot_x,foot_y)=255;
%this step tell if snake dont eat old target yet,continue this move without creating new one     
             if sum((arr_hight==foot_x)& (arr_long==foot_y))==0
                  break;
             end
        end
        points=points+1; 
        set(handles.score,'string',num2str(points));
    else
%this step tell if snake dont eat old target yet,the length of snake still costant
    arr_hight(2:len)=arr_hight(1:len-1);
    arr_long(2:len)=arr_long(1:len-1);
    end
%*********************************
%move right
%if snake reach to the end of right of the screen
%make it start from the first again 
%else increase it step by 1
if (get(handles.no_boards,'value')==1)
    %right
    if direction==1
        if arr_long(1)==100
            arr_long(1)=1;
        else
            arr_long(1)=arr_long(1)+1;
        end
        %up
    elseif direction==2
        if arr_hight(1)==1
            arr_hight(1)=100;
        else
            arr_hight(1)=arr_hight(1)-1;
        end
        %left
    elseif direction==3
        if arr_long(1)==1
            arr_long(1)=100;
        else
             arr_long(1)=arr_long(1)-1;
        end
        %down
    elseif direction==4
        if arr_hight(1)==100
            arr_hight(1)=1;
        else
            arr_hight(1)=arr_hight(1)+1;
        end
      end
  elseif (get(handles.with_boards,'value')==1)
      if direction==1
        if arr_long(1)==100
             mat_r(:,:)=255;
             mat_b(:,:)=0;
            imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.score,'string',num2str(points));
        else
            arr_long(1)=arr_long(1)+1;
        end
      elseif direction==2
        if arr_hight(1)==1
            mat_r(:,:)=255;
             mat_b(:,:)=0;
            imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.score,'string',num2str(points));
        else
            arr_hight(1)=arr_hight(1)-1;
        end
      elseif direction==3
        if arr_long(1)==1
             mat_r(:,:)=255;
             mat_b(:,:)=0;
            imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.score,'string',num2str(points));
        else
             arr_long(1)=arr_long(1)-1;
        end
      elseif direction==4
        if arr_hight(1)==100
             mat_r(:,:)=255;
             mat_b(:,:)=0;
            imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.score,'string',num2str(points));
        else
            arr_hight(1)=arr_hight(1)+1;
        end
       end
end
%for killing snake himself
if sum((arr_hight(2:end)==arr_hight(1)) & (arr_long(2:end)==arr_long(1)))
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.score,'string',num2str(points));
             set(handles.with_boards,'enable','on');
             set(handles.with_boards,'value',0);
             set(handles.no_boards,'enable','on');
             set(handles.no_boards,'value',0);
             break;
 end
%increasing the speed due to insreasing score
        update_snake (arr_hight,arr_long)
    if points==1
             t=.05;
         elseif points==10
             t=0.03;
         elseif points==15
             t=0.01;
         elseif points==30
             t=0.009;
         elseif points==50
             t=0.008;
    end
    end
end
    

function score_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
%to control movement of snake from keyboard
switch(eventdata.Key)
    case 'uparrow'
        if ~(direction==4)
            direction=2;
            move_status=1;
        end
    case 'downarrow'
        if ~(direction==2)
            direction=4;
            move_status=1;
        end
    case 'rightarrow'
        if ~(direction==3)
            direction=1;
            move_status=1;
        end
    case 'leftarrow'
        if ~(direction==1)
            direction=3;
            move_status=1;
        end
    case 'return'
        move_status=0;
    otherwise
        direction=direction;
        move_status=1;
end



% --- Executes on button press in with_boards.
function with_boards_Callback(hObject, eventdata, handles)
% hObject    handle to with_boards (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of with_boards
function update_snake_2(arr_hight,arr_long)
    global mat_r mat_g mat_b;
 mat_r(arr_hight(1),arr_long(1))=255;
 mat_g(arr_hight(1),arr_long(1))=0;
 mat_b(arr_hight(1),arr_long(1))=0;
 
 for i=2:length(arr_long);
    mat_r(arr_hight(i),arr_long(i))=0;
    mat_g(arr_hight(i),arr_long(i))=225;
    mat_b(arr_hight(i),arr_long(i))=0;
 end
 mat_r(1:100,1)=255;
 mat_r(1:100,100)=255;
 mat_r(1,1:100)=255;
 mat_r(100,1:100)=255;


% --- Executes on button press in no_boards.
function no_boards_Callback(hObject, eventdata, handles)
% hObject    handle to no_boards (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of no_boards
function update_snake(arr_hight,arr_long)
 global mat_r mat_g mat_b;
 mat_r(arr_hight(1),arr_long(1))=255;
 mat_g(arr_hight(1),arr_long(1))=0;
 mat_b(arr_hight(1),arr_long(1))=0;
 
 for i=2:length(arr_long);
    mat_r(arr_hight(i),arr_long(i))=0;
    mat_g(arr_hight(i),arr_long(i))=225;
    mat_b(arr_hight(i),arr_long(i))=0;
 end
