clc
clear all
close all

load MYCNN             % Load Pre-Trained Neural Network

a=imread('HDCAR22.jpg');  % Load Target Image 
a=imresize(a,[400,500]);    % Resizeing for Large Images
figure
imshow(a)                          % Show Target Image
title('Original Input Image');


[bbox,score,label]=detect(MYCNN,a,'minibatch',32);  % Detecting Number Plate in Target Image

[score,idx] =max(score);    % Getting Confidence Value

bbox=bbox(idx,:);   % Getting Bounding Box values

annotation=sprintf('%s:(Confidence=%f)',label(idx),score); % Showimg Annotation in Target Image

DetImg=insertObjectAnnotation(a,'rectangle',bbox,annotation); % Inserting Bounding Box in Target Image

figure            % Showing Target Image with Bounding Box
imshow(DetImg)
title('Image with Detected Bounded Box');

C=imcrop(DetImg,bbox);        % Image Cropped for Number Plate
figure
imshow(C)
title('Extracted Number Plate');

R=imresize(C,[100,200]);     % Enlarged Cropped Number Plate
figure
imshow(R)
title('Enlarged Cropped Number Plate');




