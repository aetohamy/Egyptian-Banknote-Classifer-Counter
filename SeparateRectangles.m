function [M num res bb] = SeparateRectangles(I)
x = rgb2gray(I);
x=im2bw(x,0.99);
BW = edge(x,'canny');
A = imfill(BW,'holes');
A = imerode(A,strel('rectangle',[180 180]));
box=regionprops(A,'Area','BoundingBox');
a = [box.Area];
bb = vertcat(box(:).BoundingBox);
bb = bb(:,3) .* bb(:,4);
a = transpose(a);
filter = (a ./ bb) >= 0.5;
res = find(filter);
[M num] = bwlabel(A);
bb=regionprops(M,'BoundingBox','Area');
end


