%%-------------------------------------------------------------------------
%                   R70198R  Spacecraft Subsystems
%                   Lulea University of Technology
%                     Teacher: Leonard Felicetti  
%%-------------------------------------------------------------------------
%      Optional Assignment 1: Thermal Transient - Numerical Analysis
%                        PLOTTING THE VARIATIONS
%%-------------------------------------------------------------------------
%                     Student: Jordi Coll Ortega
%%-------------------------------------------------------------------------
%                          Date: April 2018
%%-------------------------------------------------------------------------

clear all 
close all
clc

%% Radius r
figure('Name','Radius variation')
hold on
load('r01.mat');
plot(time/60,T-273) % min
load('r07.mat');
plot(time/60,T-273) % min
load('r1.mat');
plot(time/60,T-273) % min
load('r2.mat');
plot(time/60,T-273) % min
load('r6.mat');
plot(time/60,T-273) % min
load('r10.mat');
plot(time/60,T-273) % min
hold off
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid
legend('r=0.1m','r=0.7m','r=1m','r=2m','r=6m','r=10m')

%% Orbit altitude h
figure('Name','Orbit altitude variation')
hold on
load('h200.mat');
plot(time/60,T-273) % min
load('h400.mat');
plot(time/60,T-273) % min
load('h600.mat');
plot(time/60,T-273) % min
load('h800.mat');
plot(time/60,T-273) % min
load('h1000.mat');
plot(time/60,T-273) % min
hold off
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid
legend('h=200km','h=400km','h=600km','h=800km','h=1000km')

%% Initial temperature T0
figure('Name','Initial Temperature variation')
hold on
load('Tm10.mat');
plot(time/60,T-273) % min
load('T0.mat');
plot(time/60,T-273) % min
load('T10.mat');
plot(time/60,T-273) % min
load('T20.mat');
plot(time/60,T-273) % min
load('T30.mat');
plot(time/60,T-273) % min
hold off
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid
legend('T_0=-10ºC','T_0=0ºC','T_0=10ºC','T_0=20ºC','T_0=30ºC')

%% Thermal capacity C
figure('Name','Thermal capacity variation')
hold on
load('C100.mat');
plot(time/60,T-273) % min
load('C600.mat');
plot(time/60,T-273) % min
load('C900.mat');
plot(time/60,T-273) % min
load('C1500.mat');
plot(time/60,T-273) % min
load('C2000.mat');
plot(time/60,T-273) % min
hold off
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid
legend('C=100 J/(Kg*K)','C=600 J/(Kg*K)','C=900 J/(Kg*K)','C=1500 J/(Kg*K)','C=2000 J/(Kg*K)')

%% Mass m
figure('Name','Mass variation')
hold on
load('m10.mat');
plot(time/60,T-273) % min
load('m60.mat');
plot(time/60,T-273) % min
load('m100.mat');
plot(time/60,T-273) % min
load('m300.mat');
plot(time/60,T-273) % min
load('m600.mat');
plot(time/60,T-273) % min
load('m1000.mat');
plot(time/60,T-273) % min
hold off
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid
legend('m=10kg','m=60kg','m=100kg','m=300kg','m=600kg','m=1000kg')

%% Internal heat qs
figure('Name','Internal heat variation')
hold on
load('qs50.mat');
plot(time/60,T-273) % min
load('qs100.mat');
plot(time/60,T-273) % min
load('qs200.mat');
plot(time/60,T-273) % min
load('qs400.mat');
plot(time/60,T-273) % min
load('qs800.mat');
plot(time/60,T-273) % min
hold off
xlabel('Time [min]')
ylabel('Temperature [ºC]')
grid
legend('Qs=50W','Qs=100W','Qs=200W','Qs=400W','Qs=800W')


