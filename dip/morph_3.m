% Finding no of coins
clc;
clear all;

% coins = imread('Coins.jpg');
% gray = rgb2gray(coins);
% threshold = graythresh(gray);
% bw image can also be obtained from im2bw
%bw = imbinarize(gray, threshold);
% bw = im2bw(coins);
% [r, c] = size(bw);
% bw = imfill(~bw, 'holes');
% matone = ones(r,c);
% se = strel('disk', 5);
% bw = matone-bw;
% bw = imclose(bw,se);
% bw = imfill(matone-bw);
% imshow(bw);

% eroded_img = imerode(matone-bw, se);
% eroded_img = imfill(eroded_img);
% se = strel('disk', 20);
% eroded_img = imerode(eroded_img, se);
% imshow(eroded_img)

% stat = regionprops(bw, 'Centroid', 'MajoraxisLength', 'MinoraxisLength');
% centers = stat.Centroid;
% diameters = mean([stat.MajorAxisLength stat.MinorAxisLength],2);
% radiuses = diameters / 2

coins = imread('Coins.jpg');
bw = im2bw(coins);
% imshow(~bw);
[r,c] = size(bw);

bw_fill = imfill(~bw, 'holes');
% imshow(bw_fill);
se1 = strel('disk', 20);
bw = imclose(bw_fill, se1);
% imshow(bw);
se2 = strel('disk', 80);
bw = imerode(bw, se2);
se3 = strel('disk', 20);
bw = imdilate(bw,se3);
%imshow(bw)

[L, Ne] = bwlabel(bw, 8);
prop = regionprops(L, 'Area', 'Centroid');

for n = 1:size(prop,1)
    pos(n,:) = int16(prop(n).Centroid);
    text{n} = ['coin:' num2str(n)];
end

coin_marked = insertText(coins, pos, text, 'FontSize', 25, 'BoxColor', 'yellow', 'BoxOpacity', 0.4, 'TextColor', 'green');
imshow(coin_marked);
