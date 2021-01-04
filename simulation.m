function times=simulation(agents)
% save constants here
i=1;

% water temperature change from energy
heatwater=@(T,dE) dE/10*(T<=373); % when it's boiling, temp don't grow
                            %temperature W  %temp ag1 %temp ag2 
temperature_grapher = [                    
                                                                                                                            
];

agents(:,5)=agents(:,5)+273; %conversion to Kelvin
hot=zeros(size(agents,1)-1,1); %check if we reached temperature
timehot=zeros(length(hot),1);

% as an ingredient is added, add it to the "agents" array 
%calculate temperature using agent's heat capacity and mass and energy
% loop
while ~all(timehot) %temperature threshold, each agent must have specific?
    
    % simulating the ingredient and water temperature - getting the sums of
    % their respective thermical interactions - calculate temperature
    % change and new temperature
    n=size(agents,1);
	
	water = agents(1,:); % first element
	deltaWater = heat(water,500); %energy from flame
    for line=2:n
		% simulate effect of every ingredient with water surrounding it
        [deltaTemp,deltaEnergy] = heat(agents( line, : ), water(5) );
        agents(line,5)=agents(line,5) + deltaTemp;
        
        if agents(line,5) > (98+273) && hot(line-1)==0
            hot(line-1)=1;
            timehot(line-1)=i; %remember first time it reaches
        end
        
		deltaWater = deltaWater - deltaEnergy;		
    end
    
    %store new temperatures in temperature_grapher
    temperature_grapher(i,:) = agents(:,5)-273; 
        
    %{ 
        onclickGUI()
            agents(size(agents,1)+1,:)= [ 1 1 1 1 1]; %add new agent
            temperature_grapher(:,size(agents,2))= zeros(1,size(temperature_grapher,1);           %add new agent to history, as many lines of zeroes as the seconds passed
    %}
    
%     cla
%     plot(1:i,temperature_grapher(1:i,1),'.');
%     hold on
%     plot(1:i,temperature_grapher(1:i,2),'o');
%     legend({'Water','Food'},'Location','southeast')
    
    %difference from heating and effects of ingredients
    water(5) = water(5)+ heatwater(water(5),deltaWater);
	agents(1,5) = water(5);
    
    i=i+1;
    
end;
times=timehot;
end