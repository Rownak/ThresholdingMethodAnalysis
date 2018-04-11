%input image
image1 = imread('camera_cap_1.jpg');
image2 = imread('camera_cap_2.jpg');
%convert to grayscale
image1 = rgb2gray(image1);
image2 = rgb2gray(image2);


sauvolaThres1 = sauvola(image1, [100 100]);
sauvolaThres2 = sauvola(image2, [100 100]);

subplot(1,2,1), imshow(sauvolaThres1);
subplot(1,2,2), imshow(sauvolaThres2);
% Write image to graphics file. 
imwrite(sauvolaThres2,'G:\Image Processing\Starting\Thresholding\sauvolaThres2.jpg');
