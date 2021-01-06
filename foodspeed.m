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
 
% Last Modified by GUIDE v2.5 06-Jan-2021 22:39:11
 
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

global agents
% table of chosen ingredients
              %  mass       density         surface         heat cap.     T
        agents =  [  500           1            20                15          85 ];     %water
 
handles.basetable=[  5           1            1                1          -2      ;...         %Egg
                     3           3            0.2               1          -5     ;... %Carrot
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




% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=timerfindall; stop(a); delete(a); %remove timer
% Hint: delete(hObject) closes the figure
delete(hObject);

 
% --- Executes on button press in addbtn.
function addbtn_Callback(hObject, eventdata, handles)
global agents flag
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
flag=1; %just add another
 
% agents=handles.agents;
agents=[agents; handles.basetable(index,:)]; %add to the table
% handles.agents=agents; %add to global
% Update handles structure, not needed?
% guidata(hObject, handles);
 
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
global agents flag
index = get(handles.chosenlist,'Value');
 
if index <= size(agents,1) %if table has anything
% agents=handles.agents;

%two following lines should execute simulatenously,
%since there might be a race condition (I got it during debugging)
%thanks to matlab timers :( :( :(
flag=-index;
agents(index+1,:)=[]; %remove from table,water's first
% handles.temperature_grapher(index+1,:)=[]; %apparently doesn't make sense

% handles.agents=agents; %add to global

% Update handles structure, not neccesary now?
guidata(hObject, handles);
 
%refresh chosen table
clist = get(handles.chosenlist,'String');
if length(clist)==1
    handles.chosenlist.Visible='off';
    handles.removbtn.Visible='off';
end

%remove from list
clist(index)=[];

%update list value
handles.chosenlist.Value=max(index-1,1);
set(handles.chosenlist,'String',clist);
end
 
% --- Executes on button press in startbtn.
function startbtn_Callback(hObject, eventdata, handles)
handles.textnext.Visible='on';
handles.texttime.Visible='on';
 
time=timer('ExecutionMode','FixedRate','Period',1,'StartDelay',1,...
    'TimerFcn',{@timestep},'UserData',handles);
start(time);
 
function hout=timestep(hObject,event)
% called in the timer
% pass handles
handles=hObject.UserData;
[t,handles]=simulationStep(handles);

%run whole simulation to get time estimates, not implemented yet
% times=simulationStep(handles.agents);
% times=max(times);
% set(handles.textnext,'String',sprintf('%d s',times));
 
 
t=str2double(get(handles.textnext,'String'));
set(handles.textnext,'String',sprintf('%d s',t+1));
%update the plot
temperatures=handles.temperature_grapher;
n=size(temperatures,2);

H=handles.axesWindow;%shorthand for plot pointer

if n<10
% I was wrong, it has to be transposed' to work
plot(H,0:n-1,temperatures','o--')
else %different symbol, so it looks better
plot(H,0:n-1,temperatures','.-')
end
xlim(H,[-1 n+0.5])

%take legend form list
legend(H,{'Water',handles.chosenlist.String{:}},'Location','SouthEast')
grid(H,'on')
grid(H,'minor')

hout=handles;
% update any changes
set(hObject,'UserData',handles);
 
function [times,handles]=simulationStep(handles)
% save constants here
global Ts agents flag
Ts=0.2;
% agents=handles.agents;
temperature_grapher=handles.temperature_grapher;
 
c_pwater=agents(1,4);
% water temperature change from energy
 
agents(:,5)=agents(:,5)+273; %conversion to Kelvin
 
heatWater=@(T,dE) dE/c_pwater*(T<=373); % when it's boiling, temp don't grow
                            %temperature W  %temp ag1 %temp ag2 
 
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
    [x,deltaWater] = heatAgent(water,1000); %energy from flame
 
    n=size(agents,1);
    for line=2:n
		% simulate effect of every ingredient with water surrounding it
        [deltaTemp,deltaEnergy] = heatAgent(agents( line, : ), Twater );
        agents(line,5)=agents(line,5) + deltaTemp; %Euler explicit step
 
%         if agents(line,5) > (98+273) && hot(line-1)==0
%             hot(line-1)=1;
%             timehot(line-1)=i; %remember first time it reaches
%         end
 
		deltaWater = deltaWater - deltaEnergy;		
    end 
 
    %difference from heating and effects of ingredients
    %heatwater uses specific heat influence and energy flux
    Twater = Twater + heatWater(Twater,deltaWater);
    agents(1,5) = Twater;
 
end
agents(:,5)=agents(:,5)-273; %conversion from Kelvin
%store new temperatures in temperature_grapher
if flag==0
temperature_grapher = [temperature_grapher agents(:,5)]; 
elseif flag < 0 %removing, flag is negative index we remove
idx=-flag;
temperature_grapher(idx+1,:)=[];%cut it off, idx+1 since water is number 1
temperature_grapher = [temperature_grapher agents(:,5)]; 
else %add zeros
if isempty(temperature_grapher) %0th step, where we don't have anything yet
    temperature_grapher = [temperature_grapher agents(:,5)]; 
else
    [nagent,nsteps]=size(temperature_grapher);
    temperature_grapher = [temperature_grapher agents(1:nagent,5);...
                        zeros(1,nsteps) agents(nagent+1,5)]; %add below, with zeros before,
                                                           %since matrix must have at least zeros    
end
end
flag=0; %finished adding/removing
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