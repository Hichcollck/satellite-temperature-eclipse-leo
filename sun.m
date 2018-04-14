function [dT] = sun(t,T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global r m alpha epsilon c qs Ae Aa sigma S

dT=epsilon/(m*c)*((alpha/epsilon)*Aa*S-Ae*sigma*T^4)+qs/(m*c);
end

