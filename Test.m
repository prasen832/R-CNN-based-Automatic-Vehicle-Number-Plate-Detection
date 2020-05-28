clc
clear all
close all

b=imread('HDCAR22.jpg');


b=imresize(b,[200,300]);
figure
imshow(b)

% B=imcrop(b,[40,65,180,40]);           % car

% C=imcrop(c,[85,120,85,25]);            % car2

% B=imcrop(b,[200,280,475,110]);           % car4

% B=imcrop(b,[180,280,475,135]);           % car1

% B=imcrop(b,[100,128,75,25]);           % car3

% B=imcrop(b,[100,100,100,40]);   % car6
% 
% B=imcrop(b,[80,60,160,40]);    % car5

% B=imcrop(b,[140,50,160,55]);    % car7

% B=imcrop(b,[40,40,240,90]);   % car8

% B=imcrop(b,[90,80,130,45]);   % car9

% B=imcrop(b,[160,80,80,30]);   % car10

% B=imcrop(b,[70,100,125,30]);   % car11

% B=imcrop(b,[70,77,125,40]);   % car12

% B=imcrop(b,[80,75,160,50]);   % car13

% B=imcrop(b,[70,100,140,40]);   % car14

% B=imcrop(b,[70,90,120,40]);   % car15

%  B=imcrop(b,[120,65,120,40]);   % car16
 
%  B=imcrop(b,[40,60,200,60]);   % car17
 
% B=imcrop(b,[80,100,100,40]);   % car18

% B=imcrop(b,[70,120,120,40]);   % car19

% B=imcrop(b,[130,90,80,30]);   % car21

B=imcrop(b,[130,90,80,30]);   % car21
figure
imshow(B)