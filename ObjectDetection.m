function Objects = ObjectDetection(Picture,FilenameHaarcasade,Options)

% The default Options
defaultoptions=struct('ScaleUpdate',1/1.25,'Resize',true,'Verbose',true);

% Add subfunction path to Matlab Search Path
functionname='ObjectDetection.m';
functiondir=which(functionname);
functiondir=functiondir(1:end-length(functionname));
addpath([functiondir '/SubFunctions'])

% Check inputs
if(ischar(Picture))
    if(~exist(Picture,'file'))
        error('face_detect:inputs','Image not Found');
    end
end
if(~exist(FilenameHaarcasade,'file'))
    error('face_detect:inputs','Haarcasade not Found');
end

% Process input options
if(~exist('Options','var')), Options=defaultoptions;
else
    tags = fieldnames(defaultoptions);
    for i=1:length(tags)
        if(~isfield(Options,tags{i})), Options.(tags{i})=defaultoptions.(tags{i}); end
    end
    if(length(tags)~=length(fieldnames(Options)))
        warning('image_registration:unknownoption','unknown options found');
    end
end

% Read the Picture from file if Picture is a filename
if(ischar(Picture))
    Picture = imread(Picture);
end

% Get the HaarCasade for the object detection
HaarCasade=GetHaarCasade(FilenameHaarcasade);

% Get the integral images
IntergralImages= GetIntergralImages(Picture,Options);

Objects = HaarCasadeObjectDetection(IntergralImages,HaarCasade,Options);

% Show the finale results
if(nargout==0)
    ShowDetectionResult(Picture,Objects);
end




