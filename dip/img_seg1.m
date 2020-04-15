clc;
clear all;

image = zeros(500,500);
image(1,1) = 1;
image(1,500) = 1;
image(500,1) = 1;
image(500,500) = 1;
image(250,250) = 1;

% imshow(image)
[H, T, R] = hough(image,'Theta',-90:0.01:89);

subplot(2,1,1);
imshow(image);
subplot(2,1,2);
imshow(imadjust(rescale(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
title('Hough transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot);