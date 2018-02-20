This code is an implementation of the Face Detection in the Viola-Jones framework. 
In this framework Haar-like features are used for rapid object detection. 
It supports the trained classifiers in the XML files of OpenCV,
which can be download as part of the OPENCV software on opencv.willowgarage.com.

To use this project you should download the entire repository.

To run this code there are two ways:

1) For one single image (also taken from the dataset):

First at all, copy your image into the 'Images' directory
Then use these instructions in MATLAB:

ConvertHaarcasadeXMLOpenCV('HaarCascades/haarcascade_frontalface_alt.xml');
I = imread('Images/complete_name_of_your_image');
FilenameHaarcasade = 'HaarCascades/haarcascade_frontalface_alt.mat';
Objects=ObjectDetection(I,FilenameHaarcasade);
ShowDetectionResult(I,Objects);

2) For multiple image (only for the images taken from the dataset):

You should only run the script called 'test'.