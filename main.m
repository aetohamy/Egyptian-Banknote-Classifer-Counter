% Determine where m-file's folder is.
folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));

%% CHANGE N TO RUN TEST CASE 
% N = 4 BONUS 1 Intersect
% N = 6 BONUS 3 Noisy 
[images mode] = RunTestCase(6); %Runs Test Case n and returns list of images in the directory and mode

for k = 1 : length(images)
    I = imread(images{k});
    
    if (mode == 'R')
        count = 0;
        Names = Rotation(I);
        for i = 1 : length(Names)
            Z = imread(Names{i});
            count = count + ProcessImage(Z,mode);
        end
        
    else
        count = ProcessImage(I,mode);
    end
   figure,imshow(I),title("Total Count : " + count);
end %IMAGE
