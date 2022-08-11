function varargout = DIP_Semester_Project_SMS(varargin)
% DIP_SEMESTER_PROJECT_SMS MATLAB code for DIP_Semester_Project_SMS.fig
%      DIP_SEMESTER_PROJECT_SMS, by itself, creates a new DIP_SEMESTER_PROJECT_SMS or raises the existing
%      singleton*.
%
%      H = DIP_SEMESTER_PROJECT_SMS returns the handle to a new DIP_SEMESTER_PROJECT_SMS or the handle to
%      the existing singleton*.
%
%      DIP_SEMESTER_PROJECT_SMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP_SEMESTER_PROJECT_SMS.M with the given input arguments.
%
%      DIP_SEMESTER_PROJECT_SMS('Property','Value',...) creates a new DIP_SEMESTER_PROJECT_SMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIP_Semester_Project_SMS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIP_Semester_Project_SMS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIP_Semester_Project_SMS

% Last Modified by GUIDE v2.5 14-Jun-2021 19:32:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIP_Semester_Project_SMS_OpeningFcn, ...
                   'gui_OutputFcn',  @DIP_Semester_Project_SMS_OutputFcn, ...
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


% --- Executes just before DIP_Semester_Project_SMS is made visible.
function DIP_Semester_Project_SMS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIP_Semester_Project_SMS (see VARARGIN)

% Choose default command line output for DIP_Semester_Project_SMS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIP_Semester_Project_SMS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIP_Semester_Project_SMS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global global_img;
[file,path]=uigetfile('*.*', 'Select file');
                  a= imread(file);
                  global_img=rgb2gray(a);
                  axes(handles.axes1);
                  imshow(global_img);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_img;
global finalimg;
sapcheck=get(handles.sap,'Value');
gauscheck=get(handles.gaucheck,'Value');
white=get(handles.salt_inp,'String');  
black=get(handles.pepper_inpu, 'String');
mean=get(handles.mean_inp,'String'); 
var=get(handles.var_inp,'String'); 
if(sapcheck==1 && gauscheck==0)
    finalimg=imnoise(global_img,'salt & pepper',str2double(white)+str2double(black));
    axes(handles.axes2);
    imshow(finalimg);
    axes(handles.axes3);
    imhist(finalimg);
end
if(sapcheck==0 && gauscheck==1)
    finalimg=imnoise(global_img,'gaussian',str2double(mean),str2double(var));
    axes(handles.axes2);
    imshow(finalimg);
    axes(handles.axes3);
    imhist(finalimg);
end


if(sapcheck==1 && gauscheck==1)
    newimg=imnoise(global_img,'salt & pepper',str2double(white)+str2double(black));
    finalimg=imnoise(newimg,'gaussian',str2double(mean),str2double(var));
    axes(handles.axes2);
    imshow(finalimg);
    axes(handles.axes3);
    imhist(finalimg);
end

    

    

% --- Executes during object creation, after setting all properties.
function buttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in sap.
function sap_Callback(hObject, eventdata, handles)
% hObject    handle to sap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of sap



function salt_inp_Callback(hObject, eventdata, handles)
% hObject    handle to salt_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of salt_inp as text
%        str2double(get(hObject,'String')) returns contents of salt_inp as a double


% --- Executes during object creation, after setting all properties.
function salt_inp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to salt_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gaucheck.
function gaucheck_Callback(hObject, eventdata, handles)
% hObject    handle to gaucheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gaucheck



function mean_inp_Callback(hObject, eventdata, handles)
% hObject    handle to mean_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mean_inp as text
%        str2double(get(hObject,'String')) returns contents of mean_inp as a double


% --- Executes during object creation, after setting all properties.
function mean_inp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mean_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var_inp_Callback(hObject, eventdata, handles)
% hObject    handle to var_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var_inp as text
%        str2double(get(hObject,'String')) returns contents of var_inp as a double


% --- Executes during object creation, after setting all properties.
function var_inp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pepper_inp_Callback(hObject, eventdata, handles)
% hObject    handle to pepper_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pepper_inp as text
%        str2double(get(hObject,'String')) returns contents of pepper_inp as a double


% --- Executes during object creation, after setting all properties.
function pepper_inp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pepper_inp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in unicheck.
function unicheck_Callback(hObject, eventdata, handles)
% hObject    handle to unicheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of unicheck


% --- Executes on button press in expcheck.
function expcheck_Callback(hObject, eventdata, handles)
% hObject    handle to expcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of expcheck


