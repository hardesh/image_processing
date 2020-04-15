%% Edge detection 

clc;
clear all;

% roberts(1) = [-1,0;0,1];
% roberts(2) = [0,-1;1,0];

img = imread('flower.jpg');
img_gray = rgb2gray(img);

ip = edge(img_gray, 'roberts');


%% line detection
% use operator for line detection create the operator first


