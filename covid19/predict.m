clear all;
clc;
load('ResNet50_1_among_10_folds.mat');


netName = "netTransfer";
net = eval(netName);

inputSize = net.Layers(1).InputSize(1:2);
classes = net.Layers(end).Classes;
layerName = activationLayerName(netName);

    im = imread('c1.jpeg');
    
   % Some images might be RGB, convert them to Grayscale 
    if ~ismatrix(im)
    im=rgb2gray(im); 
    end

% Replicate the image 3 times to create an RGB image
Iout = cat(3,im,im,im);
    
    
    imResized = imresize(Iout,[inputSize(1), NaN]);
    imageActivations = activations(net,imResized,layerName);
    
     scores = squeeze(mean(imageActivations,[1 2]));
    
  
        fcWeights = net.Layers(end-2).Weights;
        fcBias = net.Layers(end-2).Bias;
        scores =  fcWeights*scores + fcBias;
        
        [~,classIds] = maxk(scores,1);
        
        weightVector = shiftdim(fcWeights(classIds(1),:),-1);
        classActivationMap = sum(imageActivations.*weightVector,3);
   
    
    scores = exp(scores)/sum(exp(scores));     
    maxScores = scores(classIds);
    labels = classes(classIds);
    
    subplot(1,2,1)
    imshow(Iout)
    title(string(labels) + ", " + string(maxScores));
    
    subplot(1,2,2)
    CAMshow(Iout,classActivationMap)
    title(string(labels) + ", " + string(maxScores));
    
    drawnow
    