% --- Executes when selected object is changed in buttongroup3.
function buttongroup3_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttongroup3 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global finalimg;
if (get(handles.amfradio1,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.sized1,'String');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            sum1=sum(sum(A));
            s=sum1/(filtersize*filtersize);
            outputimg(i,j) = s; 
        end
    end
    axes(handles.axes4);
    imshow(outputimg);
end


if(get(handles.gmfradio2,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.sized1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1; 
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            p=prod(prod(A));
            s=(p).^(1/(filtersize*filtersize));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes4);
    imshow(outputimg);
end



if(get(handles.hmfradio3,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.sized1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=(filtersize-1)/2;
    paddedimg=padarray(finalimg2,[paddingsize paddingsize],'replicate','both');  
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
             [roww coll]=size(A);
            harmonicsum=0;
            for p=1:roww
                for q=1:coll
                    harmonicsum=harmonicsum+1/A(p,q);
                end
            end
            s=(filtersize*filtersize)/harmonicsum;
            outputimg(i,j) = s;           
        end
    end
    axes(handles.axes4);
    imshow(outputimg);
end


if(get(handles.minradio4,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.sized1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            s=min(min(A));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes4);
    imshow(outputimg);
end








if(get(handles.maxradio5,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.sized1,'String');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            s=max(max(A));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes4);
    imshow(outputimg);
end



if(get(handles.midradio6,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.sized1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            a= reshape(A',1,[]);
            sorta=sort(a);
            med=(ceil(length(sorta)/2));
            outputimg(i,j)=sorta(med);
        end
    end
    axes(handles.axes4);
    imshow(outputimg);
end



function sized1_Callback(hObject, eventdata, handles)
% hObject    handle to sized1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sized1 as text
%        str2double(get(hObject,'String')) returns contents of sized1 as a double


% --- Executes during object creation, after setting all properties.
function sized1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sized1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in buttongroup4.
function buttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global finalimg;
if (get(handles.Amfradio1,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size1,'String');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            sum1=sum(sum(A));
            s=sum1/(filtersize*filtersize);
            outputimg(i,j) = s; 
        end
    end
    axes(handles.axes5);
    imshow(outputimg);
end

if(get(handles.Gmfradio2,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1; 
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            p=prod(prod(A));
            s=(p).^(1/(filtersize*filtersize));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes5);
    imshow(outputimg);
end


if(get(handles.Hmfradio3,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=(filtersize-1)/2;
    paddedimg=padarray(finalimg2,[paddingsize paddingsize],'replicate','both');  
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
             [roww, coll]=size(A);
            harmonicsum=0;
            for p=1:roww
                for q=1:coll
                    harmonicsum=harmonicsum+1/A(p,q);
                end
            end
            s=(filtersize*filtersize)/harmonicsum;
            outputimg(i,j) = s;           
        end
    end
    axes(handles.axes5);
    imshow(outputimg);
end


if(get(handles.Minradio4,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            s=min(min(A));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes5);
    imshow(outputimg);
end

   
if(get(handles.Maxradio5,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size1,'String');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            s=max(max(A));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes5);
    imshow(outputimg);
end


if(get(handles.Midradio6,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size1,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            a= reshape(A',1,[]);
            sorta=sort(a);
            med=(ceil(length(sorta)/2));
            outputimg(i,j)=sorta(med);
        end
    end
    axes(handles.axes5);
    imshow(outputimg);
end

  











function Size1_Callback(hObject, eventdata, handles)
% hObject    handle to Size1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Size1 as text
%        str2double(get(hObject,'String')) returns contents of Size1 as a double


% --- Executes during object creation, after setting all properties.
function Size1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Size1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in buttongroup5.
function buttongroup5_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in buttongroup5 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global finalimg;
if (get(handles.AMFradio1,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size2,'String');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            sum1=sum(sum(A));
            s=sum1/(filtersize*filtersize);
            outputimg(i,j) = s; 
        end
    end
    axes(handles.axes6);
    imshow(outputimg);
end



if(get(handles.GMFradio2,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size2,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1; 
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            p=prod(prod(A));
            s=(p).^(1/(filtersize*filtersize));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes6);
    imshow(outputimg);
end


if(get(handles.HMFradio3,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size2,'string');
    filtersize=str2double(filtersize1);
    paddingsize=(filtersize-1)/2;
    paddedimg=padarray(finalimg2,[paddingsize paddingsize],'replicate','both');  
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
             [roww, coll]=size(A);
            harmonicsum=0;
            for p=1:roww
                for q=1:coll
                    harmonicsum=harmonicsum+1/A(p,q);
                end
            end
            s=(filtersize*filtersize)/harmonicsum;
            outputimg(i,j) = s;           
        end
    end
    axes(handles.axes6);
    imshow(outputimg);
end



if(get(handles.MINradio4,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size2,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            s=min(min(A));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes6);
    imshow(outputimg);
end



if(get(handles.MAXradio5,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size2,'String');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            s=max(max(A));
            outputimg(i,j) = s;               
        end
    end
    axes(handles.axes6);
    imshow(outputimg);
end


if(get(handles.MIDradio6,'Value') == 1)
    finalimg2=im2double(finalimg);
    [row,col] = size(finalimg2);
    filtersize1=get(handles.Size2,'string');
    filtersize=str2double(filtersize1);
    paddingsize=filtersize-1;
    m=ceil(filtersize/2);
    paddedimg = zeros(row+paddingsize,col+paddingsize) ;           
    paddedimg(m:row+(m-1),m:col+(m-1)) = finalimg2(1:row, 1:col); 
    outputimg=zeros(row, col);
    for i=1:row 
        for j=1:col  
            A=paddedimg((i:i+filtersize-1),j:j+filtersize-1);
            a= reshape(A',1,[]);
            sorta=sort(a);
            med=(ceil(length(sorta)/2));
            outputimg(i,j)=sorta(med);
        end
    end
    axes(handles.axes6);
    imshow(outputimg);
end

  
   






function Size2_Callback(hObject, eventdata, handles)
% hObject    handle to Size2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Size2 as text
%        str2double(get(hObject,'String')) returns contents of Size2 as a double


% --- Executes during object creation, after setting all properties.
function Size2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Size2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pepper_inpu_Callback(hObject, eventdata, handles)
% hObject    handle to pepper_inpu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pepper_inpu as text
%        str2double(get(hObject,'String')) returns contents of pepper_inpu as a double


% --- Executes during object creation, after setting all properties.
function pepper_inpu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pepper_inpu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
