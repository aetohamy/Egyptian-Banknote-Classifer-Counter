function [Names] = Rotation(I)
%figure, imshow(I);
x = rgb2gray(I);
x=im2bw(x,0.99);
BW = edge(x,'canny');
A = imfill(BW,'holes');
%figure,imshow(A);
[L, num] = bwlabel(A);
RGB = label2rgb(L);
[h, w, ~] = size(I);
smallRatio = h*w*0.002;
counter='1';
Names= {}; 
for i=1:num
    x = uint8(L==i);
    f = sum(sum(x==1));
    if(f < smallRatio)
        continue;
    end
    d = zeros(size(I));
    d(:,:,1) = uint8(x).*I(:,:,1);
    d(:,:,2) = uint8(x).*I(:,:,2);
    d(:,:,3) = uint8(x).*I(:,:,3);

%     figure,imshow(uint8(d));
      BW = im2bw(uint8(d),0.004);
      [L1, n] = bwlabel(BW, 8);
      count_pixels_per_obj = sum(bsxfun(@eq,L1(:),1:n));
      [~,ind] = max(count_pixels_per_obj);  
      biggest_region = (L1==ind);

      %%%%%% 

       %%% getting orientation

       s  = regionprops(biggest_region, 'Orientation');
       data=s.Orientation;
       s1=counter;
       s2=".jpg";
       counter=char(counter+1);
       full=char(strjoin(s1+s2));
       Names{i} = full; 
       thisdir=[pwd,'\',mfilename];
       thisdir=thisdir(1:end-8);
       fullFileName = fullfile(thisdir,full);
       if data<0
            [rotated_image ] = imrotate(uint8(d),-data);
            II=im2bw(rotated_image);
            s=regionprops(II,'Area','BoundingBox');
            [~,ii] = sort([s.Area],'descend');
            out = imcrop(rotated_image,s(ii(1)).BoundingBox);
            imwrite(out,fullFileName);
            
            %figure,imshow(out);
       
       else
           II=im2bw(uint8(d));
           s=regionprops(II,'Area','BoundingBox');
           [~,ii] = sort([s.Area],'descend');
           out = imcrop(uint8(d),s(ii(1)).BoundingBox);
           imwrite(out,fullFileName);
            %figure,imshow(out);
       end

end
end