function [M num res bb] = DetectRectangles(O)
I = rgb2gray(O);
R = I >= 250;
R = medfilt2(R,[15 15]);
X = ~ R;
X = imerode(X,strel('rectangle',[20 20]));
X = imfill(X,'holes');
box=regionprops(X,'Area','BoundingBox');
a = [box.Area];
bb = vertcat(box(:).BoundingBox);
bb = bb(:,3) .* bb(:,4);
a = transpose(a);
filter = (a ./ bb) >= 0.95;
res = find(filter);
[M num] = bwlabel(X);
bb=regionprops(M,'BoundingBox','Area');
end

