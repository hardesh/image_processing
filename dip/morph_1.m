img = imread('moon.tif');
threshold = graythresh(img);

[r,c] = size(img);
mask = imbinarize(img,threshold);
% Changing the threshold will change the black and white areas in the image

% we cannot use im2double to convert mask image into double image
mask_double = zeros(r,c);

for i=1:r
    for j=1:c
        if mask(i,j) == 1
            mask_double(i,j) = 1;
        end
    end
end

final_img = im2double(img) .* mask_double;
%imshowpair(img, mask,'montage')
subplot(1,3,1), imshow(img);
subplot(1,3,2), imshow(mask);
subplot(1,3,3), imshow(final_img);