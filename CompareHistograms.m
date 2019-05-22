function [d] = CompareHistograms(image1,image2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
image1 = imfilter(image1,fspecial('average',[15 15]));
image2 = imfilter(image2,fspecial('average',[15 15]));
i1=image1(:,:,1);
[c1,n]=imhist(i1);
c1=c1/size(i1,1)/size(i1,2);
i2=image2(:,:,1);
[c2,n2]=imhist(i2);
c2=c2/size(i2,1)/size(i2,2);
d=pdist2(c1',c2','cosine');
end

