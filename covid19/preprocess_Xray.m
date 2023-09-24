function Iout = preprocess_Xray(filename)

% Read the Filename
I = imread(filename);

% Some images might be RGB, convert them to Grayscale
if ~ismatrix(I)
    I=rgb2gray(I); 
end

% Replicate the image 3 times to create an RGB image
Iout = cat(3,I,I,I);

end