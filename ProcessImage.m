function [count] = ProcessImage(I,mode)
templates_path = 'TestCases\Temp';
%% Determine Mode %%
    if (mode == 'N')
        I = Noisy(I);
        [label num res bb] = DetectRectangles(I);
    end
    if(mode == 'D' || mode == 'R')
        [label num res bb] = DetectRectangles(I);
        
    elseif (mode == 'S') 
            [label num res bb] = SeparateRectangles(I);
    end       
    %%
    d = zeros(size(I)); %initializing output image with all rectangles
    count_map = InitializeCountMap();
    total_count = 0;
    %looping through number of objects segmented
    for i = 1: num
        if(ismember(i,res)) %if object is a rectangle
            x = label == i; % get places of objects in image
            % Add to the final output the object part
            d(:,:,1) =  (uint8(x).*I(:,:,1));
            d(:,:,2) =  (uint8(x).*I(:,:,2));
            d(:,:,3) =  (uint8(x).*I(:,:,3));

            %% CROPPING %%
            thisBB = bb(i).BoundingBox; % detect boundary box of current rectangle
            I2=imcrop(d,[thisBB(1),thisBB(2),thisBB(3),thisBB(4)]); %I2 is a cropped image with the corresponding bbs
            [rows cols depth]=size(I2);
            croppedImage = uint8(I2);

            %% CURRENCY DETECTION %%%
            max_acc = 0;
            max_file_name = ""; %% template file that matches the maximum accuracy
            files = getAllFiles(templates_path);
            for j = 1: size(files,1)
                template = imread(char(files(j))); % Template image(i) reading 
                accuracy = 1 - CompareHistograms(template,uint8(croppedImage));
                if accuracy > max_acc
                    max_acc = accuracy;
                    max_file_name = char(files(j));
                end
            end
                type = ClassifyCurrency(max_file_name);
                total_count = total_count + type;
                count_map(num2str(type)) = count_map(num2str(type)) + type;


                %figure,imshow(uint8(croppedImage));
                %title(max_acc*100 + "%" + " - Classification Output : " + type + "EGP");

        end % IF
        %display(total_count);
         %FOR DEBUGGING      
                         %figure , subplot(1,2,1), imshow(uint8(croppedImage)),
                         %title(max_acc*100 + "%" + " - Classification Output : " + type + "EGP"),
                         %subplot(1,2,2) , imshow(max_file_name), title("Matched Template");
            
    end %FOR object
    %figure,imshow(I) , title("Total Count : "+ num2str(total_count));
    %% Display Count Map %%
    display("0.5 : " + count_map('0.5')/0.5);
    display("1 : " + count_map('1')/1);
    display("5 : "+ count_map('5')/5) ;
    display("10 : " + count_map('10')/10);
    display("20 : " + count_map('20')/20) ;
    display("50 : " + count_map('50')/50) ;
    display("100 : " + count_map('100')/100) ;
    display("200 : " + count_map('200')/200) ;
    count = total_count;
end

