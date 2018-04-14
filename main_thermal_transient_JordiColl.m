%%-------------------------------------------------------------------------
%                   R70198R  Spacecraft Subsystems
%                   Lulea University of Technology
%                     Teacher: Leonard Felicetti  
%%-------------------------------------------------------------------------
%      Optional Assignment 1: Thermal Transient - Numerical Analysis
%%-------------------------------------------------------------------------
%                     Student: Jordi Coll Ortega
%%-------------------------------------------------------------------------
%                          Date: April 2018
%%-------------------------------------------------------------------------

clear all 
close all
clc

global r m alpha epsilon c qs Ae Aa sigma S

%% Inputs
r = 1; % [m] Spherical Satellite Radius
m = 100; % [kg] Satellite mass
alpha = 0.25; % absorptivity coefficient
epsilon = 0.25; % emissivity coefficient
c = 900; % [J/(Kg*K)] Thermal capacity
qs = 200; % [W] Internal heat source
sigma = 5.67e-8; % [W/(m^2*K^4)] Stefan-Boltzmann constant
Ae = 4*pi*r^2; % Emission surface (Whole sphere surface)
Aa = pi*r^2; % Absorption surface (Perpendicular section to the flux direction)

h = 600; % [km] Orbit altitude
Re = 6371; % [km] Earth radius
MUe = 398600; % [m^3/s^2] Standard Gravitational parameter
T0 = 10 + 273; % [K] Initial temperature
n = 2; % Number of Orbital Periods

%% Processing
T_orb = 2*pi*((h+Re)^3/MUe)^(1/2);          % Orbital period
T_ecl = T_orb*(2*asin(Re/(Re+h)))/(2*pi);   % Eclipse period
T_sun_ill = T_orb - T_ecl;                  % Sun-illuminated period

% Auxiliary variables initialization
length1=1;
last_time=0;

for i=1:n
    %%----------------------- Eclipse phase -------------------------------
    S=0; % [W/m^2] Solar flux
    if i==1
        tspan = [0 : 1: T_ecl];
        y0 = [T0];
        options = odeset('RelTol',1e-8,'AbsTol',1e-8 );
        [time_eclipse,T_eclipse] = ode45(@sun,tspan,y0,options);
    else
        T0 = T_sun(end);
        tspan = [0 : 1: T_ecl];
        y0 = [T0];
        options = odeset('RelTol',1e-8,'AbsTol',1e-8 );
        [time_eclipse,T_eclipse] = ode45(@sun,tspan,y0,options);
    end
    % Time and Temperature vector building
    length2=length(T_eclipse);
    for j=1:length2
        time(j-1+length1) = time_eclipse(j)+last_time;
        T(j-1+length1) = T_eclipse(j);
    end
    length1=length(time);
    last_time=time(end);
    
    %%-------------------- Sun illuminated phase --------------------------
    S = 1371; % [W/m^2] Solar flux
    T0 = T_eclipse(end);
    tspan = [0 : 1: T_sun_ill];
    y0 = [T0];
    options = odeset('RelTol',1e-8,'AbsTol',1e-8 );
    [time_sun,T_sun] = ode45(@sun,tspan,y0,options);
    
    % Time and Temperature vector building
    length2=length(T_sun);
    for j=1:length2
        time(j-1+length1) = time_sun(j)+last_time;
        T(j-1+length1) = T_sun(j);
    end
    length1=length(time);
    last_time=time(end);
end

%% Plotting
figure('Name','Temperature variation')
plot(time/60,T-273) % min
% plot(time/(60*60*24),T-273) % days
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid

%% Workspace saving
% save('qs800.mat');



