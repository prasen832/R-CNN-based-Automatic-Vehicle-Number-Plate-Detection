clc
clear all
close all

a=imread('IM.jpg');       % Load Sample Image
figure
imshow(a)              % Display Sample Image


sample1={'car3.jpg';'car.jpg';'car2.jpg';'car4.jpg';'car1.jpg';'car5.jpg';...
    'car6.jpg';'car7.jpg';'car8.jpg';'car9.jpg';'car10.jpg';'car11.jpg';'car12.jpg';...
    'car13.jpg';'car14.jpg';'car15.jpg';'car16.jpg';'car17.jpg';'car18.jpg';...
    'car19.jpg';'car21.jpg'};    % Images for Training

NumPlate={[100,128,75,25];[40,65,180,40];[85,120,85,25];[200,280,475,110];[180,280,475,135];[80,60,160,40];...
    [100,100,100,40];[140,50,160,55];[40,40,240,90];[90,80,130,45];[160,80,80,30];[70,100,125,30];[70,77,125,40];...
    [80,75,160,50];[70,100,140,40];[70,90,120,40];[120,65,120,40];[40,60,200,60];[80,100,100,40];...
    [70,120,120,40];[130,90,80,30]};   % Corresponding locations of Number Plate [Xmin Ymin Width Height]

label=table(sample1,NumPlate);  % Table

imdr=fullfile('G:\IIT M Tech\DIP');    % Image Directory

net=alexnet;        % Load Alexnet

options=trainingOptions('sgdm','MiniBatchSize',32,'InitialLearnRate',1e-6,'MaxEpochs',10); % Training Options

train=trainRCNNObjectDetector(label,net,options,'NegativeOverlapRange',[0 0.3]);    % Training using RCNN

[bbox,score,label]=detect(train,a,'minibatch',32);   % Detecting Number Plate in Sample Image

[score,idx] =max(score);    % Getting Confidence Value

bbox=bbox(idx,:); % Getting Bounding Box values

annotation=sprintf('%s:(Confidence=%f)',label(idx),score);  % Putting Annotations

DetImg=insertObjectAnnotation(a,'rectangle',bbox,annotation);  % Inserting Bounding BOX in Sample Image

% MYCNN=train;   % Saving into New Neural Network
% save MYCNN


figure            % Showing Sample Image with Bounding Box
imshow(DetImg)

C=imcrop(DetImg,bbox);  % Image Cropped for Number Plate 
figure
imshow(C)
