clc
clear all
close all

a=imread('IM.jpg');
figure
imshow(a)


sample1={'car11.jpg';'car3.jpg'};

NumPlate={[70,100,125,30];[100,128,75,25]};

label=table(sample1,NumPlate);

imdr=fullfile('G:\IIT M Tech\DIP');


net=alexnet;

options=trainingOptions('sgdm','MiniBatchSize',32,'InitialLearnRate',1e-6,'MaxEpochs',10);

train=trainRCNNObjectDetector(label,net,options,'NegativeOverlapRange',[0 0.3]);

[bbox,score,label]=detect(train,a,'minibatch',32);

[score,idx] =max(score);

bbox=bbox(idx,:);

annotation=sprintf('%s:(Confidence=%f)',label(idx),score);

DetImg=insertObjectAnnotation(a,'rectangle',bbox,annotation);

figure
imshow(DetImg)

C=imcrop(DetImg,bbox);
figure
imshow(C)

prasen=train;
save prasen