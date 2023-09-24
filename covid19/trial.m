clear all;
clc;

load('ResNet50_1_among_10_folds.mat');



image = imread('c6.jpeg');
aug = augmentedImageDatastore([224 224],image, 'ColorPreprocessing', 'gray2rgb' );




% figure;
%imshow(aug);
[YPred,probs] = classify(netTransfer,aug)
imshow(image);
title(sprintf("%s (%.2f)", YPred, probs(YPred)));



analyzeNetwork(netTransfer)





