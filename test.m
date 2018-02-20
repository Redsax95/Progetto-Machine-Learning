ConvertHaarcasadeXMLOpenCV('HaarCascades/haarcascade_frontalface_alt.xml');

fileFolder = fullfile('Images');
dirOutput = dir(fullfile(fileFolder,'*.pgm'));
fileNames = {dirOutput.name}';
numFrames = numel(fileNames);
s1 = 'Images/';

for i=1:numFrames
    s = strcat(s1,fileNames{i});
    I = imread(s);
    FilenameHaarcasade = 'HaarCascades/haarcascade_frontalface_alt.mat';
    Objects=ObjectDetection(I,FilenameHaarcasade);
    ShowDetectionResult(I,Objects);
end