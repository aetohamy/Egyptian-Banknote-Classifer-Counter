function [medfilimg] = Noisy(I)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
medfilimg(:,:,1) = medfilt2(R,[5 5]);
medfilimg(:,:,2) = medfilt2(G,[5 5]);
medfilimg(:,:,3) = medfilt2(B,[5 5]);
%figure,imshow(medfilimg);
end