function varargout = foodspeed(varargin)
% FOODSPEED MATLAB code for foodspeed.fig
%      FOODSPEED, by itself, creates a new FOODSPEED or raises the existing
%      singleton*.
%
%      H = FOODSPEED returns the handle to a new FOODSPEED or the handle to
%      the existing singleton*.
%
%      FOODSPEED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOODSPEED.M with the given input arguments.
%
%      FOODSPEED('Property','Value',...) creates a new FOODSPEED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before foodspeed_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to foodspeed_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES


% Edit the above text to modify the response to help foodspeed

% Last Modified by GUIDE v2.5 17-Dec-2020 21:01:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @foodspeed_OpeningFcn, ...
                   'gui_OutputFcn',  @foodspeed_OutputFcn, ...
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


% --- Executes just before foodspeed is made visible.
function foodspeed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to foodspeed (see VARARGIN)

% Choose default command line output for foodspeed
handles.output = hObject;

% table of chosen ingredients
              %  mass       density         surface         heat cap.     T
handles.agents =  [  5           1            1                1          85 ];

handles.basetable=[  5           1            1                1          -2      ;...         %Egg
                     3           3            2                1          -5     ;... %Carrot
                                                                                   %others
];
handles.temperature_grapher = [ ];

handles.chosenlist.Visible='off';
handles.removbtn.Visible='off';
handles.startbtn.Visible='off';
handles.textnext.Visible='off';
handles.texttime.Visible='off';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes foodspeed wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = foodspeed_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in foodlist.
function foodlist_Callback(hObject, eventdata, handles)
% hObject    handle to foodlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns foodlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from foodlist


% --- Executes during object creation, after setting all properties.
function foodlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to foodlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editmass_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editmass_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editamount_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editamount_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function chosenlist_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function chosenlist_Callback(hObject, eventdata, handles)
%placeholder




% --- Executes on button press in addbtn.
function addbtn_Callback(hObject, eventdata, handles)

%use mass
m=str2double(get(handles.editmass,'String'));
if ~isfinite(m)
    set(handles.editmass,'String','.');
    pause(.2)
    set(handles.editmass,'String','. .');
    pause(.2)
    set(handles.editmass,'String','. . .');
    pause(.2)

    set(handles.editmass,'String','Insert Approx Mass');
    return
end

n=str2double(get(handles.editamount,'String'));
if ~isfinite(n)
    set(handles.editamount,'String','.');
    pause(.2)
    set(handles.editamount,'String','. .');
    pause(.2)
    set(handles.editamount,'String','. . .');
    pause(.2)

    set(handles.editamount,'String','Insert amount');
    return
end
set(handles.editmass,'String',''); %clear it
set(handles.editamount,'String',''); %clear it


index = get(handles.foodlist,'Value');

agents=handles.agents;
agents=[agents; handles.basetable(index,:)]; %add to the table
handles.agents=agents; %add to global
% Update handles structure
guidata(hObject, handles);

%refresh chosen table
list = get(handles.foodlist,'String');
adding = list{index};

clist = get(handles.chosenlist,'String');
n=length(clist);
clist{n+1}=[adding sprintf(' %dg',m)];
set(handles.chosenlist,'String',clist);

handles.startbtn.Visible='on';
if isequal(handles.chosenlist.Visible,'off')
    handles.chosenlist.Visible='on';
    handles.removbtn.Visible='on';
end

% --- Executes on button press in removbtn.
function removbtn_Callback(hObject, eventdata, handles)
index = get(handles.chosenlist,'Value');

if index <= size(handles.agents,1) %if table has anything
agents=handles.agents;
agents(index+1,:)=[]; %remove from table,water's first
handles.agents=agents; %add to global
% Update handles structure
guidata(hObject, handles);

%refresh chosen table
clist = get(handles.chosenlist,'String');
if length(clist)==1
    handles.chosenlist.Visible='off';
    handles.removbtn.Visible='off';
end
clist(index)=[]; %remove empty
handles.chosenlist.Value=max(index-1,1);
set(handles.chosenlist,'String',clist);
end

% --- Executes on button press in startbtn.
function startbtn_Callback(hObject, eventdata, handles)
handles.textnext.Visible='on';
handles.texttime.Visible='on';

%run the simulation, not running here
% times=simulationStep(handles.agents);
% times=max(times);
% set(handles.textnext,'String',sprintf('%d s',times));


time=timer('ExecutionMode','FixedRate','Period',1,'StartDelay',1,...
    'TimerFcn',{@timestep},'UserData',handles);
start(time);

function hout=timestep(hObject,event)
% called in the timer
% pass handles
handles=hObject.UserData;
[t,handles]=simulationStep(handles);


t=str2double(get(handles.textnext,'String'));
set(handles.textnext,'String',sprintf('%d s',t+1));
%update the plot
temperatures=handles.temperature_grapher;
n=length(temperatures);

plot(handles.axesWindow,1:n,temperatures)
hout=handles;
% update any changes
set(hObject,'UserData',handles);
    
function [times,handles]=simulationStep(handles)
% save constants here
global Ts
Ts=0.2;
agents=handles.agents;
temperature_grapher=handles.temperature_grapher;

c_pwater=agents(1,4);
% water temperature change from energy
heatWater=@(T,dE) dE/c_pwater*(T<=373); % when it's boiling, temp don't grow
                            %temperature W  %temp ag1 %temp ag2 

agents(:,5)=agents(:,5)+273; %conversion to Kelvin
hot=zeros(size(agents,1)-1,1); %check if we reached temperature
times=zeros(length(hot),1);

% as an ingredient is added, add it to the "agents" array 
%calculate temperature using agent's heat capacity and mass and energy
% loop
for i=1:1/Ts % 1 second step
    % simulating the ingredient and water temperature - getting the sums of
    % their respective thermical interactions - calculate temperature
    % change and new temperature
	
	water = agents(1,:); % first element
    Twater = water(5);
    deltaWater = heatAgent(water,500); %energy from flame
    
    n=size(agents,1);
    for line=2:n
		% simulate effect of every ingredient with water surrounding it
        [deltaTemp,deltaEnergy] = heatAgent(agents( line, : ), Twater );
        agents(line,5)=agents(line,5) + deltaTemp;
        
%         if agents(line,5) > (98+273) && hot(line-1)==0
%             hot(line-1)=1;
%             timehot(line-1)=i; %remember first time it reaches
%         end
        
		deltaWater = deltaWater - deltaEnergy;		
    end
%     cla
%     plot(1:i,temperature_grapher(1:i,1),'.');
%     hold on
%     plot(1:i,temperature_grapher(1:i,2),'o');
%     legend({'Water','Food'},'Location','southeast')
    
    %difference from heating and effects of ingredients
    Twater = Twater + heatWater(Twater,deltaWater);
	agents(1,5) = Twater;
    
end
%store new temperatures in temperature_grapher
temperature_grapher = [temperature_grapher agents(:,5)]; 

agents(:,5)=agents(:,5)-273; %conversion from Kelvin
handles.agents=agents;
handles.temperature_grapher=temperature_grapher;


function [dT,dE]=heatAgent(values,environment)
global Ts
% compute heat flux between object and environment's at given temperature
mass=values(1);   
density=values(2);
surface=values(3);
heat_cap=values(4);
temp=values(5);

c_m = mass*heat_cap;          %specific heat influence
c_v = surface/(mass*density); %surface to volume ratio

dE=(environment-temp)*c_v*Ts;    %energy flux
dT=dE/c_m*Ts;                    %temperature change
