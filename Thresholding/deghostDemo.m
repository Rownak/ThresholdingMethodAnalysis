% Deghost demo

image = imread('camera_cap_2.jpg');
image = rgb2gray(image);

bw = bradley(image, [300 300], 20);
bw2 = deghost(image, bw, 8, 4, 0.042);

imshow([mat2gray(image), bw, bw2]);

h=text(110 ,15 ,'Original');
set(h,'FontSize',20, 'Color', [1,0,0], 'BackgroundColor', [1 1 1])

h=text(380 ,15 ,'Bradley binarization');
set(h,'FontSize',20, 'Color', [1,0,0], 'BackgroundColor', [1 1 1])

h=text(690 ,15 ,'Without ghosts');
set(h,'FontSize',20, 'Color', [1,0,0], 'BackgroundColor', [1 1 1])