clc;
clear all;
link_img = imread('linkoln.jpg');
structuring_ele = strel('square', 3);
dilated_img = imdilate(link_img, structuring_ele);

boundary = dilated_img - link_img;

% Other methods can also be used to find the boundary of the image

imshowpair(link_img, boundary, 'montage');